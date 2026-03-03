/* HomescanPurchasesDataPrep.do */
* This imports the Homescan purchase data
* Prepares two datasets: one at the household-$TimeVar level for the demand (elasticity) estimation, and one at the household-year level for the bias estimation

****************************************************************************************************

/* TRIPS */
forvalues year = $BeginYear/$EndYear {
	* This also has total_spent if ever needed
	import delimited using $Nielsen/HMS/`year'/Annual_Files/trips_`year'.tsv, delimiter(tab) varnames(1) clear 
	rename purchase_date datestring
	gen purchase_date = mdy(real(substr(datestring,6,2)),real(substr(datestring,9,2)),real(substr(datestring,1,4)))
	format %td purchase_date
	keep trip_code_uc household_code store_code_uc retailer_code purchase_date
	compress
	saveold $Externals/Intermediate/Homescan/trips_`year'.dta, replace 
}


/* HOUSEHOLD PURCHASE SHARES BY UPC */
** Get data for UPC-Household_Shares.dta and UPC-Store-Household_Shares.dta
clear 
save $Externals/Intermediate/Homescan/UPC-Household_Shares.dta, replace emptyok 
clear 
save $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta, replace emptyok


forvalues year = $BeginYear/$EndYear {
	display "This is year `year'."
	import delimited using $Nielsen/HMS/`year'/Annual_Files/purchases_`year'.tsv, delimiter(tab) varnames(1) clear
	
	** Merge UPCs and immediately drop unused transactions by keeping only the matches
	merge m:1 upc upc_ver_uc using $Externals/Intermediate/NutritionFacts/Prepped-UPCs.dta, ///
		keepusing(Taxable group Grams g_sugar_per1 cals_per1) keep(match) nogen 
	replace group = 0 if Taxable == 1
	
	** Merge trips info
	merge m:1 trip_code_uc using $Externals/Intermediate/Homescan/trips_`year'.dta, keep(match master) ///
		keepusing(household_code store_code_uc retailer_code purchase_date) nogen	
	
		* Erase trips files; not needed in future
	erase $Externals/Intermediate/Homescan/trips_`year'.dta
	
	** Save the imported data for use below
	saveold $Externals/Intermediate/Homescan/Purchases_`year'_temp.dta, replace
	
	** Collapse to household-store-UPC level
	collapse (sum) Grams, by(household_code store_code_uc upc upc_ver_uc group) fast
	
	gen int year = `year'
	
	merge m:1 household_code year using $Externals/Intermediate/Homescan/Household-Panel.dta, ///
		keepusing(county) keep(match master) nogen
	
	compress
	append using $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta
	saveold $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta, replace
	
}



/* Finish constructing top UPCs for Hausman instrument */
* This dataset is now at the UPC-store-household-year level. Collapse to the UPC-household-county level
use $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta, replace

collapse (sum) Grams, by(household_code group county upc upc_ver_uc)  
	
** Get a wide dataset of top UPCs for each household
bysort household_code group: egen totalGrams=sum(Grams)
gen Share = Grams/totalGrams
gsort household_code group -Share
	
bysort household_code county group: gen n = _n
drop if n>50
drop Grams totalGrams

* Add H to variable names for "Hausman", to differentiate these variables from the variables constructed below, for use in 
foreach var in Share upc upc_ver_uc {
	rename `var' H`var'
}

reshape wide HShare Hupc Hupc_ver_uc, i(household_code group county) j(n)

order household_code group county
sort household_code group county

compress
saveold $Externals/Intermediate/Homescan/UPC-Household_Shares.dta, replace


/* Finish constructing top UPC-store combinations for instrument */
* This dataset is now at the UPC-store-household-year level. Collapse to the UPC-store-household-county level
use $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta, replace

* There are many stores where we have a store_code_uc but are not in the RMS data. Identify these through the merge
merge m:1 store_code_uc year using $Externals/Intermediate/RMS/Stores.dta, keepusing(zip3) keep(match master) // ChainCodeForIV
gen byte NotInRMS = cond(_merge!=3,1,0)
		
collapse (max) NotInRMS (sum) Grams, by(household_code group county store_code_uc upc upc_ver_uc) // Use max NotInRMS to identify stores that are ever out of the RMS data during the time when the household lives in the county. If a store is out, then we don't try to merge in the instrument data. If a store is sometimes out, we also omit because that generates an unbalanced panel. 
	// ChainCodeForIV . This would make a separate store when it changes chain, to allow the pricing to be different. /

** Get share of purchases that each UPC-store represents
bysort household_code county group: egen totalGrams=sum(Grams)
gen Share = Grams/totalGrams
drop Grams totalGrams

** Save long dataset to construct average price variable
saveold $Externals/Intermediate/Homescan/UPC-Store-Household_Shares_Long.dta, replace


** Get a wide dataset of top UPC-stores for each household in each county
	** Keep only the stores in the RMS data, because we can't merge that instrument price anyway
	drop if NotInRMS==1
	*drop if store_code_uc == 0 // This is redundant.

gsort household_code county group -Share
bysort household_code county group: gen n = _n
drop if n>50
reshape wide Share store_code_uc upc upc_ver_uc, i(household_code group county) j(n) // ChainCodeForIV

order household_code group county
sort household_code group county


compress
saveold $Externals/Intermediate/Homescan/UPC-Store-Household_Shares.dta, replace



********************************************************************************



/* PURCHASES */
clear
save $Externals/Intermediate/Homescan/HH-$TimeVar-Purchases.dta, replace emptyok
clear
save $Externals/Intermediate/Homescan/HH-year-Purchases.dta, replace emptyok


forvalues year = $BeginYear/$EndYear {
	display "This is year `year'."
	
	** Use the imported data from above
	use $Externals/Intermediate/Homescan/Purchases_`year'_temp.dta, replace
	erase $Externals/Intermediate/Homescan/Purchases_`year'_temp.dta
	
	** Get year and $TimeVar
	gen int year = `year' // Need this for a merge below
	if "$TimeVar" == "YQ" {
		gen int YQ = qofd(purchase_date)
		* Extend Q1 to include the last few days of December, which are included in this panel_year.
		replace YQ = YQ+1 if year(dofq(YQ))==`year'-1
		format %tq YQ
	}
	
	** Get expenditures. The expend variable is final price paid net of coupon_value
	gen expend = total_price_paid-coupon_value
	
	** Deflate expenditures using CPI 
	merge m:1 $TimeVar using $Externals/Intermediate/CPI/CPI_$TimeVar.dta, keepusing(CPI) keep(match master) nogen
	replace expend = expend/CPI
	drop CPI
	
	** Get kilograms purchased
	gen kg_Purchased = quantity * Grams/1000
	
	** Get nutrition facts purchased
	foreach var in cals g_sugar { 
		gen `var'_Purchased = quantity * `var'_per1
	}
	
	** Collapse to the household-$TimeVar-store-UPC level
	collapse (first) retailer_code year group (sum) expend* *_Purchased*, by(household_code $TimeVar store_code_uc upc upc_ver_uc) fast

	** Get price index
	gen AvPricePerKG = expend/kg_Purchased
	
	** Merge the share variable, for weighting the price index
		* Get county for merge
		merge m:1 household_code year using $Externals/Intermediate/Homescan/Household-Panel.dta, ///
			keepusing(county) keep(match master) nogen
	merge m:1 household_code county group store_code_uc upc upc_ver_uc using $Externals/Intermediate/Homescan/UPC-Store-Household_Shares_Long.dta, keepusing(Share) keep(match master) nogen
		drop county
		

	** Save for the HH-year data collapse below
	saveold $Externals/Intermediate/Homescan/TempForPurchases.dta, replace
	
	
	**************************
	**** Data prep for HH-$TimeVar data used for demand estimation 

	** Get purchases from RMS and non-RMS stores
	* Note that this is different from asking if the store_code_uc is non-zero, as sometimes the store_code_uc is non-zero even though a retailer is not really in RMS. The procedure below determines what is an RMS retailer.
		* Keeping _merge in the merge below and basing `var'_RMS and `var'_XRMS would make this about RMS *stores*, not RMS *chains.* But conceptually we want to measure purchases in RMS chains, as it is those purchases that should respond to the instrument.
	* Merge RMS stores
	merge m:1 store_code_uc year using $Externals/Intermediate/RMS/Stores.dta, keepusing(ChainCodeForIV) keep(match master) nogen
	* By retailer: determine whether it is RMS or non-RMS based on the share of expenditures made at stores in the Stores.dta file.
	gen expend_in_RMS = expend if ChainCodeForIV!=.
	bysort retailer_code: egen Total_expend = total(expend)
	bysort retailer_code: egen Total_expend_in_RMS = total(expend_in_RMS)
	gen RMSShare = Total_expend_in_RMS/Total_expend
	* Get expenditures and volume purchased at RMS vs. non-RMS retailers
	foreach var in expend kg_Purchased { 
		gen `var'_RMS = `var' if RMSShare>=0.5 // if _merge==3 
		gen `var'_XRMS = `var' if RMSShare<=0.05 // if _merge!=3
	}
	drop expend_in_RMS
	
	*** Collapse to the group-by-$TimeVar level
	collapse (rawsum) expend* *_Purchased* (mean) AvPricePerKG [pw=Share], by(household_code $TimeVar group) fast
	
	** Construct average price variable
	gen AvPricePaidPerKG = expend/kg_Purchased
	foreach stores in RMS XRMS {
		gen AvPricePaidPerKG_`stores' = expend_`stores'/kg_Purchased_`stores'
	}
	drop expend*
	
	** Reshape wide by group
	reshape wide AvPricePerKG AvPricePaidPerKG* *_Purchased*, i(household_code $TimeVar) j(group)
	* Rename group 0 variables
	foreach var of varlist *d0 *S0 *G0 {
		local newvarname = substr("`var'",1,length("`var'")-1)
		rename `var' `newvarname'
	}
	* Drop unused variables for non-taxable groups, keeping kg_Purchased and AvPricePaidPerKG
	foreach var of varlist AvPricePaidPerKG AvPricePaidPerKG_RMS AvPricePaidPerKG_XRMS cals_Purchased g_sugar_Purchased kg_Purchased_RMS kg_Purchased_XRMS {
		drop `var'? `var'??
	}
	
	** Append to full Purchases panel
	compress
	append using $Externals/Intermediate/Homescan/HH-$TimeVar-Purchases.dta
	saveold $Externals/Intermediate/Homescan/HH-$TimeVar-Purchases.dta, replace
	
	
	**************************
	**** Data prep for HH-year data used for bias estimation
	
	use $Externals/Intermediate/Homescan/TempForPurchases.dta, replace
	
	*** Collapse to the group-by-year level
	collapse (rawsum) expend* *_Purchased* (mean) AvPricePerKG [pw=Share], by(household_code year group) fast
	
	** Construct average price variable
	gen AvPricePaidPerKG = expend/kg_Purchased
	drop expend
	
	** Reshape wide
	reshape wide AvPricePerKG AvPricePaidPerKG *_Purchased*, i(household_code year) j(group)
	* Rename group 0 variables
	foreach var in AvPricePerKG AvPricePaidPerKG kg_Purchased cals_Purchased g_sugar_Purchased {
		rename `var'0 `var'
	}
	* Drop unused variables for non-taxable groups, keeping kg_Purchased
	foreach var of varlist cals_Purchased g_sugar_Purchased AvPricePaidPerKG {
		drop `var'? `var'??
	}
	
	** Append to full Purchases panel
	compress
	append using $Externals/Intermediate/Homescan/HH-year-Purchases.dta
	saveold $Externals/Intermediate/Homescan/HH-year-Purchases.dta, replace
}

erase $Externals/Intermediate/Homescan/TempForPurchases.dta
erase $Externals/Intermediate/Homescan/UPC-Store-Household_Shares_Long.dta



