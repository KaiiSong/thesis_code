/* DescribingInstrument.do */
* This file presents descriptive correlations for the demand estimation - both price and income elasticities.


/* INCOME EFFECTS IDENTIFICATION */
** Income effects binscatter
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
* Run mechanical 2sls. The reason is that lncountyIncome is also correlated with the predicted instrument, so to get the IV coefficient right for lncountyIncome, we need to actually be running the 2sls regression. If we don't do this, the coefficient doesn't match the IV estimates.
reghdfe L0lnAvPricePerKG L0$PrimaryIV lncountyIncome L0feature L0display $DemandControls i.YQ [aw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
predict p_hat

binscatter lnkg_Adult lncountyIncome [aw=projection_factor], ///
	absorb(HHxCounty) controls(p_hat L0feature L0display $DemandControls i.YQ) noaddmean nq(10) ///
	xtitle("ln(County income)") ytitle("ln(Liters purchased per adult equivalent)")
graph export Output/Analysis/DescribingInstrument/IncomeEffects.pdf, as(pdf) replace

/*
* For comparison, here is the figure controlling for the IV instead of the fitted values
binscatter lnkg_Adult lncountyIncome [aw=projection_factor], ///
	absorb(HHxCounty) controls(L0$PrimaryIV L0feature L0display i.YQ) nq(12) /// L0$PrimaryIV
	xtitle("ln(County income)") ytitle("ln(Liters purchased per adult equivalent)")
*/

** Income effects identification maps
*use $Externals/Intermediate/Geographic/zip-county_Collapse.dta, replace, if year==2006|year==2009
use $Externals/Intermediate/Geographic/county-year.dta, replace, if year==2007|year==2009
sort county year
*gen PctIncomeChange = (zipIncome-zipIncome[_n-1])/zipIncome[_n-1] if year==2009 & county==county[_n-1]
gen PctIncomeChange = (countyIncome-countyIncome[_n-1])/countyIncome[_n-1] if year==2009 & county==county[_n-1]
keep if year==2009
*maptile_install using "http://files.michaelstepner.com/geo_county2010.zip"
maptile PctIncomeChange, geography(county2010) conus stateoutline(medthick) revcolor spopt(mosize(vvthin)) twopt(legtitle(Income change)) nq(10)  // twopt(legend(off))
graph export Output/Analysis/DescribingInstrument/IncomeChangeEarly.pdf, as(pdf) replace

*use $Externals/Intermediate/Geographic/zip-county_Collapse.dta, replace, if year==2009|year==2015
use $Externals/Intermediate/Geographic/county-year.dta, replace, if year==2009|year==2015
sort county year
*gen PctIncomeChange = (zipIncome-zipIncome[_n-1])/zipIncome[_n-1] if year==2015 & county==county[_n-1]
gen PctIncomeChange = (countyIncome-countyIncome[_n-1])/countyIncome[_n-1] if year==2015 & county==county[_n-1]
keep if year==2015
*maptile_install using "http://files.michaelstepner.com/geo_county2010.zip"
maptile PctIncomeChange, geography(county2010) conus stateoutline(medthick) revcolor spopt(mosize(vvthin)) twopt(legtitle(Income change)) nq(10)  // twopt(legend(off))
graph export Output/Analysis/DescribingInstrument/IncomeChangeLate.pdf, as(pdf) replace



/* PRICE ELASTICITY IDENTIFICATION */		
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace

** First stage binscatter
binscatter lnAvPricePerKG L0$PrimaryIV, absorb(HHxCounty) controls(lncountyIncome L0feature L0display $DemandControls i.YQ) ///
	xtitle("Local price IV") ytitle("ln(Average price/liter)") // nq(10)
graph export Output/Analysis/DescribingInstrument/1stStage.pdf, as(pdf) replace

* Export the slope
reghdfe L0lnAvPricePerKG L0$PrimaryIV lncountyIncome L0feature L0display $DemandControls i.YQ [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
local FirstStage = _b[L0$PrimaryIV]
clear 
set obs 1 
gen var = round(_b[L0$PrimaryIV],0.01)
outfile var using "Output/Analysis/NumbersForText/1stStage.tex", replace

	
	
** Reduced form binscatter
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
binscatter lnkg_Adult L0$PrimaryIV, absorb(HHxCounty) controls(lncountyIncome L0feature L0display $DemandControls i.YQ) ///
	xtitle("Local price IV") ytitle("ln(Liters purchased per adult equivalent)")
graph export Output/Analysis/DescribingInstrument/ReducedForm.pdf, as(pdf) replace

* Export the slope
reghdfe lnkg_Adult L0$PrimaryIV lncountyIncome L0feature L0display $DemandControls i.YQ [pw=projection_factor], ///
	absorb(HHxCounty) vce(cluster county)
clear 
set obs 1 
gen var = -1*round(_b[L0$PrimaryIV],0.01)
outfile var using "Output/Analysis/NumbersForText/ReducedForm.tex", replace

* Display Wald estimate
local Wald = _b[L0$PrimaryIV]/`FirstStage'
display `Wald'
clear 
set obs 1 
gen var = -1*round(`Wald',0.01)
format var %12.2fc 
outfile var using "Output/Analysis/NumbersForText/Wald.tex", replace noquote


/* ILLUSTRATING PRICE VARIATION */
/*
** Find the top-selling UPC in 2015
use $Externals/Data/RMS/MovementUPCStoreTime_$EndYear.dta, replace
collapse (sum) units, by(upc)
gsort -units
keep if _n==1
keep upc
merge 1:1 upc using $Externals/Intermediate/RMS/rms_versions_$EndYear.dta, nogen keep(match)
saveold $Externals/Intermediate/RMS/BestSellingUPC.dta, replace 
*/
// Hard-coded below: upc==4900002890, upc_ver_uc==2


*** Data prep: price trends for best selling UPC
use upc store_code_uc YQ price using $Externals/Intermediate/RMS/UPC-Store-Time_Instruments.dta, replace, if upc==4900002890 
*merge m:1 upc using $Externals/Intermediate/RMS/BestSellingUPC.dta, keep(match) keepusing(upc_ver_uc) nogen
		
** Make sure that the UPC version matches the best-selling UPC version
forvalues year = $BeginYear / $EndYear {
	merge m:1 upc using $Externals/Intermediate/RMS/rms_versions_`year'.dta, keep(match) nogen keepusing(upc_ver_uc)
	assert upc_ver_uc==2
	drop upc_ver_uc
}
drop upc 

** Add chain code and do further data prep
gen int year = year(dofq(YQ))
merge m:1 store_code_uc year using $Externals/Intermediate/RMS/Stores.dta, ///
	nogen keep(match master) keepusing(ChainCodeForIV)
drop year
*keep if inlist(ChainCodeForIV,$Chain1,$Chain2,$Chain3,$Chain4)
sort ChainCodeForIV store_code_uc YQ
order ChainCodeForIV store_code_uc YQ price
label variable price "Price ($)"
compress
saveold $Externals/Intermediate/RMS/BestSellingUPC_price.dta, replace



** Prices vary across retailers
use $Externals/Intermediate/RMS/BestSellingUPC_price.dta, replace //, if inlist(ChainCodeForIV,$Chain1,$Chain2,$Chain3,$Chain4)
collapse (mean) price, by(ChainCodeForIV YQ)
bysort Chain: gen N=_N
drop if N<44
bysort ChainCodeForIV: egen meanprice = mean(price)
sort meanprice
gen ChainPrice = 1 if _n==1
replace ChainPrice = cond(ChainCodeForIV!=ChainCodeForIV[_n-1],ChainPrice[_n-1]+1,ChainPrice[_n-1]) if _n>1
label variable price "Price ($)"

* winsorize price to make the graph cleaner
sum price, d
replace price = 3.40 if price<=3.4
replace price = 5.90 if price>5.9 & price!=.

twoway contour price ChainPrice YQ, crule(intensity) ecolor(navy) heatmap levels(25) ///
	graphregion(color(white)) interp(none) /// 
	zlabel(,format(%8.2f)) ///
	ytitle("Chains, sorted by average price") ylabel(none) ///
	xtitle("") xlabel(,format(%tqCCYY)) 

graph export Output/Analysis/DescribingInstrument/BetweenRetailerPriceVariation.pdf, as(pdf) replace
	
	
	
** Uniform pricing within retailers
use $Externals/Intermediate/RMS/BestSellingUPC_price.dta, replace, if Chain==6 // also works for other retailers, but this is a clean example.
bysort store_code_uc: gen N=_N
drop if N<44
bysort store_code_uc: egen meanprice = mean(price)
sort meanprice
gen StorePrice = 1 if _n==1
replace StorePrice = cond(store_code_uc!=store_code_uc[_n-1],StorePrice[_n-1]+1,StorePrice[_n-1]) if _n>1

* winsorize price to make the graph look better
sum price, d
replace price = 3.20 if price<=3.20
replace price = 4.45 if price>4.45 & price!=.

twoway contour price meanprice YQ, crule(intensity) ecolor(navy) heatmap levels(25) ///
	graphregion(color(white)) interp(none) ///
	zlabel(,format(%8.2f)) ///
	ytitle("Stores, sorted by average price") ylabel(none) ///
	xtitle("") xlabel(,format(%tqCCYY)) 

graph export Output/Analysis/DescribingInstrument/WithinRetailerPriceVariation.pdf, as(pdf) replace


