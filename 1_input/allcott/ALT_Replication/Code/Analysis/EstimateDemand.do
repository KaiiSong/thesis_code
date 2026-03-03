/* EstimateDemand.do */

/* SETUP */
est drop _all

use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace

/*
global CumulativeElasticity = "_b[L0lnAvPricePerKG]"
global NLags=1
forvalues l=4(-1)$NLags {
	drop L`l'*
}
*/
	
/* FIRST STAGES */
* NB these are not technically the first stages for our actual demand estimates because the set of observations is different; we need to determine the optimal lag length below, which determines the set of observations.
forvalues l=0/4 {
	reghdfe L`l'lnAvPricePerKG L?$PrimaryIV lncountyIncome L?feature L?display $DemandControls [pw=projection_factor], ///
		absorb(i.household_code#i.county i.YQ) vce(cluster county)
	eststo First`l'
}

	esttab First? using "Output/Analysis/PriceAndIncomeElasticity_First.tex", replace ///
		b(%8.3f) se(%8.3f) /// 
		stats(N, l("N") fmt(%12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label ///
		mtitles("Price (t)" "Price (t-1)" "Price (t-2)" "Price (t-3)" "Price (t-4)") ///
		keep(L?$PrimaryIV)

		
/* DETERMINE LAG LENGTH */
gen InSample = 1
*local Complete = 0
forvalues l = 4(-1)0 {
	* Construct vectors of variables used in the regressions
	local Price = "L0lnAvPricePerKG"
	local IV = "L0$PrimaryIV"
	local feature = "L0feature"
	local display = "L0display"
	forvalues i = 1/`l' {
		local Price = "`Price' L`i'lnAvPricePerKG"
		local IV = "`IV' L`i'$PrimaryIV"
		local feature = "`feature' L`i'feature"
		local display = "`display' L`i'display"
	}
	
	reghdfe lnkg_Adult lncountyIncome `feature' `display' $DemandControls (`Price'=`IV') [pw=projection_factor], ///
		absorb(i.household_code#i.county i.YQ) vce(cluster county), if InSample==1
			
	eststo IVLag`l'	
	local AIC`l' = -2*e(ll)+ 2*e(df_m)
	display `AIC`l''
	estadd scalar AIC = `AIC`l''
	local BIC`l' = -2*e(ll)+ln(e(N))*e(df_m)
	display `BIC`l''
	estadd scalar BIC = `BIC`l''
	if `l'==4 {
		replace InSample = e(sample)
	}
}



	esttab IVLag? using "Output/Analysis/PriceAndIncomeElasticity_IVLag.tex", replace ///
		b(%8.3f) se(%8.3f) /// 
		stats(N AIC BIC, l("N" "Akaike Information Criterion" "Bayesian Information Criterion") fmt(%12.0fc %12.0fc %12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label ///
		nomtitles ///
		drop(L?feature L?display $DemandControls) // 
	
drop InSample

*** Select the best model
local minAIC=10000000000
forvalues l=0/4 {
	if `AIC`l'' < `minAIC' {
		local minAIC = `AIC`l''
		global NLags=1+`l'
		local maxLag=`l'
	}
}
display `maxLag'

* Drop unused longer lags
forvalues l=4(-1)$NLags {
	drop L`l'*
}
* Get cumulative elasticity global for below
global CumulativeElasticity = "_b[L0lnAvPricePerKG]"	
forvalues l = 1/`maxLag' {
	global CumulativeElasticity = "$CumulativeElasticity + _b[L`l'lnAvPricePerKG]"
}


/* IV ESTIMATES TABLE */

***  Primary IV
reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IV0
	estadd local DMAxTime "No"	
	estadd local DMAxTimexIncome "No"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'
	
	local IncomeElasticity = _b[lncountyIncome]
	local se_IncomeElasticity = _se[lncountyIncome]
	
	* Set globals for use in figure below and BiasEffects.do 
	global IncomeElasticity = _b[lncountyIncome]
	global PriceElasticity = `PriceElasticity'
	
		****************************************************
		**** Output primary results for simulations and text
		preserve 
		** For simulations
		clear
		set obs 1
		gen PriceElasticity_b = `PriceElasticity'
		gen PriceElasticity_se = `se_PriceElasticity'
		gen IncomeElasticity_b = `IncomeElasticity'
		gen IncomeElasticity_se = `se_IncomeElasticity'

		outsheet using $Externals/Intermediate/Simulations/PriceElastictyAndIncomeEffects.csv, comma names replace

		** For text
		clear
		set obs 1
		gen var = round($PriceElasticity,0.01)
		format var %12.2fc 
		tostring var, replace force u
		outfile var using "Output/Analysis/NumbersForText/PriceElasticity.tex", replace noquote

		restore
		****************************************************

**** Control for dma x $TimeVar
merge m:1 household_code year using $Externals/Intermediate/Homescan/Household-Panel.dta, ///
	keepusing(dma) 
assert _m==3
drop _m

*egen TD = group($TimeVar dma)
*xi i.$TimeVar*i.fips_state_code, pre(_TD) 

reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.$TimeVar#i.dma) vce(cluster county) // _TD*
eststo IV1
	estadd local DMAxTime "Yes"
	estadd local DMAxTimexIncome "No"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'

**** Control for dma x $TimeVar x AboveMedianIncome
sum HHSampleMeanIncome,d
gen AboveMedianIncome = cond(HHSampleMeanIncome>=r(p50),1,0)

reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.$TimeVar#i.dma#i.AboveMedianIncome) vce(cluster county) // _TD*
eststo IV2
	estadd local DMAxTime "No"
	estadd local DMAxTimexIncome "Yes"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'
	

**** Alternative IVs
** Regional difference	
reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?LOdmReg_lnPrice) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IV3
	estadd local DMAxTime "No"	
	estadd local DMAxTimexIncome "No"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'


	
**** Heterogeneity by income
** Create interaction variables
foreach var of varlist L?lnAvPricePerKG L?$PrimaryIV lncountyIncome L?feature L?display $DemandControls {
	gen Ix`var' = HHSampleMeanIncome*`var' / 100000
}

** Labels
* Price
label var IxL0lnAvPricePerKG "Income (\\$100k) $\times$ ln(Average price/liter)"
forvalues l=1/4 {
	capture label var IxL`l'lnAvPricePerKG "Income (\\$100k) $\times$ ln(Average price/liter) (t-`l')"
}
* County income
capture label var IxlncountyIncome "Income (\\$100k) $\times$ ln(County income)"

* Feature
label var IxL0feature "Income (\\$100k) $\times$ Feature" // (t)"
forvalues l=1/4 {
	capture label var IxL`l'feature "Income (\\$100k) $\times$ Feature (t-`l')"
}
* Display
label var IxL0display "Income (\\$100k) $\times$ Display" // (t)"
forvalues l=1/4 {
	capture label var IxL`l'display "Income (\\$100k) $\times$ Display (t-`l')"
}

** Regression with interaction terms
reghdfe lnkg_Adult lncountyIncome IxlncountyIncome L?feature IxL?feature L?display IxL?display $DemandControls /// 
	(L?lnAvPricePerKG IxL?lnAvPricePerKG=L?$PrimaryIV IxL?$PrimaryIV) [pw=projection_factor], /// stages(first) ffirst
	absorb(i.household_code#i.county i.YQ) vce(cluster county) 

eststo IVH
	estadd local DMAxTime "No"	
	estadd local DMAxTimexIncome "No"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'

			
**** Global elasticity numbers for use in BiasEffects.do 
global PriceElast_IncomeHet_Intercept = - _b[L0lnAvPricePerKG]
global PriceElast_IncomeHet_Slope = - _b[IxL0lnAvPricePerKG]
global IncomeElast_IncomeHet_Intercept = _b[lncountyIncome]
global IncomeElast_IncomeHet_Slope = _b[IxlncountyIncome]
		
		
		****************************************************
		**** Output primary results for simulations and text
		preserve
		
		*** Price elasticity parameters
		include Code/Analysis/GetPriceElasticity.do
		clear
		set obs 1

		gen PriceElasticity_Intercept = $PriceElast_IncomeHet_Intercept
		gen IncomeXPriceElasticity = $PriceElast_IncomeHet_Slope
		gen IncomeElasticity_Intercept = $IncomeElast_IncomeHet_Intercept
		gen IncomeXIncomeElasticity = $IncomeElast_IncomeHet_Slope

		outsheet using $Externals/Intermediate/Simulations/PriceElasticity_IncomeHet.csv, comma names replace


		*** High and low income price elasticity numbers for text
		** Low income
		clear
		set obs 1
		gen var = round( $PriceElast_IncomeHet_Intercept + 5000/100000*$PriceElast_IncomeHet_Slope , 0.01)
		format var %12.2fc 
		tostring var, replace force u
		outfile var using "Output/Analysis/NumbersForText/PriceElasticity_LowIncome.tex", replace noquote

		** High income
		clear
		set obs 1
		gen var = round( $PriceElast_IncomeHet_Intercept + 125000/100000*$PriceElast_IncomeHet_Slope , 0.01)
		format var %12.2fc 
		tostring var, replace force u
		outfile var using "Output/Analysis/NumbersForText/PriceElasticity_HighIncome.tex", replace noquote

		restore
		****************************************************


** Outsheet results
* If only one lag, then don't print the price elasticity row
	esttab IV? using "Output/Analysis/PriceAndIncomeElasticity_IV.tex", replace ///
		b(%8.3f) se(%8.3f) /// stats(PriceElasticity se_PriceElasticity widstat N, l("Price elasticity" "SE(Price elasticity)" "Kleibergen-Paap first stage F stat" "N") fmt(%8.2f %8.3f %12.1fc %12.0fc)) ///
		stats(DMAxTime DMAxTimexIncome widstat N, ///
		l("Market-quarter fixed effects" "Market-quarter-income fixed effects" "Kleibergen-Paap first stage F stat" "N") fmt(%8.0fc %8.0fc %12.1fc %12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label /// mtitles("Primary" "Primary" "Primary" "\shortstack{Regional \\ difference}")  ///
		nomtitles drop($DemandControls)

	esttab IV0 IV1 IV2 IV3 using "Output/Analysis/PriceAndIncomeElasticity_IV_Slides.tex", replace ///
		b(%8.3f) se(%8.3f) /// stats(PriceElasticity se_PriceElasticity widstat N, l("Price elasticity" "SE(Price elasticity)" "Kleibergen-Paap first stage F stat" "N") fmt(%8.2f %8.3f %12.1fc %12.0fc)) ///
		stats(DMAxTime DMAxTimexIncome widstat N, l("Market-quarter FEs" "Market-qtr-income FEs" "K-P first stage F stat" "N") fmt(%8.0fc %8.0fc %12.1fc %12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label /// mtitles("Primary" "Primary" "Primary"  "\shortstack{Regional \\ difference}")  ///
		nomtitles drop($DemandControls)

		
**************************************************************************

/* TOBIT ANALYSIS TO ADDRESS ZERO-PURCHASE OBSERVATIONS */
assert $NLags==1 // Otherwise need to re-do the price elasticity calculation to accommodate lags

label variable L0$PrimaryIV "Local price IV"

gen kg_Adult = kg_Purchased/HouseholdSize
sum kg_Adult, meanonly
local meankg = r(mean)

*** Primary IV in levels
reghdfe kg_Adult lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVZeros0
	local PriceElasticity = -1 * _b[L0lnAvPricePerKG]/`meankg'
	local se_PriceElasticity = _se[L0lnAvPricePerKG]/`meankg'
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'
	
gen PrimaryIVSample = e(sample)
	
*** Reduced form with only positive purchases
reghdfe kg_Adult L?$PrimaryIV lncountyIncome L?feature L?display $DemandControls [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county), if PrimaryIVSample==1
eststo IVZeros1
	local PriceElasticity = -1 * _b[L0$PrimaryIV]/`meankg'
	local se_PriceElasticity = _se[L0$PrimaryIV]/`meankg'
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'

*** Reduced form with all observations
reghdfe kg_Adult L?$PrimaryIV lncountyIncome L?feature L?display $DemandControls [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVZeros2
	local PriceElasticity = -1 * _b[L0$PrimaryIV]/`meankg'
	local se_PriceElasticity = _se[L0$PrimaryIV]/`meankg'
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'


** de-mean for Tobit
xi i.$TimeVar, pre(_T)
foreach var of varlist lnkg_Adult L?$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T* {
	bysort HHxCounty: egen `var'm = wtmean(`var'), weight(projection_factor)
	replace `var' = `var'-`var'm
	drop `var'm
}
*** Tobit with all observations
tobit kg_Adult L?$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T* [pw=projection_factor], ///
	vce(cluster county) ll(0)
eststo IVZeros3
	local PriceElasticity = -1 * _b[L0$PrimaryIV]/`meankg'
	local se_PriceElasticity = _se[L0$PrimaryIV]/`meankg'
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'

	
	esttab IVZeros? using "Output/Analysis/PriceAndIncomeElasticity_Zeros_Temp.tex", replace ///
		b(%8.2f) se(%8.2f) /// 
		stats(PriceElasticity se_PriceElasticity N, l("Price elasticity" "SE(Price elasticity)" "N") fmt(%8.2f %8.3f %12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label ///
		mtitles("\shortstack{Primary \\ IV}" "\shortstack{Reduced form \\ in IV sample}" "\shortstack{Full \\ sample}" "Tobit")  ///
		keep(L0lnAvPricePerKG L0$PrimaryIV lncountyIncome L0feature L0display) order(L0lnAvPricePerKG L0$PrimaryIV lncountyIncome L0feature L0display) // drop($DemandControls _T*)

				** Esttab prints an extra line from the Tobit that we don't want in the output.
				* The below code erases it.
				file open in_file using Output/Analysis/PriceAndIncomeElasticity_Zeros_Temp.tex, read text
				file open out_file using Output/Analysis/PriceAndIncomeElasticity_Zeros.tex, write text replace
				local line_num = 1
				file read in_file line
				file write out_file `"`line'"' _n
				while r(eof) == 0 {
					local ++line_num
					file read in_file line
					if !inlist(`line_num', 8) {  // The line that you want to delete
						file write out_file `"`line'"' _n
					}
				}
				file close in_file
				file close out_file
				erase Output/Analysis/PriceAndIncomeElasticity_Zeros_Temp.tex


clear

***********************************************************************************
***********************************************************************************

	
/* INCOME MEASURED AT THE HOUSEHOLD LEVEL */
*** Which year to use? Predict individual income with county income and various lags
use $Externals/Intermediate/HH-Year-FinalData.dta, replace
egen HHxCounty = group(household_code county)
areg lnIncome lncountyIncome L1lncountyIncome L2lncountyIncome L3lncountyIncome i.year [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
eststo Inc1

areg lnIncome lncountyIncome i.year [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
eststo Inc2

areg lnIncome L1lncountyIncome i.year [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
eststo Inc3

areg lnIncome L2lncountyIncome i.year [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
eststo Inc4

areg lnIncome L3lncountyIncome i.year [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
eststo Inc5

	
	esttab Inc? using "Output/Analysis/PriceAndIncomeElasticity_Inc.tex", replace ///
		b(%8.3f) se(%8.3f) ///
		stats(N, l("N") fmt(%12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label ///
		nomtitles ///
		keep(lncountyIncome L?lncountyIncome)


	
*** Use individual income in the price and income elasticity regs
** Add the no controls info to the main estimates
est restore IV0
estadd local Controls "No"
eststo IVInc0

** Re-open dataset		
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
* Drop unused longer lags
forvalues l=4(-1)$NLags {
	drop L`l'*
}

global Controls_ExlnIncome = subinstr("$Controls","lnIncome","",.)
reghdfe lnkg_Adult L?feature L?display lnIncome_Lead? lnIncome $Controls_ExlnIncome (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVInc1
estadd local Controls "Yes"

reghdfe lnkg_Adult L?feature L?display lnIncome $Controls_ExlnIncome (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVInc2
estadd local Controls "Yes"

reghdfe lnkg_Adult L?feature L?display lnIncome_Lead1 $Controls_ExlnIncome (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVInc3
estadd local Controls "Yes"

reghdfe lnkg_Adult L?feature L?display lnIncome_Lead2 $Controls_ExlnIncome (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVInc4
estadd local Controls "Yes"

reghdfe lnkg_Adult L?feature L?display lnIncome (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVInc5
estadd local Controls "No"



	esttab IVInc? using "Output/Analysis/PriceAndIncomeElasticity_IVInc.tex", replace ///
		b(%8.3f) se(%8.3f) /// stats(PriceElasticity se_PriceElasticity widstat N, l("Price elasticity" "SE(Price elasticity)" "Kleibergen-Paap first stage F stat" "N") fmt(%8.2f %8.3f %12.1fc %12.0fc)) ///
		stats(Controls widstat N, l("Other demographics" "Kleibergen-Paap first stage F stat" "N") fmt(%12.1fc %12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label ///
		nomtitles /// 
		order(L?lnAvPricePerKG lncountyIncome lnIncome lnIncome_Lead1 lnIncome_Lead2 L?feature L?display) ///
		drop($Controls_ExlnIncome)	


		
***********************************************************************************
***********************************************************************************
		
		
/* ALTERNATIVE ESTIMATES OF PRICE AND INCOME ELASTICITY */
** Re-open dataset		
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
* Drop unused longer lags
forvalues l=4(-1)$NLags {
	drop L`l'*
}

**** Include Employed and WorkHours to test separability
reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls Employed WorkHours (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVA1
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'

**** Not including merchandising condition controls
** Leave off feature
reghdfe lnkg_Adult lncountyIncome L?display $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVA2
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'

** Leave off display
reghdfe lnkg_Adult lncountyIncome L?feature $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVA3
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'

**** Richer counties could get richer faster and change preferences
** Merge county-level data
merge m:1 county using $Externals/Intermediate/Geographic/county.dta, keep(match master) keepusing(countylnIncome) // countylnEduc
foreach var in Income { //Educ
	gen YearXcountyln`var' = year*countyln`var'
}
label var YearXcountylnIncome "Year $\times$ ln(County mean income)"
*label var YearXcountylnEduc "Year $\times$ ln(County mean education)"

reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls YearXcountylnIncome (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVA4
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'	

/*
*** Higher-education counties could get richer faster and change preferences
	* Makes no difference
gen YearXlnEduc = year*lnEduc
label var YearXlnEduc "Year $\times$ ln(Education)"
reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls YearXlnEduc (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IVA5
*/

reghdfe lnkg_Adult L?lnAvPricePerKG lncountyIncome L?feature L?display $DemandControls [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo OLS
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'


	
	esttab IV0 IVA? OLS using "Output/Analysis/PriceAndIncomeElasticity_Alt.tex", replace ///
		b(%8.3f) se(%8.3f) /// stats(PriceElasticity se_PriceElasticity widstat N, l("Price elasticity" "SE(Price elasticity)" "Kleibergen-Paap first stage F stat" "N") fmt(%8.2f %8.3f %12.1fc %12.0fc)) ///
		stats(widstat N, l("Kleibergen-Paap first stage F stat" "N") fmt(%12.1fc %12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label ///
		mtitles("Primary" "\shortstack{Employment \\ controls}"  "\shortstack{Drop \\ feature}" "\shortstack{Drop \\ display}" ///
		"\shortstack{Income \\ control}" "OLS")  /// "\shortstack{Education \\ control}" "\shortstack{2007-2011 \\ only}"
		drop($DemandControls)	

	

******************************************************************************

/* STATEMENTS IN TEXT */
** Share of household-by-quarter observations with zero purchases
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
sum kg_Purchased
local N=r(N)
sum AvPricePerKG
local percent = round((1-r(N)/`N')*100,1)
display "`percent' percent of household-by-quarter observations have no SSB purchases."
clear
set obs 1
gen percent = `percent'
outfile percent using "Output/Analysis/NumbersForText/PercentQuartersNoSSB.tex", replace

* This shows that censoring is indeed correlated with higher local prices
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
gen ZeroPurchases = cond(kg_Purchased==0,1,0)
reghdfe ZeroPurchases L0$PrimaryIV lncountyIncome L0feature L0display [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)


** Income elasticity
clear
set obs 1
gen IncomeElasticity = round($IncomeElasticity,0.01)
format IncomeElasticity %12.2fc 
tostring IncomeElasticity, replace force u
outfile IncomeElasticity using "Output/Analysis/NumbersForText/IncomeElasticity.tex", replace noquote



/*
** Average income of people who purchase above- vs. below-median shares in RMS stores
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
collapse (first) HHSampleMeanIncome (mean) projection_factor (sum) kg_Purchased_RMS kg_Purchased_XRMS, by(household_code)
gen shareRMS = kg_Purchased_RMS/(kg_Purchased_RMS+kg_Purchased_XRMS)
sum shareRMS, d
gen AboveMedianRMS = cond(shareRMS>=r(p50),1,0) if kg_Purchased_RMS!=0|kg_Purchased_XRMS!=0
bysort AboveMedianRMS: sum HHSampleMeanIncome [aw=projection_factor]

sum HHSampleMeanIncome if AboveMedianRMS==1 [aw=projection_factor]
local AboveMedianRMSIncome = r(mean)

sum HHSampleMeanIncome if AboveMedianRMS==0 [aw=projection_factor]
local IncomeDifference = `AboveMedianRMSIncome'-r(mean)

clear 
set obs 1 
gen var = round(`IncomeDifference',1000)
outfile var using "Output/Analysis/NumbersForText/AboveVsBelowMedianRMS_Income.tex", replace
*/




******************************************************************************
	
/* OTHER INTERNAL ROBUSTNESS CHECKS */
/* Internal: RMS vs. non-RMS purchases. Elasticity is positive wrt RMS purchases and negative wrt non-RMS purchases, as expected.
reghdfe lnkg_Purchased_RMS_AdultEq lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)

	
reghdfe lnkg_Purchased_XRMS_AdultEq lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)

/*
*** OLS
reghdfe lnkg_Adult L?lnAvPricePerKG lncountyIncome L?feature L?display $DemandControls [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo OLS
	estadd local DMAxTime "No"	
	estadd local DMAxTimexIncome "No"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'
*/
/*
**** Using local RMS prices instead of leave-out
reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?dmNat_lnPrice) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IV1
	estadd local DMAxTime "No"	
	estadd local DMAxTimexIncome "No"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'
*/
	
/*
** Hausman
* Omit because there is almost no first stage
reghdfe lnkg_Adult lncountyIncome L?feature L?display $DemandControls (L?lnAvPricePerKG=L?Hausman_lnPrice) [pw=projection_factor], ///
	absorb(i.household_code#i.county i.YQ) vce(cluster county)
eststo IV5
	estadd local DMAxTime "No"	
	estadd local DMAxTimexIncome "No"
	include Code/Analysis/GetPriceElasticity.do
	estadd scalar PriceElasticity `PriceElasticity'
	estadd scalar se_PriceElasticity `se_PriceElasticity'
*/
	
*/
	
	
		
/*
**** Internal: using zip code mean income
*** Directly use zip code mean income
reghdfe lnkg_Adult lnzipIncome L?feature L?display $DemandControls Employed WorkHours _T* (L?lnAvPricePerKG=L?$PrimaryIV) [pw=projection_factor], ///
	absorb(HHxZip) vce(cluster zip)

** Instrument with county income
reghdfe lnkg_Adult L?feature L?display $DemandControls Employed WorkHours _T* (L?lnAvPricePerKG lnzipIncome=L?$PrimaryIV lncountyIncome) [pw=projection_factor], ///
	absorb(HHxZip) vce(cluster zip)
	
** First stage is small, suggesting measurement error
reghdfe lnzipIncome lncountyIncome L?$PrimaryIV L?feature L?display $DemandControls Employed WorkHours _T* [pw=projection_factor], ///
	absorb(HHxZip) vce(cluster zip)
*/



******************************************************************************

/* INTERACTIONS WITH BIAS */
/*
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
drop L4* L3* L2*

xi i.$TimeVar, pre(_T) 

/* Data prep */
merge m:1 household_code year using $Externals/Intermediate/HH-Year-FinalData.dta, ///
	nogen keep(match master) keepusing(health_pct_knowledge1 self_controlSSB1 PanelViewsSampleWeight)

foreach var of varlist L?lnAvPricePerKG L?$PrimaryIV {
	gen lIx`var' = ln(HHSampleMeanIncome)*`var'	
	*gen Ix`var' = HHSampleMeanIncome*`var'	
	gen Sx`var' = self_controlSSB1*`var'	
	gen Kx`var' = health_pct_knowledge1*`var'	
}

	
* First stages
reghdfe L0lnAvPricePerKG L?$PrimaryIV lIxL?$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T*  [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
reghdfe L1lnAvPricePerKG L?$PrimaryIV lIxL?$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T*  [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
reghdfe IxL0lnAvPricePerKG L?$PrimaryIV lIxL?$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T*  [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
reghdfe IxL1lnAvPricePerKG L?$PrimaryIV lIxL?$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T*  [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)




** With just the contemporaneous
reghdfe lnkg_Adult lncountyIncome L0feature L0display _T* (L0lnAvPricePerKG lIxL0lnAvPricePerKG=L0$PrimaryIV lIxL0$PrimaryIV) [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
* No sample weights
reghdfe lnkg_Adult lncountyIncome L0feature L0display _T* (L0lnAvPricePerKG lIxL0lnAvPricePerKG=L0$PrimaryIV lIxL0$PrimaryIV), ///
	absorb(HHxCounty) vce(cluster county)
	
* First stages
reghdfe L0lnAvPricePerKG L0$PrimaryIV lIxL0$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T*  [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
reghdfe lIxL0lnAvPricePerKG L0$PrimaryIV lIxL0$PrimaryIV lncountyIncome L?feature L?display $DemandControls _T*  [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
	
*/
/*
/* Interactions with bias */
** With just the contemporaneous
reghdfe lnkg_Adult lncountyIncome L0feature _T* (L0lnAvPricePerKG ?xL0lnAvPricePerKG=L0$PrimaryIV ?xL0$PrimaryIV) [pw=PanelViewsSampleWeight], ///
	absorb(HHxCounty) vce(cluster county)
* No sample weights
reghdfe lnkg_Adult lncountyIncome L0feature _T* (L0lnAvPricePerKG ?xL0lnAvPricePerKG=L0$PrimaryIV ?xL0$PrimaryIV), ///
	absorb(HHxCounty) vce(cluster county)

* Using levels instead of logs
gen kg_Adult = kg_Purchased/(CalorieNeed/$AdultCalorieNeed)
reghdfe kg_Adult lncountyIncome L0feature _T* (L0lnAvPricePerKG ?xL0lnAvPricePerKG=L0$PrimaryIV ?xL0$PrimaryIV) [pw=PanelViewsSampleWeight], ///
	absorb(HHxCounty) vce(cluster county)
* No sample weights
reghdfe kg_Adult lncountyIncome L0feature _T* (L0lnAvPricePerKG ?xL0lnAvPricePerKG=L0$PrimaryIV ?xL0$PrimaryIV), ///
	absorb(HHxCounty) vce(cluster county)


* First stages
reghdfe L0lnAvPricePerKG L0$PrimaryIV ?xL0$PrimaryIV lncountyIncome L?feature _T*  [pw=PanelViewsSampleWeight], ///
	absorb(HHxCounty) vce(cluster county)
reghdfe IxL0lnAvPricePerKG L0$PrimaryIV ?xL0$PrimaryIV lncountyIncome L?feature _T*  [pw=PanelViewsSampleWeight], ///
	absorb(HHxCounty) vce(cluster county)
reghdfe SxL0lnAvPricePerKG L0$PrimaryIV ?xL0$PrimaryIV lncountyIncome L?feature _T*  [pw=PanelViewsSampleWeight], ///
	absorb(HHxCounty) vce(cluster county)
reghdfe KxL0lnAvPricePerKG L0$PrimaryIV ?xL0$PrimaryIV lncountyIncome L?feature _T*  [pw=PanelViewsSampleWeight], ///
	absorb(HHxCounty) vce(cluster county)
	*/
