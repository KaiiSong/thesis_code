/* GetGroupConsumptionAndPrices.do */
* Note that this gets average consumption and price for the last year of the data. 
	* This is appropriate for the simulations and for the comparison to PanelViews. However, it means that Figure 1 and the s_pref figure will not match up with the simulation inputs.

/* Get average household consumption by income group */
use $Externals/Intermediate/HH-Year-FinalData.dta, replace, if year==$EndYear
append using $Externals/Intermediate/PanelViews-FinalData.dta
replace projection_factor = PVSampleWeight1 if PVSampleWeight1!=.
gen NHouseholds = projection_factor
*replace IncomeGroup = 15 if IncomeGroup==5
** Collapse to annual average by income group
collapse (mean) Mean_kg_Purchased_AdultEq = kg_Purchased_AdultEq Mean_PVSSBCons = PVSSBCons  ///
	(sd) SD_kg_Purchased_AdultEq = kg_Purchased_AdultEq SD_PVSSBCons = PVSSBCons (rawsum) NHouseholds ///
	[aw=projection_factor], by(IncomeGroup)

*** Combined graph of Homescan vs. PanelViews consumption by income
	twoway (connect Mean_PVSSBCons IncomeGroup, /* yaxis(2) */ lp(-) msymbol(square) mcolor(maroon) lcolor(maroon)) ///
		(connect Mean_kg_Purchased_AdultEq IncomeGroup, mcolor(dknavy) lcolor(dknavy)), ///
		graphregion(color(white) lwidth(medium)) ///
		xtitle("Household income ($000s)") ytitle("Liters purchased per adult equivalent per year") /// ytitle("Homescan SSB purchases (liters/adult equivalent)") ytitle("PanelViews self-reported SSB intake (liters/adult)" /* ,axis(2) */ ) ///
		xlabel(0(25)125) xscale(range(0 125)) /// ylabel(60(20)120, axis(2)) yscale(range(60 120) axis(2)) ///
		legend(label(1 "PanelViews self-reports") label(2 "Homescan purchases (2016)") ) // legend(label(1 "PanelViews") label(2 "Homescan"))
	
	global Fig = "Output/Analysis/DescriptiveCorrelations"
	graph export $Fig/Homescan_PanelViews_Consumption_Income.pdf, as(pdf) replace



outsheet using $Externals/Intermediate/Simulations/ConsumptionByIncome.csv, comma names replace


/* Get average price */
use $Externals/Intermediate/HH-Year-FinalData.dta, replace, if year==$EndYear

collapse (mean) AvPricePerKG [pw=projection_factor]

outsheet using $Externals/Intermediate/Simulations/AveragePrice.csv, comma names replace

/*
/* Average price by income */
use $Externals/Intermediate/HH-Year-FinalData.dta, replace, if year==$EndYear
collapse (mean) AvPricePerKG [pw=projection_factor], by(IncomeGroup)

outsheet using $Externals/Intermediate/Simulations/AveragePriceByIncome.csv, comma names replace
*/
