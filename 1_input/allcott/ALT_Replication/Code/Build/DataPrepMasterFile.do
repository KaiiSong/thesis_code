/* DataPrepMasterFile.do */


/* SETUP */

/* CPI */
include Code/Build/PrepCPI.do 



/* NON-NIELSEN DATASETS */
/* Census regions */
import excel "$Externals\Data\Geographic\state-geocodes-v2015.xls", sheet("CODES14") cellrange(A6:D70) clear first
destring Region Division StateFIPS, replace
rename Region region
rename Division division
rename StateFIPS fips_state_code
rename Name StateName
drop if fips_state_code==0

order StateName
sort fips_state_code
compress
saveold $Externals/Intermediate/Geographic/CensusRegions.dta, replace


/* Geographic data (e.g. income, education) */
foreach area in zip county dma {
	include Code/Build/Geographic/Prep_`area'_Data.do
}

/* UPCs and nutrition facts */
** Nielsen UPC data 
include Code/Build/NutritionFacts/UPCDataPrep.do

** Calorie needs
include Code/Build/NutritionFacts/GetCalorieNeeds.do


/* RMS */
** Stores
include Code/Build/RMS/PrepStores.do

/* On JPLinux: do Code/Build/RMS/GetAuditedStores_JPLinux.do and CollapseMovementData_JPLinux.do 

Instructions:
using folder /home/data/desert/Hunt/

1. Move $Externals/Intermediate/CPI/CPI_YQ.dta, $Externals/Intermediate/NutritionFacts/Groups.dta, and $Externals/Intermediate/RMS/Stores.dta to JPLinux
2. do GetAuditedStores_JPLinux and then CollapseMovementData_JPLinux. To speed this up, you can separate into multiple files that do different subsets of years.
3. Move the $Externals/Intermediate/RMS/ ** .dta files from JPLinux to dropbox 

*/


/* HOMESCAN */
** PanelViews survey
include Code/Build/Homescan/PanelViewsDataPrep.do 

** Households
include Code/Build/Homescan/HomescanHouseholdDataPrep.do 


/* Purchases */
	* Note: PurchasesDataPrep needs to come after PrepStores.do
include Code/Build/Homescan/HomescanPurchasesDataPrep.do 


/* Final demand data */
* On JPLinux: 
* do Code/Build/FinalizeData_DemandEstimates.do
include Code/Build/FinalizeData_BiasEffects.do

