/* s_pref.do */
* This creates figures illustrating s_pref


/* INCOME EFFECTS VS. BETWEEN-INCOME PREFERENCE HETEROGENEITY FIGURE */
** Collapse to annual average by income group
use $Externals/Intermediate/HH-Year-FinalData.dta, replace
sum kg_Purchased_AdultEq [aw=projection_factor]
local Average_kg_Purchased = r(mean)
collapse (mean) kg_Purchased_AdultEq [pw=projection_factor], by(IncomeGroup)

gen IncomeElasticity = $IncomeElast_IncomeHet_Intercept + IncomeGroup/100*$IncomeElast_IncomeHet_Slope // Divide IncomeGroup by 100 to go from units of $k to units of $100k


** Get consumption predicted by income effects only
gen kg_Adult_IncomeEffect = kg_Purchased_AdultEq if _n==1
replace kg_Adult_IncomeEffect = kg_Adult_IncomeEffect[_n-1]*(IncomeGroup/IncomeGroup[_n-1])^((IncomeElasticity+IncomeElasticity[_n-1])/2) if _n>1

/*
* Alternative calculations
	* Assume constant slope within income bin
	gen s_prime_inc = IncomeElasticity*kg_Purchased_AdultEq/IncomeGroup // Change per $1k income
	gen kg_Adult_IncomeEffect1 = kg_Purchased_AdultEq if _n==1
	replace kg_Adult_IncomeEffect1 = kg_Adult_IncomeEffect1[_n-1] + s_prime_inc * (IncomeGroup-IncomeGroup[_n-1]) if _n>1

	* For comparison: assuming constant income elasticity
	sum kg_Purchased_AdultEq if _n==1
	local kg_Purchased_Adult_Eq1 = r(mean)
	sum IncomeGroup if _n==1
	local z_min = r(mean)
	gen kg_Adult_IncomeEffect = kg_Purchased_AdultEq if _n==1
	gen kg_Adult_ConstantIncomeEffect = `kg_Purchased_Adult_Eq1' * (IncomeGroup/`z_min')^$IncomeElasticity
*/

* Get s_pref
gen s_pref = kg_Purchased_AdultEq - kg_Adult_IncomeEffect

sum s_pref if _n==_N
local s_pref_highestIncome = -1*r(mean)

/* Figure using actual data */

	local var = "kg_Purchased_AdultEq"
	include Code/Analysis/FigureTitles.do
	
	twoway (scatter kg_Purchased_AdultEq IncomeGroup, mcolor(navy)) ///
		(line kg_Adult_IncomeEffect IncomeGroup) ///
		(scatter s_pref IncomeGroup, mcolor(maroon) ms(X)), ///
		graphregion(color(white) lwidth(medium)) ///
		xtitle("Household income ($000s)") ytitle("`varlabel'") ///
		xlabel(0(25)125) xscale(range(0 125)) ///
		legend(label(1 "Actual") label(2 "Predicted using only income elasticity") ///
		label(3 "Actual - predicted (effect of preference heterogeneity)") holes(3))
	
	graph export Output/Analysis/PrefHetVsIncomeEffects.pdf, as(pdf) replace



** Outsheet results for text
* s_pref at highest income
clear
set obs 1 
gen var = round(`s_pref_highestIncome',1)
outfile var using "Output/Analysis/NumbersForText/s_pref_highestIncome.tex", replace

* Multiple of highest consumption
clear
set obs 1
gen var = round(`s_pref_highestIncome'/`Average_kg_Purchased',0.1)
outfile var using "Output/Analysis/NumbersForText/s_pref_Average.tex", replace
