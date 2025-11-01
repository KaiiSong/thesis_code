/* FinalizeData_BiasEffects.do */
* This script creates dta files for bias estimation

**************************************************************************
/* PREPARE DATA FOR BIAS ESTIMATION */
/* PanelViews individual-level data */

** Get targets for sample means of $Controls_SumStats
use $Externals/Intermediate/Homescan/Household-Panel.dta, clear

foreach var in $WeightingVars {
	sum `var' [aw=projection_factor] if year==$EndYear
	local mean = r(mean)
	display `mean'
	local WeightingVarsMeans = "`WeightingVarsMeans' `mean'"
}
display "`WeightingVarsMeans'"

** Collapse the household data, getting the covariates for the last year the household was in the sample
sort household_code year
collapse (last) lnIncome lnEduc lnAge $Controls_SumStats HHSampleMeanIncome IncomeGroup MTR county year, by(household_code)
label var lnIncome "ln(Household income)"
label var lnEduc "ln(Years education)"

** Merge PanelViews data
merge 1:m household_code using "$Externals/Intermediate/Homescan/PanelViews.dta", ///
	keep(match) nogen keepusing(PVSSBCons cons_fruit_juice cons_diet SelfControl MySpouse_SelfControl SelfControl_FromSpouse Knowledge ///
	$PVControls SpouseNumber svy_male prim_shop)
gen lnPVSSBCons = ln(PVSSBCons+1)

** Merge average price paid (needed to calculate gamma)
merge m:1 household_code year using $Externals/Intermediate/Homescan/HH-year-Purchases.dta, ///
	nogen keep(match master) keepusing(AvPricePerKG)


*** Weight
gen InPVSample1 = 1
foreach var of varlist PVSSBCons SelfControl Knowledge $PVControls {
	replace InPVSample1 = 0 if `var' == .
}

*gen InPVSample2 = InPVSample1
*replace InPVSample2=0 if SelfControl_FromSpouse==.

** Get weights
*ssc install ebalance
foreach sample in 1 { // 2
	ebalance $WeightingVars, manualtargets(`WeightingVarsMeans') gen(PVSampleWeight`sample'), if InPVSample`sample'==1 // keep(Output/BalanceTable) replace
	* Bound the sample weights to improve precision. The age and children variables are the hardest to match on, but still pretty close
	replace PVSampleWeight`sample' = min(PVSampleWeight`sample',4) if InPVSample`sample'==1 
	replace PVSampleWeight`sample' = max(PVSampleWeight`sample',0.25) if InPVSample`sample'==1 
}


	

compress
saveold $Externals/Intermediate/PanelViews-FinalData.dta, replace


**************************

/* Homescan household-level data */
* This is at the household level, for the last year the household is in the sample

*** First collapse the household data
use $Externals/Intermediate/Homescan/Household-Panel.dta, clear
sort household_code year
collapse (last) projection_factor lnIncome lnEduc lnAge $Controls_SumStats IncomeGroup HHSampleMeanIncome HHSampleMeanIncomeGroup ///
	CalorieNeed NHeads household_size county year MTR, by(household_code)
label var lnIncome "ln(Household income)"
label var lnEduc "ln(Years education)"

** Merge PanelViews data 
merge 1:1 household_code using $Externals/Intermediate/Homescan/PanelViews_by_Household.dta, ///
	keep(match master) keepusing(PVSSBCons1 Knowledge? Knowledge_Av SelfControl1 SelfControl_RatedBy? MySpouse_SelfControl? ///
	$PVControls1 $PVControls2 $PVControls_Av PVSSBCons_RespAv) // SelfControl_FromSpouse? PVSSBCons_Av


*** Weight
gen byte InPVSample1 = 1
foreach var of varlist Knowledge1 SelfControl1 $PVControls1 {
	replace InPVSample1 = 0 if `var' == .
}
/*
gen byte InPVSample2 = InPVSample1
foreach var of varlist SelfControl_RatedBy2 {
	replace InPVSample2=0 if `var'==.
}
*/

*gen byte InPVSampleCons = cond(PVSSBCons!=.,1,0)

** Get weights
*ssc install ebalance
foreach sample in 1 { // 2 Cons
	ebalance $WeightingVars, manualtargets(`WeightingVarsMeans') gen(PVSampleWeight`sample'), if InPVSample`sample'==1 // keep(Output/BalanceTable) replace
	* Bound the sample weights to improve precision. The age and children variables are the hardest to match on, but still pretty close
	replace PVSampleWeight`sample' = min(PVSampleWeight`sample',4) if InPVSample`sample'==1 
	replace PVSampleWeight`sample' = max(PVSampleWeight`sample',0.25) if InPVSample`sample'==1 
}

** Get RatedSpouseSC, for use as the measure of whether there are two household heads
gen byte RatedSpouseSC = cond(MySpouse_SelfControl1!=.,1,0)
label variable RatedSpouseSC "1(Rated other head self-control)"


** Get consumption
merge 1:1 household_code year using $Externals/Intermediate/Homescan/HH-year-Purchases.dta, ///
	nogen keep(match master) keepusing(*_Purchased kg_Purchased? AvPricePerKG)

* Missing in Purchases data means zero purchases. Replace missing with zero.
foreach unit in kg cals g_sugar {
	replace `unit'_Purchased=0 if `unit'_Purchased==.
}
foreach var of varlist kg_Purchased? {
	replace `var'=0 if `var'==.
}


/* Additional variable construction */
* SSB consumption per adult equivalent
gen HMSSSBCons = kg_Purchased/HouseholdSize

gen lnHMSSSBCons = ln(HMSSSBCons+1)
gen lnPVSSBCons_RespAv = ln(PVSSBCons_RespAv+1)

foreach g in 1 3 5 6 8 {
	gen lnHMSSSBCons`g' = ln(kg_Purchased`g'/HouseholdSize + 1)
}
gen lnHMSSSBConsA = ln((kg_Purchased1+kg_Purchased3+kg_Purchased5+kg_Purchased6+kg_Purchased8)/HouseholdSize +1)

* Get SSB consumption as a share of household calorie need
foreach var of varlist cals_Purchased {
	gen `var'_Need = `var'/(CalorieNeed*365)
}



/* Label variables */
label var kg_Purchased "SSBs purchased (liters)"
label var AvPricePerKG "Average price (\\$/liter)"

label variable lnPVSSBCons_RespAv "ln(SSB consumption (liters))"
label variable lnHMSSSBCons "ln(Liters/adult)"
*label variable lnAvPricePerKG "ln(Average price/liter)"

compress
saveold $Externals/Intermediate/HH-FinalData.dta, replace

********************************************************************************

/* HOUSEHOLD-YEAR DATA */
use household_code year *_Purchased kg_Purchased? AvPricePerKG using $Externals/Intermediate/Homescan/HH-year-Purchases.dta, clear


/* Merge all household data */
merge m:1 household_code year using $Externals/Intermediate/Homescan/Household-Panel.dta, ///
	keepusing(projection_factor NHeads MTR household_size HouseholdSize CalorieNeed $Controls $Controls_SumStats ///
	HHSampleMeanIncome HHSampleMeanIncomeGroup IncomeGroup county zip) /// lnIncome_Lead?
	keep(match master using) nogen

	
*** Merge current and lagged county mean income
gen year_orig = year
forvalues l=0/3 {
	replace year = year_orig-`l'
	merge m:1 county year using $Externals/Intermediate/Geographic/county-year.dta, keep(match master) keepusing(countyIncome)
	assert _merge==3
	drop _merge
	rename countyIncome L`l'countyIncome
}
rename L0countyIncome countyIncome
replace year = year_orig
drop year_orig


** Get logs of income variables
gen lncountyIncome = ln(countyIncome)
gen L1lncountyIncome = ln(L1countyIncome)
gen L2lncountyIncome = ln(L2countyIncome)
gen L3lncountyIncome = ln(L3countyIncome)
	
* Missing in Purchases data means zero purchases. Replace missing with zero.
foreach unit in kg cals g_sugar {
	replace `unit'_Purchased=0 if `unit'_Purchased==.
}
/*
** Merge PanelViews data 
merge m:1 household_code using $Externals/Intermediate/Homescan/PanelViews_by_Household.dta, ///
	keep(match master) nogen keepusing(PVSSBCons SelfControl? MySpouse_SelfControl? Knowledge? ///
	TwoHeads MySpouse_SelfControl1xTwoHeads SelfControl2xTwoHeads ///
	$PVControls $PVControls_1 $PVControls_2) 

/* Get sample weights for PanelViews sample */	
** Get targets for sample means of $Controls_SumStats
foreach var in $Controls_SumStats {
	sum `var' [aw=projection_factor] 
	local mean = r(mean)
	display `mean'
	local WeightingVarsMeans = "`WeightingVarsMeans' `mean'"
}
display "`WeightingVarsMeans'"

gen byte InPVSample = 1
foreach var of varlist SelfControl1 Knowledge1 $PVControls {
	replace InPVSample = 0 if `var' == .
}

** Get weights
*ssc install ebalance
ebalance $Controls_SumStats, manualtargets(`WeightingVarsMeans') gen(PVSampleWeight), if InPVSample==1 // keep(Output/BalanceTable) replace
* Bound the sample weights to improve precision. The age and children variables are the hardest to match on, but still pretty close
replace PVSampleWeight = min(PVSampleWeight,4) if InPVSample==1 
replace PVSampleWeight = max(PVSampleWeight,0.25) if InPVSample==1 
	
	*/
/* Additional variable construction */
* SSB consumption per adult equivalent
foreach var of varlist kg_Purchased { 
	gen `var'_AdultEq = `var'/HouseholdSize
}

gen lnkg_Adult = ln(kg_Purchased/HouseholdSize +1)

* Get SSB consumption as a share of household calorie need
foreach var of varlist cals_Purchased {
	gen `var'_Need = `var'/(CalorieNeed*365)
}

*gen lnPVSSBCons = ln(PVSSBCons+1)

foreach var in AvPricePerKG  { 
	gen ln`var' = ln(`var')
}

/* Label variables */
label var kg_Purchased "SSBs purchased (liters)"
label var AvPricePerKG "Average price (\\$/liter)"

*label variable lnPVSSBCons "ln(SSB consumption (liters))"
label variable lnkg_Adult "ln(Liters/adult)"
label variable lnAvPricePerKG "ln(Average price/liter)"

label var lncountyIncome "ln(County income)"
forvalues l=1/3 {
	label var L`l'lncountyIncome "ln(County income) (t-`l')"
}

compress
saveold $Externals/Intermediate/HH-Year-FinalData.dta, replace
