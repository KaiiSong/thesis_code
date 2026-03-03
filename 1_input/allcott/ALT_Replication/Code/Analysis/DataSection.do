/* DataSection.do */
* Provides descriptive stats table and information about the data for the data description

********************************************************************************
/* DESCRIPTIVE STATISTICS TABLE */
** Homescan
use $Externals/Intermediate/Homescan/Household-Panel.dta,replace
merge 1:1 household_code year using $Externals/Intermediate/HH-Year-FinalData.dta, ///
	nogen keep(match master using) keepusing(kg_Purchased AvPricePerKG)
replace Income = Income/1000
label var Income "Household income (\\$000s)"
estpost sum $Controls_SumStats kg_Purchased AvPricePerKG [aw=projection_factor]
esttab using "Output/Analysis/SumStats1.tex", ///
	cell( (count(label(Obs.) f(%12.0fc)) mean(label(Mean) f(%8.2f)) sd(label(Std. dev.) f(%8.2f)) min(label(Min) f(%8.0f)) max(label(Max) f(%8.0fc))) ) ///
	label nomtitle noobs nonumber replace

* Average quantity and price
use $Externals/Intermediate/HH-Year-FinalData.dta, clear
sum kg_Purchased [aw=projection_factor]
clear 
set obs 1 
gen kg_Purchased = round(r(mean),1)
outfile kg_Purchased using "Output/Analysis/NumbersForText/kg_Purchased.tex", replace

use $Externals/Intermediate/HH-Year-FinalData.dta, clear
sum AvPricePerKG [aw=projection_factor]
clear 
set obs 1 
gen AvPricePerKG = round(r(mean),0.01)
outfile AvPricePerKG using "Output/Analysis/NumbersForText/AvPricePaidPerKG.tex", replace

* Average quantity per adult
use $Externals/Intermediate/HH-Year-FinalData.dta, clear
sum kg_Purchased_AdultEq [aw=projection_factor]
clear 
set obs 1 
gen kg_Purchased = round(r(mean),1)
outfile kg_Purchased using "Output/Analysis/NumbersForText/kg_Purchased_AdultEq.tex", replace

* $EndYear average quantity per adult
use $Externals/Intermediate/HH-Year-FinalData.dta, clear, if year==$EndYear
sum kg_Purchased_AdultEq [aw=projection_factor]
local Mean_kg_AdultEndYear = r(mean)
clear 
set obs 1 
gen var = round(r(mean),1)
outfile var using "Output/Analysis/NumbersForText/kg_Purchased_AdultEqEndYear.tex", replace

* Share of household calorie need
use $Externals/Intermediate/HH-Year-FinalData.dta, clear
sum cals_Purchased_Need [aw=projection_factor]
clear 
set obs 1 
gen cals_Purchased_Need = round(r(mean)*100,0.1)
outfile cals_Purchased_Need using "Output/Analysis/NumbersForText/cals_Purchased_Need.tex", replace

* Share of household-by-year observations with no SSB purchases
use $Externals/Intermediate/HH-Year-FinalData.dta, clear
sum kg_Purchased
local N=r(N)
sum AvPricePerKG
local percent = round((1-r(N)/`N')*100,0.1)
display "`percent' percent of household-by-year observations have no SSB purchases."
clear
set obs 1
gen percent = `percent'
outfile percent using "Output/Analysis/NumbersForText/PercentNoSSB.tex", replace

** PanelViews
use $Externals/Intermediate/PanelViews-FinalData.dta, replace, if InPVSample1==1 // This uses only the estimation sample, which includes only the households that match to Homescan.
estpost sum Knowledge SelfControl MySpouse_SelfControl /// 
	$PVControls PVSSBCons svy_male prim_shop [aw=PVSampleWeight1]

esttab using "Output/Analysis/SumStats2.tex", ///
	cell( (count(label(Obs.) f(%12.0fc)) mean(label(Mean) f(%8.2f)) sd(label(Std. dev.) f(%8.2f)) min(label(Min) f(%8.0f)) max(label(Max) f(%8.0f))) ) ///
	label nomtitle noobs nonumber replace

* Average knowledge score
sum Knowledge [aw=PVSampleWeight1]
local Mean = round(r(mean),0.01)
clear
set obs 1
gen KScore = `Mean'
format KScore %12.2fc 
tostring KScore, replace force u
outfile KScore using "Output/Analysis/NumbersForText/AverageKnowledgeScore.tex", replace noquote

* Average quantity per adult
use $Externals/Intermediate/PanelViews-FinalData.dta, replace, if InPVSample1==1
sum PVSSBCons [aw=PVSampleWeight1]
local PV_HMS_SSBCons = r(mean)/`Mean_kg_AdultEndYear'
clear 
set obs 1 
gen PVSSBCons = round(r(mean),1)
outfile PVSSBCons using "Output/Analysis/NumbersForText/MeanPVSSBCons.tex", replace

* Percent difference between PV and HMS
clear 
set obs 1 
gen PVSSBCons = round(`PV_HMS_SSBCons'*100-100,1)
outfile PVSSBCons using "Output/Analysis/NumbersForText/PV_HMS_SSBCons.tex", replace


********************************************************************************
/* STATEMENTS IN TEXT */
** RMS 
* Number of stores
use $Externals/Intermediate/RMS/Stores.dta, replace
local NYears = $EndYear-$BeginYear+1
sum store_code_uc
clear
set obs 1
gen N=round(((r(N)/`NYears')/1000))*1000
format N %12.0fc 
tostring N, replace force u
outfile N using "Output/Analysis/NumbersForText/NumberOfStores.tex", replace noquote

* Number of chains
*codebook ChainCodeForIV
use $Externals/Intermediate/RMS/Stores.dta, replace
collapse (first) store_code_uc,by(ChainCodeForIV)
sum ChainCodeForIV
clear
set obs 1
gen N=r(N)
outfile N using "Output/Analysis/NumbersForText/NumberOfChains.tex", replace

* Share of stores that are audited
clear
save $Externals/Intermediate/RMS/AuditedAll_Temp.dta, replace emptyok

forvalues year = $BeginYear/$EndYear {
	use $Externals/Intermediate/RMS/Audited_`year'.dta, clear
	append using $Externals/Intermediate/RMS/AuditedAll_Temp.dta
	saveold $Externals/Intermediate/RMS/AuditedAll_Temp.dta, replace
}
replace Audited=0 if Audited==.
replace AuditedInDMA=0 if AuditedInDMA==.
saveold $Externals/Intermediate/RMS/AuditedAll_Temp.dta, replace

* Audited
collapse (mean) Audited
replace Audited=round(Audited*100,0.1)
outfile Audited using "Output/Analysis/NumbersForText/PercentStoresAudited.tex", replace

* Audited in DMA
use $Externals/Intermediate/RMS/AuditedAll_Temp.dta, replace
collapse (mean) AuditedInDMA
replace AuditedInDMA=round(AuditedInDMA*100,1)
outfile AuditedInDMA using "Output/Analysis/NumbersForText/PercentStoresAuditedInDMA.tex", replace

erase $Externals/Intermediate/RMS/AuditedAll_Temp.dta

** Homescan sample size
use $Externals/Intermediate/Homescan/Household-Panel.dta,replace
tab year

** PanelViews
* Total responses
* use "$Externals/Intermediate/Homescan/PanelViews.dta", replace
use $Externals/Intermediate/PanelViews-FinalData.dta, replace, if InPVSample1==1 // This uses only the estimation sample, which includes only the households that match to Homescan.
sum household_code
local NResponses = r(N)
clear
set obs 1
gen N=r(N)
format N %12.0fc 
tostring N, replace force u
outfile N using "Output/Analysis/NumbersForText/PanelViewsResponses.tex", replace noquote

* Total households
* use "$Externals/Intermediate/Homescan/PanelViews.dta", replace
use $Externals/Intermediate/PanelViews-FinalData.dta, replace, if InPVSample1==1 // This uses only the estimation sample, which includes only the households that match to Homescan.
collapse (first) taste_soda, by(household_code)
sum household_code
local NHouseholds = r(N)
clear
set obs 1
gen N=`NHouseholds'
format N %12.0fc 
tostring N, replace force u
outfile N using "Output/Analysis/NumbersForText/PanelViewsHouseholds.tex", replace noquote
* rounded
clear
set obs 1
gen N=round(`NHouseholds',1000)
format N %12.0fc 
tostring N, replace force u
outfile N using "Output/Analysis/NumbersForText/PanelViewsHouseholds_rounded.tex", replace noquote


* Total households with two survey responses
clear
set obs 1
gen N=`NResponses'-`NHouseholds'
format N %12.0fc 
tostring N, replace force u
outfile N using "Output/Analysis/NumbersForText/PanelViews2RespondentHouseholds.tex", replace noquote


*** Share of households whose final year in the data is 2016
use $Externals/Intermediate/HH-FinalData.dta, replace, if InPVSample1==1
sum year
local N = r(N)
sum year if year==2016
local share2016 = r(N)/`N'
clear
set obs 1
gen var = round(`share2016'*100,1)
outfile var using "Output/Analysis/NumbersForText/PercentLastYear.tex", replace



**** Correlation between Homescan and PanelViews consumption
* Graph by income is in GetGroupConsumptionAndPrices.do 


*** R2
* All households
use $Externals/Intermediate/HH-FinalData.dta, replace
reg lnHMSSSBCons lnPVSSBCons_RespAv
clear
set obs 1
gen R2 = e(r2)
format R2 %12.2fc 
tostring R2, replace force u
outfile R2 using "Output/Analysis/NumbersForText/PVHMSR2.tex", replace noquote

* One-person households
use $Externals/Intermediate/HH-FinalData.dta, replace
reg lnHMSSSBCons lnPVSSBCons_RespAv if household_size==1
clear
set obs 1
gen R2 = e(r2)
format R2 %12.2fc 
tostring R2, replace force u
outfile R2 using "Output/Analysis/NumbersForText/PVHMSR21.tex", replace noquote

* Variation within household over time in Homescan
use $Externals/Intermediate/HH-Year-FinalData.dta, replace
sort household_code year
gen lnkg_Adult_1 = lnkg_Adult[_n-1] if household_code==household_code[_n-1]&year==year[_n-1]+1
reg lnkg_Adult lnkg_Adult_1
clear
set obs 1
gen R2 = e(r2)
format R2 %12.2fc 
tostring R2, replace force u
outfile R2 using "Output/Analysis/NumbersForText/HMSHMSR2.tex", replace noquote



*** Share of SSB purchases in RMS chains
	* Note that as constructed in HomescanPurchasesDataPrep.do, this is share in RMS *chains*, not RMS *stores*. This is conceptually what we want, as the IV will reflect prices in RMS chains.
use $Externals/Intermediate/HH-$TimeVar-FinalData.dta, replace
sum kg_Purchased [aw=projection_factor]
local meankg = r(mean)

sum kg_Purchased_RMS [aw=projection_factor]

clear
set obs 1
gen var = round(r(mean)/`meankg',0.01)*100
outfile var using "Output/Analysis/NumbersForText/RMSPurchaseShare.tex", replace
