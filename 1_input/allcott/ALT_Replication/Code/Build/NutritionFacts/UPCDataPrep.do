/* UPCDataPrep.do */
		
/* Supplementary datasets */
** Non-beverage substitute product groups
insheet using $Externals/Data/NutritionFacts/SubstituteGroups.csv, comma names case clear
drop if groupname==""

encode groupname, gen(group)
replace group = group+10 // Ensures that these groups don't conflict with the beverage groups created below.

gen byte Taxable = 0
gen byte Beverage = 0

keep product_module_code product_group_code group groupname Taxable Beverage
compress
saveold $Externals/Intermediate/NutritionFacts/Groups.dta, replace


** Beverage product groups
capture label drop group
insheet using $Externals/Data/NutritionFacts/BeverageGroups.csv, comma names case clear
drop if groupname=="NA" // so now this contains only product_module_codes that are in the demand estimation.
encode groupname, gen(group)
keep product_module_code product_group_code group groupname Taxable Beverage
replace Taxable = 0 if Taxable == .
compress
append using $Externals/Intermediate/NutritionFacts/Groups.dta

label define group 11 "Alcohol", modify
label define group 12 "BakedGoods", modify
label define group 13 "Baking", modify
label define group 14 "Breakfast", modify
label define group 15 "Candy", modify
label define group 16 "CannedDriedFruit", modify
label define group 17 "Desserts", modify
label define group 18 "Sauce", modify
label define group 19 "Sweeteners", modify
label define group 20 "Tobacco", modify
label values group group

saveold $Externals/Intermediate/NutritionFacts/Groups.dta, replace

** Collapse to GroupList
collapse (mean) Taxable, by(group groupname)
* Add a final group that is all Taxable SSBs
sum Taxable
local N_1 = r(N)+1
display r(N)
set obs `N_1'
replace Taxable = 1 if group == .
replace groupname = "Taxable" if groupname==""
replace group = 0 if group==.
label define group 0 "Taxable", add
label values group group

sort group
compress
saveold $Externals/Intermediate/NutritionFacts/GroupList.dta, replace

foreach var in group {
	label save `var' using Code/Build/NutritionFacts/`var'Labels.do, replace
}


** ConversionToGrams
import excel $Externals\Data\NutritionFacts\ConversionToGrams.xlsx, sheet("Sheet1") firstrow clear
keep product_module_code size1_units ConversionToLiquidGrams
saveold $Externals/Intermediate/NutritionFacts/ConversionToGrams.dta, replace
	
	
/* Open UPC dataset and prepare */
import delimited using $Nielsen/HMS/Master_Files/Latest/products.tsv, clear delimiter(tab) bindquotes(nobind) stripquotes(yes) // These last two options are needed because there are double quotes in some of the upc names
drop dataset_found_uc size1_change_flag_uc // According to the manual, size1_change_uc is relevant for the RMS dataset but not needed for Homescan.
format upc %012.0f
replace size1_units=trim(size1_units) // several extra spaces.

** Merge groups; this keeps only the UPCs used in the estimation
merge m:1 product_module_code using $Externals/Intermediate/NutritionFacts/Groups.dta, keep(match) nogen keepusing(group Taxable)

** Merge nutrition facts
	* These already take into account multi, so it's total grams of sugar for the UPC, after multiplying by multi to account for multi-packs.
merge 1:1 upc upc_ver_uc using $Externals/Data/NutritionFacts/hms_upcs_with_nut_facts_imputed.dta, keep(match master) keepusing(cals_per1 g_*_per1) nogen

** Translate everything to grams
include Code/Build/NutritionFacts/GetGrams.do


compress
saveold $Externals/Intermediate/NutritionFacts/Prepped-UPCs.dta, replace


