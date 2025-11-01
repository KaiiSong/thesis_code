/* PrepStores.do */


/* SETUP */
clear all
set more off
include Code/SetGlobals.do

/*
** Get labels for parent codes and retailer codes
use $Externals/Data/RMS/Stores.dta,clear
foreach var in parent_code retailer_code {
	label save `var' using Code/Build/RMS/`var'Labels.do, replace
}
*/



/* Construct Stores.dta */
clear
save $Externals/Intermediate/RMS/Stores.dta, replace emptyok
forvalues year = $BeginYear / $EndYear {
	insheet using $Nielsen/RMS/`year'/Annual_Files/stores_`year'.tsv, clear
	*drop if channel_code == "L" // drop liquor stores.
	drop fips_state_descr fips_county_descr dma_descr
	
	** Get store zip code
	*merge 1:1 store_code_uc year using $Externals/Data/RMS/Stores.dta, nogen keep(match master) keepusing(store_zip)	
	
	append using $Externals/Intermediate/RMS/Stores.dta
	saveold $Externals/Intermediate/RMS/Stores.dta, replace
}

** Fill in 38 to 40 missing locations in 2012
foreach var in store_zip3 fips_state_code fips_county_code dma_code {
	sort store_code_uc year
	replace `var' = `var'[_n-1] if store_code_uc==store_code_uc[_n-1] & `var'==. & `var'[_n-1]!=.
	gsort store_code_uc -year
	replace `var' = `var'[_n-1] if store_code_uc==store_code_uc[_n-1] & `var'==. & `var'[_n-1]!=.
}
/*
** Fill in missing zips (Stores.dta doesn't include 2013 and later)
sort store_code_uc year
replace store_zip = store_zip[_n-1] if store_zip3==store_zip3[_n-1] & store_code_uc==store_code_uc[_n-1] & store_zip[_n-1]!=.
gsort store_code_uc -year
replace store_zip = store_zip[_n-1] if store_zip3==store_zip3[_n-1] & store_code_uc==store_code_uc[_n-1] & store_zip[_n-1]!=.
*/
rename dma_code dma
*rename store_zip zip
rename store_zip3 zip3
gen long county = fips_state*1000+fips_county

** Fill in missing retailer codes (often missing in 2011 and earlier when present after 2011)
gsort store_code_uc -year
replace retailer_code = retailer_code[_n-1] if store_code_uc==store_code_uc[_n-1] & parent_code==parent_code[_n-1] & retailer_code==. & retailer_code[_n-1]!=.
sort store_code_uc year
replace retailer_code = retailer_code[_n-1] if store_code_uc==store_code_uc[_n-1] & parent_code==parent_code[_n-1] & retailer_code==. & retailer_code[_n-1]!=.
/*
** Get balanced panel indicator
bysort store_code_uc: gen n=_n
bysort store_code_uc: egen N=max(n)
gen byte Balanced = cond(N==$EndYear-$BeginYear+1,1,0)
drop n N
*/
** Fix county FIPS codes
include Code/Build/Geographic/FixCountyFIPS.do

** Get Census region
merge m:1 fips_state_code using $Externals/Intermediate/Geographic/CensusRegions.dta, ///
	keep(match master) keepusing(region) nogen

/* Merge labels 
foreach var in parent_code retailer_code {
	include Code/Build/RMS/`var'Labels.do
	label values `var' `var'
}
*/

/* Get Chain for IV */
gen int ChainCodeForIV = parent_code

** Chain-specific recodes
	* See dropbox/Notes/Data Prep Notes.docx for justifications
replace ChainCodeForIV = 199 if retailer_code == 199 | retailer_code==873

replace ChainCodeForIV = 4901 if parent_code==4903 & retailer_code==4901

replace ChainCodeForIV = 10001 if parent_code==36 & retailer_code==311

replace ChainCodeForIV = 10011 if parent_code==79 & retailer_code==871
replace ChainCodeForIV = 10012 if parent_code==79 & retailer_code==872

replace ChainCodeForIV = 10021 if parent_code==97 & retailer_code==98
replace ChainCodeForIV = 10022 if parent_code==97 & retailer_code==100
replace ChainCodeForIV = 10023 if parent_code==97 & retailer_code==101

replace ChainCodeForIV = 10031 if parent_code==130 & retailer_code==342

replace ChainCodeForIV = 10041 if parent_code==136 & retailer_code==866

replace ChainCodeForIV = 10051 if parent_code==236 & retailer_code==878

replace ChainCodeForIV = 10061 if parent_code==295 & retailer_code==863
replace ChainCodeForIV = 10062 if parent_code==295 & retailer_code==864

replace ChainCodeForIV = 10071 if parent_code==839 & retailer_code==92

replace ChainCodeForIV = 10091 if parent_code==869 & retailer_code==869

replace ChainCodeForIV = 10111 if parent_code==4904 & retailer_code==4926

replace ChainCodeForIV = 10121 if parent_code==4918 & retailer_code==4901

replace ChainCodeForIV = 10131 if parent_code==4926 & retailer_code==4904


compress
saveold $Externals/Intermediate/RMS/Stores.dta, replace


** This line is used on JPLinux
*! chmod -R 777 /home/data/desert


