/* SubstitutionPatterns.do */
* This file estimates substitution to other drink categories and to sugary foods.

global SinGoodList1 = "3 5 11 12 13 14 15 16 17 18 19 20" // Sin goods include juice, diet drinks, and all the substitute food/tobacco/alcohol groups
global SinGoodList2 = "3 11 12 13 14 15 16 17 18 19 20" // Excluding diet drinks
global SinGoodList3 = "5" // With only diet drinks

use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
label variable L0lnAvPricePerKG "ln(Average price/liter) (SSBs)"
label variable L0feature "Feature (SSBs)"
label variable L0display "Display (SSBs)"

* Set up mean elasticity variables for the food substitutes
local MeanSubElastb = 0
local MeanSubElastse = 0
local NSubs=0

** Run regressions for each substitute gropu
foreach group in $SinGoodList1 { // $SubstituteGroupList

	** Create variables
	capture noisily drop lnAvPricePerKGgroup L0${PrimaryIV}group L0featuregroup L0displaygroup
	foreach var in lnAvPricePerKG L0${PrimaryIV} L0feature L0display {
		gen `var'group = `var'`group' 
	}
	label variable lnAvPricePerKGgroup "ln(Average price/kg)"
	label var L0featuregroup "Feature"
	label var L0displaygroup "Display"

	
	** Estimate regression
	reghdfe lnkg_Adult`group' lncountyIncome L0feature L0display L0featuregroup L0displaygroup $DemandControls ///
		(L0lnAvPricePerKG lnAvPricePerKGgroup = L0$PrimaryIV L0${PrimaryIV}group) [pw=projection_factor], ///
		absorb(i.household_code#i.county i.YQ) vce(cluster county)
	eststo Sub`group'
	
	** Store statistics related to calculation of varphi
	* Expenditures
	gen expend`group' = AvPricePerKG`group'*exp(lnkg_Adult`group')
	replace expend`group' = 0 if expend`group'==.
	sum expend`group' [aw=projection_factor]
	local expend = r(mean)
	estadd scalar expend `expend'

	* Get dxrk/dt, the slope of expenditures wrt SSB price for each household, depending on the cross price elasticity and that household's consumption level
	gen dx`group'_dt = _b[L0lnAvPricePerKG] * expend`group' / AvPricePerKG  // Note that this is missing if zero consumption	
	replace dx`group'_dt = 0 if dx`group'_dt==. // Assume zero substitution if zero purchases of the substitute. This matters most for tobacco, as most households purchase zero tobacco, and HA thinks it’s most correct to assume that they would also purchase zero even if the SSB price went up.
	*sum dx`group'_dt [aw=projection_factor]
	*local dxdt = r(mean)
	*estadd scalar dxdt `dxdt'

	
	* Store mean elasticity information
		local MeanSubElastb = `MeanSubElastb' + _b[L0lnAvPricePerKG]
		local MeanSubElastse = `MeanSubElastse' + (_se[L0lnAvPricePerKG])^2
		local NSubs = `NSubs'+1
		di "`MeanSubElastb'"
		di `NSubs'
	
}	
/*
** Non-sin substitute drinks, for reference
	esttab Sub1 Sub6 Sub8 using "Output/Analysis/SubstitutionPatterns.tex", replace ///
		b(%8.3f) se(%8.3f) ///
		stats(widstat N, ///
		l("Kleibergen-Paap first stage F stat" "N") fmt(%12.1fc %12.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label /// 
		mtitles("\shortstack{Coffee \\ and tea}" "Milk" "Water") ///
		drop($DemandControls)
		*/
** Sin good substitutes, panel (a)
	esttab Sub11 Sub5 Sub3 Sub12 Sub13 Sub14 using "Output/Analysis/SubstitutionPatterns1.tex", replace ///
		b(%8.3f) se(%8.3f) ///
		stats(widstat N expend, ///
		l("Kleibergen-Paap first stage F stat" "N" "Expenditures (\\$/adult-quarter)") fmt(%12.1fc %12.0fc %12.2fc)) /// "d(Expenditures)/d(SSB price)"
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label /// 
		mtitles("Alcohol" "\shortstack{Diet \\ drinks}" "\shortstack{Fruit \\ juice}" ///
			"\shortstack{Baked \\ goods}" "\shortstack{Baking \\ supplies}" "\shortstack{Breakfast \\ foods}") ///
		drop($DemandControls)

** Sin good substitutes, panel (b)
	esttab Sub15 Sub16 Sub17 Sub18 Sub19 Sub20 using "Output/Analysis/SubstitutionPatterns2.tex", replace ///
		b(%8.3f) se(%8.3f) ///
		stats(widstat N expend, ///
		l("Kleibergen-Paap first stage F stat" "N" "Expenditures (\\$/adult-quarter)") fmt(%12.1fc %12.0fc %12.2fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label /// 
		mtitles("Candy" "\shortstack{Canned, \\ dry fruit}" ///
			"Desserts" "\shortstack{Sauces, \\ condiments}" ///
			"Sweeteners" "Tobacco") ///
		drop($DemandControls)


local MeanSubElastb = `MeanSubElastb'/`NSubs'
local MeanSubElastse = (1/`NSubs') * (`MeanSubElastse')^(0.5)		
di "Average cross-price elasticity is `MeanSubElastb', with SE of the average equal to `MeanSubElastse'."



*** Spike plot of regression results: use SocialMediaEffects graph formatting


*** Calculate and output varphi
** Get -1 * dxs_dt, -1 times the slope of SSB expenditures wrt the SSB price
gen PriceElasticity = $PriceElast_IncomeHet_Intercept + HHSampleMeanIncome/100000*$PriceElast_IncomeHet_Slope // This would use the heterogeneous price elasticity from the appendix table.
gen Neg_dxs_dt = PriceElasticity * kg_Purchased  

foreach list in 1 2 3 {
	gen dxbar`list'_dt = 0
	foreach group in ${SinGoodList`list'} {
		replace dxbar`list'_dt = dxbar`list'_dt + dx`group'_dt // cond(dx`group'_dt!=.,dxbar`list'_dt + dx`group'_dt,dxbar`list'_dt) 
	}
	gen varphi`list' = dxbar`list'_dt / Neg_dxs_dt // Note that this is missing if zero consumption (because that makes Neg_dxs_dt=0), so the varphi parameter is the average over households that purchase positive SSB amounts. This is consistent because this is an adjustment to average marginal bias, and you're not marginal if you are already consuming zero SSBs.
}

collapse (mean) varphi? [aw=projection_factor]

** Output the varphi parameters for the simulations
outsheet using $Externals/Intermediate/Simulations/varphi.csv, comma names replace


** Output the varphi parameters for text
foreach var of varlist varphi? {
	sum `var'
	local `var' = r(mean)
}
foreach var in varphi1 varphi2 varphi3 MeanSubElastb { // MeanSubElastse
	clear
	set obs 1
	gen `var' = round(``var'',0.01)
	outfile `var' using "Output/Analysis/NumbersForText/`var'.tex", replace noquote
}
