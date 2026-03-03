/* ExistingSodaTaxLevels.do */
* This creates an introductory figure of existing soda tax levels

import excel "$Externals\Data\ExistingSodaTaxLevels.xlsx", sheet("Sheet1") firstrow clear

keep if _n<=16
gen order = _n

graph hbar (mean) Amountcentsounce, over(Location, sort(order)) ///
	graphregion(color(white)) ///
	ytitle("Tax level (cents per ounce)")

graph export Output/Analysis/ExistingSodaTaxLevels.pdf, as(pdf) replace
	
	
