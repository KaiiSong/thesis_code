/* DescriptiveCorrelations.do */
* This file presents descriptive correlations for the bias estimation


global Fig = "Output/Analysis/DescriptiveCorrelations"


/* DATA PREP */
/* Get average nutrition knowledge score of dietitions and nutritionists */
use "$Externals/Intermediate/Homescan/PanelViews.dta", replace
sum Knowledge if occcode_det==3030
global Nutritionist_Average_Knowledge = r(mean)



*******************************************************************************

/* CREATE FIGURES */
/* Figures with Homescan data by income group, so weight by projection_factor */
use $Externals/Intermediate/HH-Year-FinalData.dta, replace
*append using $Externals/Intermediate/PanelViews-FinalData.dta
*replace projection_factor = PVSampleWeight1 if PVSampleWeight1!=.

sum cals_Purchased_Need [aw=projection_factor]

** Collapse to annual average by income group
collapse (mean) kg_Purchased_AdultEq  /// cals_Purchased_Need PVSSBCons
	[pw=projection_factor], by(IncomeGroup)

** Loop over variables to make graphs
foreach var in kg_Purchased_AdultEq { // cals_Purchased_Need
	include Code/Analysis/FigureTitles.do
	
	twoway (scatter `var' IncomeGroup) (lfit `var' IncomeGroup), ///
		graphregion(color(white) lwidth(medium)) ///
		xtitle("Household income ($000s)") ytitle("`varlabel'") ///
		xlabel(0(25)125) xscale(range(0 125)) legend(off)
	
	graph export $Fig/`var'_Income.pdf, as(pdf) replace
}

** Export numbers for text
sum kg_Purchased if IncomeGroup==5
local kg_Purchased_lowestIncome = r(mean)

sum kg_Purchased if IncomeGroup==125
local kg_Purchased_highestIncome = r(mean)


clear 
set obs 1 
gen kg_Purchased = round(`kg_Purchased_lowestIncome',1)
outfile kg_Purchased using "Output/Analysis/NumbersForText/kg_Purchased_lowestIncome.tex", replace

clear 
set obs 1 
gen kg_Purchased = round(`kg_Purchased_highestIncome',1)
outfile kg_Purchased using "Output/Analysis/NumbersForText/kg_Purchased_highestIncome.tex", replace

	
/* Figures with PanelViews data by income group, so weight by PVSampleWeight1 */
*use $Externals/Intermediate/HH-FinalData.dta, replace, if InPVSample1==1
use $Externals/Intermediate/PanelViews-FinalData.dta, replace, if InPVSample1==1
local VarList = "Knowledge SelfControl taste_soda health_importance"
foreach var in `VarList' {
	sum `var' [aw=PVSampleWeight1]
	local `var'_sd = r(sd)
}
** Collapse to average by income group
collapse (mean) `VarList' /// self_control
	[pw=PVSampleWeight1], by(IncomeGroup)

** Loop over variables to make graphs
foreach var in Knowledge SelfControl taste_soda health_importance {
	include Code/Analysis/FigureTitles.do
	
	twoway (scatter `var' IncomeGroup) (lfit `var' IncomeGroup), ///
		graphregion(color(white) lwidth(medium)) ///
		xtitle("Household income ($000s)") ytitle("`varlabel'") ///
		xlabel(0(25)125) xscale(range(0 125)) legend(off)
	
	graph export $Fig/`var'_Income.pdf, as(pdf) replace
}

** Export numbers for text
foreach var in `VarList' {
	sum `var' if IncomeGroup==5
	local `var'_5 = r(mean)
	sum `var' if IncomeGroup==125
	local `var'_125 = r(mean)
}

foreach var in `VarList' {
	* Difference between highest- and lowest-income households
	clear
	set obs 1
	gen var = abs(round(``var'_125'-``var'_5',0.01))
	format var %12.2fc 
	tostring var, replace force u
	outfile var using "Output/Analysis/NumbersForText/`var'_Diff.tex", replace noquote
	
	* In units of standard deviations
	clear
	set obs 1
	gen var = abs(round((``var'_125'-``var'_5')/``var'_sd',0.01))
	format var %12.2fc 
	tostring var, replace force u
	outfile var using "Output/Analysis/NumbersForText/`var'_Diff_SDs.tex", replace noquote
}



/* Correlation between bias proxies and SSB consumption */
use $Externals/Intermediate/HH-FinalData.dta, replace
* We are using primary shopper variables for these
	gen Knowledge = Knowledge1
	gen SelfControl = SelfControl1
	
local var = "kg_Purchased_AdultEq"
include Code/Analysis/FigureTitles.do

** Nutrition knowledge
foreach spec in "" Controls  {
	binscatter HMSSSBCons Knowledge, ///
		ytitle("`varlabel'") xtitle("Nutrition knowledge") ///
		xlabel(0.4(0.1)1) nq(10) /// graphr(lp() ilp()) plotr(lp() ilp()) nb these don't kill the outer lines
		xline($Nutritionist_Average_Knowledge,lc(green)) ///
		text(75 $Nutritionist_Average_Knowledge "Average score of dietitians" "and nutritionists", ///
		placement(w) just(right) margin(r+1)) controls(${`spec'}) //

	graph export $Fig/SSB_Knowledge`spec'.pdf, as(pdf) replace


	** Self-control
	if "`spec'" == "Controls" {
		local options = "nq(20)"
	}
	else {
		local options = "discrete"
	}
	*replace SelfControl=round(SelfControl*1000000)/1000000 // this is a kludge because there are two different values at 0.5 that Stata is plotting differently, I think due to floating point precision.
	binscatter HMSSSBCons SelfControl, ///
		ytitle("`varlabel'") xtitle("Self-control") /// 
		`options' ///
		xline(1,lc(green)) ///
		text(107 1 "I drink SSBs more" "often than I should:" "Not at all", ///
		placement(w) just(right) margin(r+1)) controls(${`spec'})  //
		
	graph export $Fig/SSB_SelfControl`spec'.pdf, as(pdf) replace

}
