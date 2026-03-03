/* Prep_county_Data.do */

/* REIS county codes */
insheet using $Externals/Data/Geographic/county/REIS_VA_FIPSCodes.csv, comma names clear  
drop if fixed_fips<51900 // Homescan county FIPS include four that are recoded in this csv file, so we don't want to recode these.
rename fixed_fips REIScounty
rename state_countyfips county
bysort REIScounty: gen n = _n
reshape wide county, i(REIScounty) j(n)
saveold $Externals/Intermediate/Geographic/REIS_VA_FIPSCodes.dta, replace


/* REIS data */
insheet using $Externals/Data/Geographic/county/CA1_1969_2016__ALL_AREAS.csv, comma names clear 
keep if linecode==2|linecode==3
gen fips_state_code = real(substr(geofips,1,2))
gen fips_county_code = real(substr(geofips,3,3))
gen long REIScounty = fips_state*1000+fips_county

forvalues v=8/55 {
	local y = `v'+1961
	rename v`v' data`y'
}

keep REIScounty geoname linecode data*

reshape long data, i(REIScounty linecode) j(year)
destring data, replace force
keep if year>=2002

reshape wide data, i(REIScounty year) j(linecode)
rename data2 countyPopulation
rename data3 countyNominalIncome

** Get real income
merge m:1 year using $Externals/Intermediate/CPI/CPI_year.dta, keep(match) nogen keepusing(CPI)
gen countyIncome = countyNominalIncome/CPI

drop CPI countyNominalIncome


** Transform REIScounty to county
merge m:1 REIScounty using $Externals/Intermediate/Geographic/REIS_VA_FIPSCodes.dta, nogen keepusing(county*) keep(match master)
replace county1 = REIScounty if county1==.
reshape long county, i(REIScounty year) j(n)
drop if county==.
drop n REIScounty

** Other fixes for county fips codes
include Code/Build/Geographic/FixCountyFIPS.do

label variable countyIncome "County income"

compress
saveold $Externals/Intermediate/Geographic/county-year.dta, replace


/* County-level data */
** Land area
insheet using $Externals/Data/Geographic/county/2016_Gaz_counties_national.txt, tab clear
rename geoid county
gen countyArea = aland_sqmi // + awater_sqmi use land area only
keep county countyArea

** Other fixes for county fips codes
include Code/Build/Geographic/FixCountyFIPS.do

saveold $Externals/Intermediate/Geographic/county.dta, replace


** Education
insheet using $Externals/Data/Geographic/county/Education/ACS_15_5YR_S1501_with_ann.csv, comma names clear
drop if _n==1
destring hc02_est_vc0? hc02_est_vc1?, replace force

gen countyEduc = (hc02_est_vc09*6 + hc02_est_vc10*10 + hc02_est_vc11*12 + hc02_est_vc12*14 + hc02_est_vc13*14 + hc02_est_vc14*16 + hc02_est_vc15*18)/100
gen countylnEduc = ln(countyEduc)
gen countyCollege = (hc02_est_vc14 + hc02_est_vc15)/100 // Percent bachelor's degree or higher


destring geoid2, gen(county)
keep county countyEduc countylnEduc countyCollege

** Other fixes for county fips codes
include Code/Build/Geographic/FixCountyFIPS.do

merge 1:1 county using $Externals/Intermediate/Geographic/county.dta, keep(match master using) nogen
saveold $Externals/Intermediate/Geographic/county.dta, replace


** Income
use $Externals/Intermediate/Geographic/county-year.dta, replace, if year>=$BeginYear & year<=$EndYear
collapse (mean) countyIncome countyPopulation,by(county)
gen countylnIncome = ln(countyIncome)

** Other fixes for county fips codes
include Code/Build/Geographic/FixCountyFIPS.do

merge 1:1 county using $Externals/Intermediate/Geographic/county.dta, keep(match master using) nogen

gen countylnPopDensity = ln(countyPopulation/countyArea)

** Label variables
label var countylnPopDensity "ln(County population density)"
label var countyCollege "County share college grads"
label var countylnEduc "ln(County mean education)"
label var countylnIncome "ln(County mean income)"

saveold $Externals/Intermediate/Geographic/county.dta, replace

