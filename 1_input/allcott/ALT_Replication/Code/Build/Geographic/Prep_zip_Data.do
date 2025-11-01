/* Prep_zip_Data.do */


clear 
save $Externals/Intermediate/Geographic/zip-year.dta, replace emptyok

/* Zip-by-year income data from SOI */
forvalues year = 2005/2015 { // NB we are missing 2016
	local yr = `year'-2000
	if `year'<=2007 {
		local file = "zipcode0`yr'"
	}
	if `year'==2008 {
		local file = "08zpall"
	}
	if `year'==2009 {
		local file = "09zpallagi"
	}
	if `year'>2009 {
		local file = "`yr'zpallagi"
	}


	insheet using  $Externals/Data/Geographic/zip/SOI/`file'.csv, comma names clear
	rename zipcode zip
	rename n1 NReturns
	rename n2 NExemptions
	rename a00100 Income // This is AGI
	if `year'!=2007&`year'!=2008 {
		replace Income=Income*1000
	}
	*capture rename a02650 TotalIncome // This is "total income." It's available beginning in approx 2010
	*rename a00200 SalariesWages
	drop if inlist(zip,0,99999)
	collapse (first) state (sum) NReturns NExemptions Income, by(zip)
	gen int year = `year'
	compress
	append using $Externals/Intermediate/Geographic/zip-year.dta
	save $Externals/Intermediate/Geographic/zip-year.dta, replace 
}

** Deflate
merge m:1 year using $Externals/Intermediate/CPI/CPI_year.dta, keep(match) nogen keepusing(CPI)
replace Income = Income/CPI
drop CPI

** Bottom-code at $1 (there are ~40 observations with negative income, and another ~30 with 0 exemptions)
replace Income = 1 if Income<=0
replace NExemptions = 1 if NExemptions==0

*gen zipIncomePerReturn = Income/NReturns // total AGI/number of returns
gen zipIncome = Income/NExemptions

** Label
label variable zipIncome "Zip income"

** Save
format zip %05.0f
saveold $Externals/Intermediate/Geographic/zip-year.dta, replace


/* Collapse to county-level data */
import delimited $Externals/Data/Geographic/zip/zcta_county_rel_10.txt, varnames(1) clear
replace county = state*1000+county
rename zcta5 zip
keep zip county poppt
** Other fixes for county fips codes
include Code/Build/Geographic/FixCountyFIPS.do
compress
saveold $Externals/Intermediate/Geographic/zip-county_Crosswalk.dta, replace

clear
save $Externals/Intermediate/Geographic/zip-county_Collapse.dta, replace emptyok

forvalues year = 2006/2015 {
	use $Externals/Intermediate/Geographic/zip-county_Crosswalk.dta, replace
	gen year = `year'
	merge m:1 zip year using $Externals/Intermediate/Geographic/zip-year.dta, keep(match) keepusing(zipIncome) nogen
	collapse (mean) zipIncome [pw=poppt],by(county year)
	append using $Externals/Intermediate/Geographic/zip-county_Collapse.dta
	saveold $Externals/Intermediate/Geographic/zip-county_Collapse.dta, replace
}


*********************************************************************************
*********************************************************************************

	
/* Zip Code density */
	* Source: http://www.census.gov/geo/maps-data/data/gazetteer2010.html
import delimited $Externals/Data/Geographic/zip/Gaz_zcta_national.txt, varnames(1) clear
rename geoid zip

gen zipPopDen = pop10/aland_sqmi

rename pop10 zipPop

keep zip zipPopDen zipPop

saveold $Externals/Intermediate/Geographic/zip.dta, replace


*********************************************************************************
*********************************************************************************



/* Demographic Data */
*** Education
insheet using $Externals/Data/Geographic/zip/Education/ACS_11_5YR_S1501_with_ann.csv, comma names clear
drop if _n==1
destring hc01_est_vc0? hc01_est_vc1?, replace force

gen zipEduc = (hc01_est_vc08*6 + hc01_est_vc09*10 + hc01_est_vc10*12 + hc01_est_vc11*14 + hc01_est_vc12*14 + hc01_est_vc13*16 + hc01_est_vc14*18)/100
gen ziplnEduc = ln(zipEduc)
gen zipCollege = hc01_est_vc17 // Percent bachelor's degree or higher


destring geoid2, gen(zip)
format zip %05.0f
keep zip zipEduc ziplnEduc zipCollege

merge 1:1 zip using $Externals/Intermediate/Geographic/zip.dta, keep(match master using) nogen
saveold $Externals/Intermediate/Geographic/zip.dta, replace


*** ACS income
	* Note that this is zip median income
insheet using $Externals/Data/Geographic/zip/Income/ACS_11_5YR_B19013_with_ann.csv, comma names clear
drop if _n==1
rename hd01_vd01 zipIncome
destring zipIncome, replace force

** Transform real 2011 dollars to real 2015 dollars
gen year=2011
merge m:1 year using $Externals/Intermediate/CPI/CPI_year.dta, keep(match) nogen keepusing(CPI)
replace zipIncome = zipIncome/CPI

gen ziplnIncome = ln(zipIncome)

destring geoid2, gen(zip)
format zip %05.0f
keep zip zipIncome ziplnIncome

merge 1:1 zip using $Externals/Intermediate/Geographic/zip.dta, keep(match master using) nogen

/*
** Get ZipMedIncomeGroup
gen ZipMedIncomeGroup = floor(ZipMedIncome/10000)*10+5 
replace ZipMedIncomeGroup = 25 if ZipMedIncomeGroup<25
replace ZipMedIncomeGroup = 100 if ZipMedIncomeGroup>75 & ZipMedIncomeGroup!=.
*/

** Labels
label var zipIncome "Zip median income"
*label var ZipMedIncomeGroup "Zip median income"
label var ziplnIncome "ln(Zip median income)"

** Drop Puerto Rico and US Virgin Islands
drop if zip < 1000

compress
saveold $Externals/Intermediate/Geographic/zip.dta, replace


/*
/* COLLAPSE TO ZIP3 LEVEL, WEIGHTING BY POPULATION */
gen int zip3 = floor(zip/100)
collapse (mean) ZipEduc ZipCollege ZipMedIncome [pw=ZipPop], by(zip3)
gen ZiplnMedIncome = ln(ZipMedIncome)
saveold Calculations/Geographic/Zip3Data.dta, replace
*/

