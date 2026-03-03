/* PrepCPI.do */
* Gets CPI base $EndYear

* Series: CUSR0000SA0 (all items, all urban consumers)
* Downloaded from http://www.bls.gov/data/

*** Annual CPI
import delimited $Externals/Data/CPI.txt, clear
replace series_id = trim(series_id)
keep if series_id=="CUSR0000SA0"
gen month = real(substr(period,2,2))
rename value CPI
collapse (mean) CPI, by(year)

sum CPI if year==$EndYear
replace CPI=CPI/r(mean)

keep if year>=2000&year<=2017
compress

saveold $Externals/Intermediate/CPI/CPI_year.dta, replace


*** Quarterly CPI
import delimited $Externals/Data/CPI.txt, clear
replace series_id = trim(series_id)
keep if series_id=="CUSR0000SA0"
gen byte month = real(substr(period,2,2))
gen byte quarter=ceil(month/3)
gen int YQ = yq(year,quarter)
format %tq YQ

rename value CPI

collapse (mean) CPI, by(year quarter YQ)

sum CPI if year==$EndYear
replace CPI=CPI/r(mean)

keep if year>=2000&year<=2017
compress

saveold $Externals/Intermediate/CPI/CPI_YQ.dta, replace
