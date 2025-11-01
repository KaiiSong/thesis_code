/* BiasEffects.do */
* To run this, must have ts2sls.ado in your ado directory

global weight = "[aw=PVSampleWeight1]" // Set weight to "" to help ts2sls run faster for tests. Otherwise each regression takes 90 minutes.

/* SETUP */
global Fig = "Output/Analysis/"
* Get OtherControls global: all the standard controls minus income and education
global OtherControls = subinstr("$Controls","lnIncome","",.)
global OtherControls = subinstr("$OtherControls","lnEduc","",.)
est drop _all

capture log close
log using Output/Analysis/LogFiles/BiasEffects.log, replace


*** Get average nutrition knowledge score of dietitions and nutritionists 
use "$Externals/Intermediate/Homescan/PanelViews.dta", replace
sum Knowledge if occcode_det==3030
global Nutritionist_Average_Knowledge = r(mean)
clear
set obs 1
gen var = $Nutritionist_Average_Knowledge
format var %12.2fc 
tostring var, replace force u
outfile var using "Output/Analysis/NumbersForText/NutritionistAverageKnowledge.tex", replace noquote

* This is about the 98th percentile
use $Externals/Intermediate/PanelViews-FinalData.dta, replace, if InPVSample1==1
_pctile Knowledge [aw=PVSampleWeight1],nq(100)
return list

/* PANELVIEWS INDIVIDUAL-LEVEL DATA */
use $Externals/Intermediate/PanelViews-FinalData.dta, replace, if InPVSample1==1

*** Regressions
local spec = "PVBias"
local YVar = "lnPVSSBCons"
local EndogVar = "SelfControl_FromSpouse"
include Code/Analysis/BiasEffects_Regressions.do


*** Save first stage predictions for use below 
save $Externals/Intermediate/PanelViews-FinalData_Temp.dta, replace





/* HOMESCAN HOUSEHOLD-LEVEL DATA */
*******************************************************************************
/* Using only primary shopper bias */
*** Data prep
use $Externals/Intermediate/HH-FinalData.dta, replace, if InPVSample1==1

foreach var in SelfControl Knowledge $PVControls {
	rename `var'1 `var'
}
label var SelfControl "Self-control"

*** Regressions
local spec = "HMSPrimShopBias"
local YVar = "lnHMSSSBCons"
local EndogVar = "MySpouse_SelfControl2"
include Code/Analysis/BiasEffects_Regressions.do

	

*******************************************************************************
/* Using average bias of all household heads */
*** Data prep
use $Externals/Intermediate/HH-FinalData.dta, replace, if InPVSample1==1

gen SelfControl=SelfControl_RatedBy1
label var SelfControl "Self-control"


** Imputation to predict household average Knowledge and $PVControls in two-head households with only one PanelViews respondent
foreach var in Knowledge $PVControls {
	gen `var'IsObs = cond(`var'2!=.|RatedSpouseSC==0,1,0) // Observed if either we have two responses or the single respondent is the only head of household

	areg `var'_Av Knowledge1 SelfControl $PVControls1 lnIncome lnEduc $OtherControls $weight, ///
		absorb(county) vce(robust), if `var'2!=. // Limit to households with two respondents to that specific question
	
	if "`var'" == "Knowledge" | "`var'" == "taste_soda" | "`var'" == "health_importance" {
		eststo Pred_HMS_`var'
		estadd local Controls "Yes"
		estadd local OtherControls "Yes"
		estadd local County "Yes"	
	}
	
	predict `var'Hat
	gen `var' = cond(`var'_Av!=.,`var'_Av,`var'Hat)
}


		*** Export imputation table
		esttab Pred_HMS_* using "Output/Analysis/Bias_Imputation.tex", replace ///
			b(%8.3f) se(%8.3f) /// 
			stats(Controls OtherControls County r2 r2_a N, l("Other beverage tastes" "Other demographics" "County indicators" "$ R^{2}$" "Adjusted $ R^{2}$" "N") ///
				fmt(%8.0fc %8.0fc %8.0fc %8.3f  %8.3f %8.0fc)) ///
			star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label /// mtitles ("PanelViews" "Homescan") ///
			mtitles("\shortstack{Nutrition \\ knowledge}" "\shortstack{Taste \\ for  soda}" "\shortstack{Health \\ importance}") ///
			keep(Knowledge1 SelfControl taste_soda1 health_importance1 lnIncome lnEduc) ///
			order(Knowledge1 SelfControl taste_soda1 health_importance1 lnIncome lnEduc) //


* Label the new variables
label var Knowledge "Nutrition knowledge"
label variable taste_soda "Taste for soda"
label variable health_importance "Health importance"


*** Regressions
local spec = "HMSBias"
local YVar = "lnHMSSSBCons"
local EndogVar = "SelfControl_RatedBy2"
include Code/Analysis/BiasEffects_Regressions.do


		*** Export interaction table
		label var SelfControl "Self-control"
		esttab HMSBias_Interaction PVBias_Interaction using "Output/Analysis/BiasEffects_Interactions.tex", replace ///
			b(%8.3f) se(%8.3f) /// 
			stats(Controls OtherControls County SelfControlIV r2 N, l("Other beverage tastes" "Other demographics" "County indicators" "Self-control 2SLS" "$ R^{2}$" "N") fmt(%8.0fc %8.0fc %8.0fc %8.0fc %8.3f %8.0fc)) ///
			star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label ///
			mtitles("Homescan" "PanelViews") ///
			keep(Knowledge SelfControl KnowledgeXSelfControl taste_soda health_importance lnIncome lnEduc) ///
			order(Knowledge SelfControl KnowledgeXSelfControl taste_soda health_importance lnIncome lnEduc) 


		*** Export first stage table
		esttab HMSBias_FirstStage using "Output/Analysis/Bias_FirstStage.tex", replace ///
			b(%8.3f) se(%8.3f) /// 
			stats(Controls OtherControls County r2 N, l("Other beverage tastes" "Other demographics" "County indicators" "$ R^{2}$" "N") fmt(%8.0fc %8.0fc %8.0fc %8.3f %8.0fc)) ///
			star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label /// mtitles ("PanelViews" "Homescan") ///
			nomtitles ///
			keep(Knowledge SelfControl taste_soda health_importance lnIncome lnEduc) ///
			order(Knowledge SelfControl taste_soda health_importance lnIncome lnEduc) //


*** Save first stage predictions for use below 
save $Externals/Intermediate/HH-FinalData_Temp.dta, replace



**************************************************************************
		
/* CALCULATE QUANTITY EFFECT OF BIAS AND GAMMA */
* Separate variables for self-control (SC), knowledge (K), and total (T)
global BiasEstList = "P K M" // Primary, knowledge-only, measurement error

use $Externals/Intermediate/HH-FinalData_Temp.dta, replace
append using $Externals/Intermediate/PanelViews-FinalData_Temp.dta, gen(PV)
gen HMS = 1-PV

*** Get knowledge, self-control, and interaction effects in units of ln(quantity)
foreach var in SC K { // I
	foreach est in $BiasEstList {
		gen `var'`est' = .
	}
}
foreach sample in HMS PV {
	foreach est in $BiasEstList {
		** Predict ln(quantity effect from regression results
		est restore `sample'Bias`est'
		
		if "`est'"=="M" { // for the measurement error correction, use the fitted first stage SelfControl variable
			local SelfControlVar = "SelfControl_Hat"
		} 
		else {
			local SelfControlVar = "SelfControl"
		}
		capture noisily replace SC`est' = (`SelfControlVar'-1) * _b[SelfControl] if `sample'==1 // Capture because SelfControl doesn't exist for the K estimates.
		replace K`est' = (Knowledge-$Nutritionist_Average_Knowledge) * _b[Knowledge] if `sample'==1 
		
		
		// replace I`est' = (KnowledgeXSelfControl-$Nutritionist_Average_Knowledge) * _b[KnowledgeXSelfControl] if `sample'==1
		
		* In some cases, the predicted bias is negative. (Either because people have higher nutrition knowledge than nutritionists, or because the measurement error correction gives expected knowledge or self-control > 1.
			* Eliminating this correction for now
		*replace K`est' = 0 if K`est' < 0 & `sample'==1
		*replaceSC`est' = 0 if SC`est' <0 & `sample'==1
		
	}
}
replace SCK = 0 // is missing because the K coefficient is zero.

** Total bias effect
foreach est in $BiasEstList {
	gen T`est' = SC`est' + K`est' // + I`est'
}
gen TN = KP + 2*SCP // Bias self-control coefficient fixed to 2x


*** Get compensated elasticity
* Winsorize and fill in missing data in AvPricePerKG. Winsorizing prices smoothes out the gamma figures.
sum AvPricePerKG [aw=PVSampleWeight1], d, if HMS==1
replace AvPricePerKG = min(AvPricePerKG,r(p90)) if AvPricePerKG!=.
replace AvPricePerKG = max(AvPricePerKG,r(p10)) if AvPricePerKG!=.
replace AvPricePerKG = r(mean) if AvPricePerKG==.

* Calculate compensated elasticity and compensated demand slope
gen zeta_c = .
gen CompensatedDemandSlope = .
	*gen PriceElasticity = cond(HHSampleMeanIncome<50000,$PriceElasticity_LowIncome,$PriceElasticity_HighIncome) // This uses the above vs. below $50k estimates
	*gen PriceElasticity = $PriceElasticity // This would use a homogeneous price elasticity
gen PriceElasticity = $PriceElast_IncomeHet_Intercept + HHSampleMeanIncome/100000*$PriceElast_IncomeHet_Slope // This would use the heterogeneous price elasticity from the appendix table.
gen IncomeElasticity = $IncomeElast_IncomeHet_Intercept + HHSampleMeanIncome/100000*$IncomeElast_IncomeHet_Slope

foreach sample in HMS PV {
	replace zeta_c = PriceElasticity - (IncomeElasticity / (1-MTR) ) * AvPricePerKG*`sample'SSBCons/Income if `sample'==1
	replace CompensatedDemandSlope = zeta_c * `sample'SSBCons/AvPricePerKG if `sample'==1
}

gen SampleWtXCompensatedDemandSlope = PVSampleWeight1 * CompensatedDemandSlope


*** Get gamma and overconsumption for each individual
foreach est in $BiasEstList N {
	gen gamma`est' = T`est' * AvPricePerKG / zeta_c
	
	gen BiasEffect`est'=.
*	gen sV_s`est' = . 
	foreach sample in HMS PV {
		replace BiasEffect`est' = 1-(exp(T`est'))^(-1) // This is "overconsumption attributable to bias."
		* replace BiasEffect`est' = exp(T`est') - 1 // This would be "overconsumption attributable to bias."
		* replace sV_s`est' = (exp(T`est'))^(-1) // This would be predicted normative consumption / actual consumption
	}
	
}



*** Get sample average gamma and overconsumption, for output below
foreach sample in HMS PV {
	foreach est in $BiasEstList N {
		* gamma
		sum gamma`est' [aw=SampleWtXCompensatedDemandSlope] if `sample'==1
		local gammabar`est'_`sample' = r(mean) * 100/33.814 // Translate gamma from dollars per liter to cents per ounce
		
		* Overconsumption
		*sum T`PrimaryEstimate' [aw=PVSampleWeight1] if `sample'==1
		sum BiasEffect`est' [aw=PVSampleWeight1] if `sample'==1
		local BiasEffect`est'_`sample' = r(mean) 
		
		*sum sV_s`est'[aw=PVSampleWeight1] if `sample'==1
		*local sV_s_`sample' = r(mean) 
	}
	* Save primary estimates without the P, for output below.
	local gammabar_`sample' = `gammabarP_`sample''
	local BiasEffect_`sample' = `BiasEffectP_`sample''
}


/*
* Covariance between gamma and consumption
gen gammaXs = gamma`PrimaryEstimate'*HMSSSBCons
correlate gammaXs HMSSSBCons [aw=PVSampleWeight1] , covariance 
global sigma_gammaXs_s = r(cov_12) 
* variance of consumption
global sigma_s_s = r(Var_2)
*/


****************************
preserve

	**** Output bias by income for simulations
		* get bias, price elasticity, and residual variance of consumption
	** Collapse gamma weighting by demand slope
	collapse (mean) gamma? [pw=SampleWtXCompensatedDemandSlope], by(IncomeGroup HMS)
	/* Residualizing of income does little
	foreach var in gamma HMSSSBCons {
		reg `var' Income c.Income#c.Income [pw=PVSampleWeight1] if HMS==1
		predict `var'_Resid, residual
	}
	*/
	foreach var of varlist gamma? {
		rename `var' `var'bar
	}
	save $Externals/Intermediate/Bias_Income_Temp.dta, replace

	restore
	preserve
	** Collapse weighting by sample weight only
	*gen Consumption = cond(HMS==1,HMSSSBCons,PVSSBCons)
	foreach var of varlist gamma? {
		gen `var'sd = `var'
		rename `var' `var'mean
	}	
	collapse (mean)  gamma?mean (sd) gamma?sd /* ResidualSD_gamma = gamma_Resid ResidualSD_consumption = HMSSSBCons_Resid */ ///
		[aw=PVSampleWeight1], by(IncomeGroup HMS)

	merge 1:1 IncomeGroup HMS using $Externals/Intermediate/Bias_Income_Temp.dta, nogen
	
	reshape wide gamma*, i(IncomeGroup) j(HMS)
	outsheet using $Externals/Intermediate/Simulations/BiasByIncome.csv, comma names replace

restore
****************************

*** Collapse to income group level
** Collapse gamma weighting by demand slope
	preserve
	collapse (mean) gamma? [pw=SampleWtXCompensatedDemandSlope], by(IncomeGroup HMS PV) // (rawsum) SampleWtXCompensatedDemandSlope  I`PrimaryEstimate' 
	save $Externals/Intermediate/Bias_Income_Temp.dta, replace
	restore
	
** Collapse quantity effects weighting by sample weight
collapse (mean) K? SC? T? BiasEffect? [pw=PVSampleWeight1], by(IncomeGroup HMS PV) // (rawsum) SampleWtXCompensatedDemandSlope  I`PrimaryEstimate' 
	merge 1:1 IncomeGroup HMS using $Externals/Intermediate/Bias_Income_Temp.dta, nogen

	erase $Externals/Intermediate/Bias_Income_Temp.dta

	
* Translate gamma from dollars per liter to cents per ounce
foreach var of varlist gamma? {
	replace `var' = `var' * 100/33.814
}

*** Make figures
** Separate figures for HMS and PV
foreach sample in HMS PV {
	** Overconsumption attributable to bias
	local var = "BiasEffect"
	include Code/Analysis/FigureTitles.do
	twoway (scatter BiasEffectP IncomeGroup if `sample'==1) (lfit BiasEffectP IncomeGroup if `sample'==1), ///
		graphregion(color(white)) ///
		xtitle("Household income ($000s)") ytitle("`varlabel'") ///
		xlabel(0(25)125) xscale(range(0 125)) legend(off) //
	
	
	graph export $Fig/BiasEffect_`sample'_Income.pdf, as(pdf) replace
	
	** gamma
	local var = "gamma"
	include Code/Analysis/FigureTitles.do
	** gamma
	twoway (scatter gammaP IncomeGroup if `sample'==1) (lfit gammaP IncomeGroup if `sample'==1), ///
		graphregion(color(white)) ///
		xtitle("Household income ($000s)") ytitle("`varlabel'") ///
		xlabel(0(25)125) xscale(range(0 125)) legend(off)

	graph export $Fig/gamma_`sample'_Income.pdf, as(pdf) replace
	
	
}


*** Overconsumption attributable to bias; both HMS and PV on the same figure
local var = "BiasEffect"	
include Code/Analysis/FigureTitles.do

	twoway (scatter BiasEffectP IncomeGroup if PV==1, msymbol(square) mcolor(maroon) lcolor(maroon)) ///
		(scatter BiasEffectP IncomeGroup if HMS==1, mcolor(dknavy) lcolor(dknavy)) , ///
		graphregion(color(white)) ///
		xtitle("Household income ($000s)") ytitle("`varlabel'") ///
		xlabel(0(25)125) xscale(range(0 125)) /// ylabel(0(1)3) yscale(range(0 3)) ///
		legend(label(1 "PanelViews self-reports") label(2 "Homescan purchases") )

	graph export $Fig/BiasEffect_Income.pdf, as(pdf) replace

	
*** gamma; both HMS and PV on the same figure
local var = "gamma"
include Code/Analysis/FigureTitles.do

	twoway (scatter gammaP IncomeGroup if PV==1, msymbol(square) mcolor(maroon) lcolor(maroon)) ///
		(scatter gammaP IncomeGroup if HMS==1, mcolor(dknavy) lcolor(dknavy)) , ///
		graphregion(color(white)) ///
		xtitle("Household income ($000s)") ytitle("`varlabel'") ///
		xlabel(0(25)125) xscale(range(0 125)) ///
		ylabel(0(1)3) yscale(range(0 3)) ///
		legend(label(1 "PanelViews self-reports") label(2 "Homescan purchases") )

	graph export $Fig/gamma_Income.pdf, as(pdf) replace



******************************************************************

/* Output numbers for text */
* Get gamma bars for low and high income
sum gammaP if IncomeGroup==5&HMS==1
local gammabar_LowIncome_HMS = r(mean)
sum gammaP if IncomeGroup==125&HMS==1
local gammabar_HighIncome_HMS = r(mean)

foreach sample in HMS PV {
	sum BiasEffectP if IncomeGroup==5&`sample'==1
	local BiasEffect_LowIncome_`sample' = r(mean)
	sum BiasEffectP if IncomeGroup==125&`sample'==1
	local BiasEffect_HighIncome_`sample' = r(mean)
}

** Output average quantity effect of bias and average marginal biases
foreach var in BiasEffect_HMS BiasEffect_PV BiasEffect_LowIncome_HMS BiasEffect_HighIncome_HMS BiasEffect_LowIncome_PV BiasEffect_HighIncome_PV ///
	gammabar_HMS gammabar_PV gammabar_LowIncome_HMS gammabar_HighIncome_HMS  {
	clear 
	set obs 1 
	if strpos("`var'","BiasEffect")!=0 {
		gen var = round(``var''*100,1) // Print in percent terms
		format var %12.0fc 
	}
	else {
		gen var = round(``var'',0.01) // Print in cents per ounce, rounded to the nearest 0.01 cents
		format var %12.2fc 
	}
	
	tostring var, replace force u
	outfile var using "Output/Analysis/NumbersForText/`var'.tex", replace noquote
}
** Output sV_s
foreach var in BiasEffect_HMS BiasEffect_PV {
	clear
	set obs 1 
	gen var = round((1-``var'')*100,1)
	format var %12.0fc 
	tostring var, replace force u
	outfile var using "Output/Analysis/NumbersForText/OneMinus`var'.tex", replace noquote
}
/*
** Output quantity effect of bias in percent terms. ("X percent of observed consumption is explained by bias.")
foreach var in BiasEffect_HMS BiasEffect_PV BiasEffect_LowIncome_HMS BiasEffect_HighIncome_HMS BiasEffect_LowIncome_PV BiasEffect_HighIncome_PV {
	clear 
	set obs 1 
	gen var = round((1-1/exp(``var'')) * 100,1)
	format var %12.0fc 
	tostring var, replace force u
	outfile var using "Output/Analysis/NumbersForText/Pct`var'.tex", replace noquote
}
*/

*** First stage of self-control measurement error correction
est restore HMSBias_FirstStage
clear 
set obs 1 
gen var = round(_b[SelfControl],0.01)
format var %12.2fc 
tostring var, replace force u
outfile var using "Output/Analysis/NumbersForText/1stStageSelfControl.tex", replace noquote






**************************************************************************
/* GRAPHICAL EVIDENCE OF LINEARITY */

* use $Externals/Intermediate/HH-FinalData.dta, replace, if InPVSample1==1
use $Externals/Intermediate/HH-FinalData_Temp.dta, replace // This uses the imputed data and second-stage predicted self-control

binscatter lnHMSSSBCons Knowledge [aw=PVSampleWeight1], ///
	absorb(county) controls(  SelfControl  $PVControls lnIncome lnEduc $OtherControls ) nq(10) ///
	xtitle("Nutrition knowledge") ytitle("ln(Liters)") ///
	title("Homescan: Nutrition Knowledge")
graph save $Fig/Linearity_HMSKnowledge.gph, replace
	
binscatter lnHMSSSBCons SelfControl [aw=PVSampleWeight1], ///
	absorb(county) controls(  Knowledge $PVControls lnIncome lnEduc $OtherControls ) nq(10) ///
	xtitle("Self-control") ytitle("ln(Liters)") ///
	title("Homescan: Self-Control")
	
graph save $Fig/Linearity_HMSSelfControl.gph, replace	


	
use $Externals/Intermediate/PanelViews-FinalData_Temp.dta, replace, if InPVSample1==1
binscatter lnPVSSBCons Knowledge [aw=PVSampleWeight1], ///
	absorb(county) controls(  SelfControl  $PVControls lnIncome lnEduc $OtherControls ) nq(10) ///
	xtitle("Nutrition knowledge") ytitle("ln(Liters)") ///
	title("PanelViews: Nutrition Knowledge")
graph save $Fig/Linearity_PVKnowledge.gph, replace

binscatter lnPVSSBCons SelfControl [aw=PVSampleWeight1], ///
	absorb(county) controls(  Knowledge $PVControls lnIncome lnEduc $OtherControls ) nq(10) ///
	xtitle("Self-control") ytitle("ln(Liters)") ///
	title("PanelViews: Self-Control")
graph save $Fig/Linearity_PVSelfControl.gph, replace	

graph combine $Fig/Linearity_HMSKnowledge.gph $Fig/Linearity_HMSSelfControl.gph ///
	$Fig/Linearity_PVKnowledge.gph $Fig/Linearity_PVSelfControl.gph, ///
	rows(2) graphregion(color(white))
graph export $Fig/Linearity.pdf, as(pdf) replace




erase $Externals/Intermediate/PanelViews-FinalData_Temp.dta
erase $Externals/Intermediate/HH-FinalData_Temp.dta


log close
