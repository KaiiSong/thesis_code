/* FinalizeData_DemandEstimates.do */
* This do file combines the purchases data with the instruments and otherwise prepares for estimation.
* Creates a .dta file at the hh-$TimeVar level for elasticity estimation
* This file can also be run on JPLinux. Make sure to have the appropriate Household-Panel and Purchases data.

include Code/SetGlobals.do // Used on JPLinux

/* MAKE DATA FOR DEMAND ESTIMATION */
*** If working with quarterly data, get the full set of household X quarter observations
if "$TimeVar" == "YQ" {
	use household_code year projection_factor using $Externals/Intermediate/Homescan/Household-Panel.dta,clear
	gen byte quarter = 1
	forvalues q = 2/4 {
		append using $Externals/Intermediate/Homescan/Household-Panel.dta
		replace quarter = `q' if quarter ==.
	}
	gen int YQ = yq(year,quarter)
	drop year quarter
	saveold $Externals/Intermediate/Homescan/Temp-Household-Panel-YQ.dta, replace
}

/* Get a full purchase dataset, including zeros for non-purchasers */
use household_code $TimeVar *_Purchased* *Price* ///
	using $Externals/Intermediate/Homescan/HH-$TimeVar-Purchases.dta, clear

** Create a rectangular dataset including all households and time periods
* Add households that purchased no beverages
if "$TimeVar" == "year" {
	merge m:1 household_code year using $Externals/Intermediate/Homescan/Household-Panel.dta, ///
		keepusing(projection_factor) keep(match master using)
}
if "$TimeVar" == "YQ" {
	merge m:1 household_code YQ using $Externals/Intermediate/Homescan/Temp-Household-Panel-YQ.dta, ///
		keepusing(projection_factor) keep(match master using)	
	erase $Externals/Intermediate/Homescan/Temp-Household-Panel-YQ.dta
}
assert _merge!=1 // No unmatched from purchases data, although there may be households that didn't purchase any drinks
drop _merge

* Missing in Purchases data means zero purchases. Replace missing with zero.
foreach unit in kg cals g_sugar {
	replace `unit'_Purchased=0 if `unit'_Purchased==.
}
foreach group in $SubstituteGroupList {
	replace kg_Purchased`group' = 0 if kg_Purchased`group'==.
}
foreach var in kg_Purchased_RMS kg_Purchased_XRMS {
	replace `var' = 0 if `var'==.
}

/* Merge all household data */
drop projection_factor
capture gen int year = yofd(dofq(YQ)) 
merge m:1 household_code year using $Externals/Intermediate/Homescan/Household-Panel.dta, ///
	keepusing(projection_factor county zip dma $Controls ///
	HHSampleMeanIncome lnIncome_Lead?) /// 
	keep(match master using)
assert _merge==3
drop _merge

/* Merge county and zip income */
merge m:1 county year using $Externals/Intermediate/Geographic/county-year.dta, keep(match master) keepusing(countyIncome)
assert _merge==3
drop _merge

	* NB just under 1% of observations from master don't match here.
merge m:1 zip year using $Externals/Intermediate/Geographic/zip-year.dta, keep(match master) keepusing(zipIncome) nogen

** Get logs of income variables
foreach var in countyIncome zipIncome { // 
	gen ln`var' = ln(`var')
	drop `var'
}

*********************************************
	
/* Merge price instruments */
**** Merge price instruments for SSBs
* Merge top purchases information
gen group = 0
merge m:1 household_code group county using $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta, ///
	keep(match master) keepusing(upc* upc_ver_uc* store_code_uc* Share*) nogen // ChainCodeForIV*

* Merge top purchases information for Hausman instruments
merge m:1 household_code group county using $Externals/Intermediate/Homescan/UPC-Household_Shares.dta, ///
	keep(match master) keepusing(Hupc* Hupc_ver_uc* HShare*) nogen 
drop group
	
** Set up own price instruments
local max_lag = 4
forvalues l = 0/`max_lag' {
	foreach var in $PriceVars $LOPriceVars $dmaPriceVars feature display {
		gen L`l'`var' = 0
	}
}


** Merge instruments
gen hold_$TimeVar = $TimeVar
forvalues l = 0/`max_lag' {
	display "Starting lag `l'."
	
	replace $TimeVar = hold_$TimeVar-`l'
	forvalues s = 1/40 { // 
		display "Starting s `s'."
		
		gen double upc = upc`s'
		gen byte upc_ver_uc = upc_ver_uc`s'
		gen long store_code_uc = store_code_uc`s'
		** Merge $PriceVars (by store)
		merge m:1 $TimeVar upc upc_ver_uc store_code_uc using $Externals/Intermediate/RMS/UPC-Store-Time_Instruments.dta, ///
			keep(match master) keepusing($PriceVars feature display) nogen
		
		** Merge $LOPriceVars (by county-chain)
		merge m:1 store_code_uc year using $Externals/Intermediate/RMS/Stores.dta, ///
			keepusing(ChainCodeForIV) keep(match master) nogen
		merge m:1 $TimeVar upc upc_ver_uc ChainCodeForIV county using ///
			$Externals/Intermediate/RMS/UPC-Chain-county-Time_Instruments.dta, ///
			nogen keep(match master) keepusing($LOPriceVars)
		
		** Add the newly merged UPCs to the instruments and merchandising variables.
		foreach var in $PriceVars feature display $LOPriceVars {
			replace L`l'`var' = L`l'`var' + `var'*Share`s' if `var' != .
		}
		drop store_code_uc ChainCodeForIV feature display $PriceVars $LOPriceVars 
		
		** Merge $dmaPriceVars (by dma)
		replace upc = Hupc`s'
		replace upc_ver_uc = Hupc_ver_uc`s'

		merge m:1 $TimeVar upc upc_ver_uc dma using ///
			$Externals/Intermediate/RMS/UPC-dma-Time_Instruments.dta, ///
			nogen keep(match master) keepusing($dmaPriceVars)
		
		** Add the newly merged UPCs to the instruments and merchandising variables.
			* This code uses HShare instead of Share, so it can't be combined with the above.
		foreach var in $dmaPriceVars {
			replace L`l'`var' = L`l'`var' + `var'*HShare`s' if `var' != .
		}
		
		drop upc upc_ver_uc $dmaPriceVars
	}
}
replace $TimeVar = hold_$TimeVar	
drop hold_$TimeVar

drop upc* upc_ver_uc* store_code_uc* Share* Hupc* Hupc_ver_uc* HShare*

*****************

**** Merge price instruments for non-SSB substitutes
	* These will just be contemporaneous, no lags
foreach group in $SubstituteGroupList {
	display "Starting group `group'."
	gen group = `group'
	
	* Merge top purchases information
	merge m:1 household_code group county using $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta, ///
		keep(match master) keepusing(upc* upc_ver_uc* store_code_uc* Share*) nogen
	
	** Set up own price instruments
	foreach var in $PrimaryIV feature display {
		gen L0`var'`group' = 0
	}

	** Merge instruments
	forvalues s = 1/40 { // 
		display "Starting s `s'."
		gen double upc = upc`s'
		gen byte upc_ver_uc = upc_ver_uc`s'
		gen long store_code_uc = store_code_uc`s'
		
		** Merge feature and display (by store)
			* capture noisily for now because this dta file is still being prepared
		capture noisily merge m:1 $TimeVar upc upc_ver_uc store_code_uc using $Externals/Intermediate/RMS/UPC-Store-Time_Instruments_Group`group'.dta, ///
			keep(match master) keepusing(feature display) nogen
			
		** Merge $PrimaryIV (by county-chain)
		merge m:1 store_code_uc year using $Externals/Intermediate/RMS/Stores.dta, ///
			keepusing(ChainCodeForIV) keep(match master) nogen
		merge m:1 $TimeVar upc upc_ver_uc ChainCodeForIV county using ///
			$Externals/Intermediate/RMS/UPC-Chain-county-Time_Instruments_Group`group'.dta, ///
			nogen keep(match master) keepusing($PrimaryIV)
		
		** Add the newly merged UPCs to the instruments and merchandising variables.
		foreach var in $PrimaryIV feature display {
			capture noisily replace L0`var'`group' = L0`var'`group' + `var'*Share`s' if `var' != .
		}
			
		drop upc upc_ver_uc store_code_uc ChainCodeForIV $PrimaryIV
		capture noisily drop feature display
	}
	drop group upc* upc_ver_uc* store_code_uc* Share*
}




*********************************************


/* Additional variable construction */
foreach var of varlist kg_Purchased_RMS kg_Purchased_XRMS  { // g_sugar_Purchased
	gen ln`var'_AdultEq = ln(`var'/HouseholdSize +1)
}
gen lnkg_Adult = ln(kg_Purchased/HouseholdSize)

foreach group in $SubstituteGroupList {
	gen lnkg_Adult`group' = ln(kg_Purchased`group'/HouseholdSize)
}

foreach var of varlist AvPricePerKG* AvPricePaidPerKG* { 
	gen ln`var' = ln(`var')
}

*** Lags of prices
sort household_code $TimeVar
foreach var in lnAvPricePerKG {
	local max_lag = 4
	forvalues l = 0/`max_lag' {
		gen L`l'`var' = `var'[_n-`l'] if household_code==household_code[_n-`l'] & $TimeVar==$TimeVar[_n-`l']+`l'
	}
}

** Get fixed effect group, HHxCounty
egen HHxCounty = group(household_code county)
*egen HHxZip = group(household_code zip)


/* Label variables */
label var lncountyIncome "ln(County income)"
label var lnzipIncome "ln(Zip income)"
label var kg_Purchased "Liters SSBs purchased"
label var AvPricePerKG "Average price/liter"

label variable lnkg_Adult "ln(Liters/adult)"
label variable lnAvPricePerKG "ln(Average price/liter)"

** Label lag variables
label var L0lnAvPricePerKG "ln(Average price/liter)" // (t)"
forvalues l=1/4 {
	label var L`l'lnAvPricePerKG "ln(Average price/liter) (t-`l')"
}	
foreach var in $PriceVars $LOPriceVars { // 
	label variable L0`var' "Local price IV (t)"
	forvalues l=1/4 {
		label var L`l'`var' "Local price IV (t-`l')"
	}
}
label variable L0feature "Feature" // (t)"
forvalues l=1/4 {
	label var L`l'feature "Feature (t-`l')"
}
label variable L0display "Display" // (t)"
forvalues l=1/4 {
	label var L`l'display "Display (t-`l')"
}

** Label substitute group variables
	* Capture noisily because these are not yet in the data
foreach group in $SubstituteGroupList {
	label variable lnAvPricePerKG`group' "ln(Average price/liter)"
	capture noisily label variable L0$PrimaryIV`group' "Local price IV (t)"
	capture noisily label variable L0feature`group' "Feature"
	capture noisily label variable L0display`group' "Display"
}

compress
saveold $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace



** This line is used on JDube01
! chmod -R 777 data/desert/Hunt

