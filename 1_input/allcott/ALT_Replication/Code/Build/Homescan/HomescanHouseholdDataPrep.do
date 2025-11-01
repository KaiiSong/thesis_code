/* HomescanHouseholdDataPrep.do */
* This imports the Kilts center homescan household data and prepares it.


/* Import MTRsForHomescan.csv */
insheet using $Externals\Data\MTRsForHomescan.csv, comma clear case
rename v1 NominalIncome
rename v2 MTR
keep NominalIncome MTR
compress
saveold $Externals/Intermediate/Homescan/MTRsForHomescan.dta, replace


/* Import household data from Kilts release */
clear
save $Externals/Intermediate/Homescan/Household-Panel.dta, replace emptyok
forvalues year = $BeginYear/$EndYear { 
	import delimited using $Nielsen/HMS/`year'/Annual_Files/panelists_`year'.tsv, clear delimiter(tab)
	
	drop projection_factor_magnet type_of_residence *_occupation scantrack_* dma_descr /// *_employment
		kitchen_appliances tv_items household_internet_connection member_*_employment
	rename panel_year year
	compress
	append using $Externals/Intermediate/Homescan/Household-Panel.dta
	saveold $Externals/Intermediate/Homescan/Household-Panel.dta, replace
}

// Data are now combined across years.

/* Geographic data */
rename panelist_zip_code zip
rename dma_code dma
gen long county = fips_state_code*1000+fips_county_code

** Fix county FIPS codes
include Code/Build/Geographic/FixCountyFIPS.do


/* Prepare demographic variables */
** Number of household heads
gen NHeads = cond(male_head_age!=0&female_head_age!=0,2,1)

** Education
	* Mean education of household heads
foreach gender in male female {
	gen `gender'_Educ = .
	replace `gender'_Educ = 6 if `gender'_head_education == 1
	replace `gender'_Educ = 10 if `gender'_head_education == 2
	replace `gender'_Educ = 12 if `gender'_head_education == 3
	replace `gender'_Educ = 14 if `gender'_head_education == 4
	replace `gender'_Educ = 16 if `gender'_head_education == 5
	replace `gender'_Educ = 18 if `gender'_head_education == 6
}
*gen Educ = max(male_Educ,female_Educ)
gen Educ = (male_Educ+female_Educ)/2
replace Educ = male_Educ if female_Educ==.
replace Educ = female_Educ if male_Educ==.
gen lnEduc=ln(Educ)

** Age
* Decode the age categories
foreach gender in male female {
	gen `gender'_head_approxage = .
	replace `gender'_head_approxage = 22 if `gender'_head_age == 1
	replace `gender'_head_approxage = 27 if `gender'_head_age == 2
	replace `gender'_head_approxage = 32 if `gender'_head_age == 3
	replace `gender'_head_approxage = 37 if `gender'_head_age == 4
	replace `gender'_head_approxage = 42 if `gender'_head_age == 5
	replace `gender'_head_approxage = 47 if `gender'_head_age == 6
	replace `gender'_head_approxage = 52 if `gender'_head_age == 7
	replace `gender'_head_approxage = 60 if `gender'_head_age == 8
	replace `gender'_head_approxage = 73 if `gender'_head_age == 9 // This is the mean when observed.
}

* Get specific birth year.
foreach gender in male female {
	gen `gender'_head_birth_year = real(substr(`gender'_head_birth,1,4))
	gen `gender'_head_age1 = year-`gender'_head_birth_year
	replace `gender'_head_age1 = `gender'_head_approxage if `gender'_head_age1==. // When specific birth year not available, use the approximation based on the age category.
}

* Use mean age of two household heads
gen Age = (male_head_age1+female_head_age1)/2
replace Age = male_head_age1 if female_head_age1==.
replace Age = female_head_age1 if male_head_age1==.
* Some of the oldest ages are implausibly old. (There are a few people over 110 in the data, while there are only 50 people over 110 in the entire US: https://en.wikipedia.org/wiki/List_of_supercentenarians_from_the_United_States). Top-code at 95.
replace Age = 95 if Age>=95 & Age!=.

gen lnAge = ln(Age)

/*
* Age dummies for age controls
	* Outer bins are based on visual inspection and sample sizes.
gen int AgeInt = round(Age)
replace AgeInt = 23 if AgeInt<23
replace AgeInt = 90 if AgeInt>90
*/

/* Age groups for more parsimonious age controls
gen int AgeGroup = floor(Age/5)*5
replace AgeGroup = 20 if AgeGroup<20
replace AgeGroup = 70 if AgeGroup==75
replace AgeGroup = 80 if AgeGroup==85
replace AgeGroup = 90 if AgeGroup>90
*/


** Children
gen byte Children = cond(age_and_presence_of_children==9,0,1) if age_and_presence_of_children!=.


** Get household calorie needs
forvalues m = 1/7 {
	gen member_`m'_birth_year_string = substr(member_`m'_birth,1,4)
	gen member_`m'_birth_year = real(member_`m'_birth_year_string)
	* Some birth years are written as two-digit years, e.g. 58 instead of 1958.
		* If the birth year is after the year of the sample, then it must be 19XX
	replace member_`m'_birth_year = 1900+member_`m'_birth_year if member_`m'_birth_year<100&member_`m'_birth_year>year-2000
		* Otherwise, if it's a son/daughter, we assume it's 20XX.
	replace member_`m'_birth_year = 2000+member_`m'_birth_year if member_`m'_birth_year<100&inlist(member_`m'_relationship_sex,1,2)
		* If not a son/daughter, then we assume it's 19XX.
	replace member_`m'_birth_year = 1900+member_`m'_birth_year if member_`m'_birth_year<100
	
	* Get age and gender
	gen member_`m'_age = year - member_`m'_birth_year
	gen member_`m'_male = cond(inlist(member_`m'_relationship_sex,1,3,5),1,0) if member_`m'_relationship_sex!=.
}

gen age = .
gen Male = .
* Merge calorie needs for household heads
foreach gender in male female {
	replace Male = cond("`gender'"=="male",1,0)
	replace age = `gender'_head_age1
	merge m:1 Male age using $Externals/Intermediate/NutritionFacts/CalorieNeeds.dta, keep(match master) nogen
	rename CalorieNeed `gender'_head_CalorieNeed
	sum `gender'_head_CalorieNeed [aw=projection_factor]
	* Determine average calorie need of male/female household heads
	local `gender'_head_AverageCalorieNeed = r(mean)
}
local HeadAverageCalorieNeed = (`male_head_AverageCalorieNeed'+`female_head_AverageCalorieNeed')/2
	
* Merge calorie needs for other household members
forvalues m = 1/7 {
	replace Male = member_`m'_male
	replace age = member_`m'_age
	merge m:1 Male age using $Externals/Intermediate/NutritionFacts/CalorieNeeds.dta, keep(match master) nogen
	rename CalorieNeed member_`m'_CalorieNeed
}

** Get household size in adult equivalents (technically, household head equivalents)
egen CalorieNeed = rowtotal(*CalorieNeed)
egen NonHeadCalorieNeed = rowtotal(member_?_CalorieNeed)
gen HouseholdSize = NHeads + NonHeadCalorieNeed / `HeadAverageCalorieNeed'
drop *_CalorieNeed age Male


** Race/ethnicity
		* White, Black, Asian non-hispanic
	*gen R_White = cond(race==1&hispanic==0,1,0)
	*gen R_Black = cond(race==2&hispanic==0,1,0)
	*gen R_Asian = cond(race==3&hispanic==0,1,0)
* White, Black, Asian (could overlap with hispanic)
gen byte R_White = cond(race==1,1,0)
gen byte R_Black = cond(race==2,1,0)

*gen byte R_Asian = cond(race==3,1,0)

* Hispanic, regardless of "race"
*gen byte R_Hispanic = cond(hispanic==1,1,0)
* Omitted category is now Asian/Hispanic/Other.
* Uncomment the Asian and Hispanic, and then the omitted category would be "Other" race, non-hispanic.


** Marital status
*gen Married = cond(marital_status==1,1,0)


** Employment
/*
gen byte FemaleHeadNotEmployed = cond(female_head_employment==9,1,0)
gen byte NoFemaleHead = cond(female_head_employment==0,1,0)
gen FemaleHeadHours = cond(female_head_employment==1,30,32.5) if inlist(female_head_employment,1,2,3)
replace FemaleHeadHours = 35 if female_head_employment==3
replace FemaleHeadHours = 0 if FemaleHeadHours==.

gen byte MaleHeadNotEmployed = cond(male_head_employment==9,1,0)
gen byte NoMaleHead = cond(male_head_employment==0,1,0)
gen MaleHeadHours = cond(male_head_employment==1,30,32.5) if inlist(male_head_employment,1,2,3)
replace MaleHeadHours = 35 if male_head_employment==3
replace MaleHeadHours = 0 if MaleHeadHours==.
*/
foreach gender in male female {
	gen `gender'HeadEmployed = cond(`gender'_head_employment!=9,1,0) if `gender'_head_employment!=0
	gen `gender'HeadWorkHours = 0 if `gender'_head_employment==9
	replace `gender'HeadWorkHours = 24 if `gender'_head_employment==1
	replace `gender'HeadWorkHours = 32 if `gender'_head_employment==2
	replace `gender'HeadWorkHours = 40 if `gender'_head_employment==3
}
foreach var in Employed WorkHours {
	gen `var' = (maleHead`var'+femaleHead`var')/2 if maleHead`var'!=. & femaleHead`var'!=.
	replace `var' = maleHead`var' if femaleHead`var'==.
	replace `var' = femaleHead`var' if maleHead`var'==.
}
drop *maleHeadEmployed *maleHeadWorkHours

** Keep only necessary variables
keep household_code year projection_factor ///
	zip fips_state_code fips_county_code county dma region_code ///
	household_income ///
	NHeads Age Educ lnAge lnEduc Children CalorieNeed HouseholdSize household_size /// AgeInt
	R_* race Employed WorkHours // FemaleHeadNotEmployed FemaleHeadHours NoFemaleHead MaleHeadNotEmployed MaleHeadHours NoMaleHead


**** Income
gen long NominalIncome = .
replace NominalIncome = 2500 if household_income==3
replace NominalIncome = 6500 if household_income==4
replace NominalIncome = 9000 if household_income==6
replace NominalIncome = 11000 if household_income==8
replace NominalIncome = 13500 if household_income==10
replace NominalIncome = 17500 if household_income==11
replace NominalIncome = 22500 if household_income==13
replace NominalIncome = 27500 if household_income==15
replace NominalIncome = 32500 if household_income==16
replace NominalIncome = 37500 if household_income==17
replace NominalIncome = 42500 if household_income==18
replace NominalIncome = 47500 if household_income==19
replace NominalIncome = 55000 if household_income==21
replace NominalIncome = 65000 if household_income==23
replace NominalIncome = 85000 if household_income==26

** In 2004-2005 and again after 2010, 27 is the highest value. 
* For 2006-2009, we observe more precise high-income categories. But keeping these will generate artificial within-household income movements in 2006 and again in 2010 when the categories change.
/*
replace NominalIncome = 112500 if household_income==27
replace NominalIncome = 137500 if household_income==28
replace NominalIncome = 175000 if household_income==29
replace NominalIncome = 250000 if household_income==30
replace NominalIncome = 150000 if (year<=2005|year>=2010) & household_income==27 
*/

replace NominalIncome = 140000 if inlist(household_income,27,28,29,30)==1



** NominalIncomeGroup is for graphs.
gen NominalIncomeGroup = NominalIncome/1000
replace NominalIncomeGroup = 125 if NominalIncomeGroup>=100 
replace NominalIncomeGroup = 6.5 if NominalIncomeGroup<10
replace NominalIncomeGroup = 12.5 if NominalIncomeGroup>=10&NominalIncomeGroup<15


** Get real income
merge m:1 year using $Externals/Intermediate/CPI/CPI_year.dta, keep(match) nogen keepusing(CPI)
gen Income = NominalIncome/CPI

** Get household average income
bysort household_code: egen HHSampleMeanIncome = mean(Income)

** Get household average income groups
foreach var in Income HHSampleMeanIncome {
	gen `var'Group = floor(`var'/10000)*10+5
	replace `var'Group = 85 if `var'>=70000&`var'<100000
	replace `var'Group = 125 if `var'>=100000
}


** Get logs of income variables
foreach var in Income { // 
	gen ln`var' = ln(`var')
}

** Get leads of income
sort household_code year
gen lnIncome_Lead2 = lnIncome[_n+2] if household_code==household_code[_n+2]&year==year[_n+2]-2
gen lnIncome_Lead1 = lnIncome[_n+1] if household_code==household_code[_n+1]&year==year[_n+1]-1

drop household_income 


** Merge MTR
merge m:1 NominalIncome using $Externals/Intermediate/Homescan/MTRsForHomescan.dta
assert _m==3
drop _m


*** Label variables
label var Income "Household income"
label var lnIncome "ln(Household income)"
label var lnIncome_Lead2 "ln(Household income) (year+2)"
label var lnIncome_Lead1 "ln(Household income) (year+1)"
label var Employed "1(Employed)"
label var WorkHours "Weekly work hours"
label var R_White "1(White)"
label var R_Black "1(Black)"
label var Educ "Years education"
label var lnEduc "ln(Years education)"
label var lnAge "ln(Age)"
label var Children "1(Have children)"
label var HouseholdSize "Household size (adult equivalents)"
label var NHeads "Number of household heads"

compress
saveold $Externals/Intermediate/Homescan/Household-Panel.dta,replace



