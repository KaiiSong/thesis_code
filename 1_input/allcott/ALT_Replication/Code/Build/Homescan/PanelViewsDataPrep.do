/* PanelViewsDataPrep.do */
* This file prepares the October 2017 PanelViews data.

import delimited "$Externals/Data/PanelViews/beverage_170867_dissagg_data_final.tsv", delimiter(tab) varnames(1) case(preserve) clear

* ID
rename ID household_code

* Agree to participate
	* We still use those who refused -- most quit, but some actually complete the survey
gen byte refused = cond(Q2==2,1,0)
drop Q2

* replace zeros with missing values
foreach var of varlist Q3_1 - Q77_1 {
	destring `var', replace
}

foreach var of varlist Q3_1 - Q8 Q10_A_1 - Q77_1 {
	replace `var' = . if `var' == 0
}

* primary shopper status
ren Q8 prim_shop
replace prim_shop=0 if prim_shop==2 
label var prim_shop "Is this individual the primary shopper of the household"
label define prim_shop_lbl 0 "No" 1 "Yes"
label values prim_shop prim_shop_lbl

* drink consumption
gen soda = Q9_A_3
label var soda "Soda Consumption in Servings/Week"
gen fruit_juice = Q9_A_1
label var fruit_juice "100% Fruit Juice Consumption in Servings/Week"
gen sweet_fruit = Q9_A_2
label var sweet_fruit "Sweetened Fruit Juice Consumption in Servings/Week"
gen diet = Q9_A_4
label var diet "Diet Soda Consumption in Servings/Week"
gen tea = Q9_A_5
label var tea "Prepackaged Tea/Coffee Consumption in Servings/Week"
gen sports = Q9_A_6
label var sports "Sports Drink Consumption in Servings/Week"
gen energy = Q9_A_7
label var energy "Energy Drink Consumption in Servings/Week"
drop Q9*

***************************
***** Clean drink consumption
	* HA says: some people appear to have misunderstood "servings" and answered in ounces. To see this, sort by soda here and look at high responses.
	* If all answers are multiples of 10, 12, or 16 AND consumption is 48 or above, then OunceFlag=1 and all beverage numbers get divided by 12.

	* Then some additional responses are still unlikely. Make missing any total consumption of 100 or above
		* For reference, https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/water/art-20044256
		* And note that 100 is above the 99th percentile of observations that don't trigger the ounce flag.
		* 100 servings a week is 2.6 Big Gulps per day.
local DrinkList = "soda fruit_juice sweet_fruit diet tea sports energy"
egen TotalCons = rowtotal(`DrinkList')
foreach mult in 8 10 12 16 {
	foreach var in `DrinkList' {
		gen `var'MultOf`mult' = cond(floor(`var'/`mult')*`mult'==`var'&`var'!=.,1,0)
	}
}

foreach var in `DrinkList' {
	egen `var'Mult = rowtotal(`var'MultOf*)
	replace `var'Mult = min(`var'Mult,1) // =1 if that drink's response is EITHER 0 or a multiple of the multlist
}
gen NonZero = min(soda+fruit_juice+sweet_fruit+diet+tea+sports+energy,1)

gen OunceFlag = .
replace OunceFlag = sodaMult*fruit_juiceMult*sweet_fruitMult*dietMult*teaMult*sportsMult*energyMult * NonZero
replace OunceFlag = 0 if TotalCons<48 

** Correct the data
foreach var in `DrinkList' {
	replace `var' = `var'/12 if OunceFlag==1 // First correct the ounce mistakes
	gen improb_`var' = `var' >= 98 & `var' != . // Then note if others are improbable
	replace `var' = . if TotalCons>=100 // Then make missing if too large overall
	replace `var' = . if improb_`var' == 1 // ... or if the individual observation is improbable
	rename `var' cons_`var'
}
** Finally, using the cleaned data, get the SSB consumption result
gen PVSSBCons = (cons_soda + cons_sweet_fruit + cons_sports + cons_energy + cons_tea) * 12/33.814 * 52 // Average annual SSB consumption (liters/year)

drop *Mult* NonZero

***************************



* self control, spouse's self control
foreach var of varlist Q13* {
	replace `var' = . if `var' == 5 // 5 means no spouse
	replace `var' = (`var'-1)/3 // normalize to span 0 - 1
}

foreach var of varlist Q10* {
	replace `var' = (`var'-1)/3 // normalize to span 0 - 1
}

egen Q10mean = rowmean(Q10*)
egen Q13mean = rowmean(Q13*)

gen improb_self_control = inlist(Q10mean,0,1)
gen improb_hh_control = inlist(Q10mean,0,1)

foreach v in 2 4 5 6 7 {
	replace Q10_A_`v' = 1 - Q10_A_`v' // reverse polarity
	replace Q13_A_`v' = 1 - Q13_A_`v'
}

egen self_control = rowmean(Q10_*)
label var self_control "Level of Self Control, 0 to 1"

egen hh_control = rowmean(Q13_*)
label var hh_control "Level of Other Head of Household Self Control, 0 to 1"

replace self_control = . if improb_self_control == 1
replace hh_control = . if improb_hh_control == 1

bysort household_code: gen num_in_hh = _n // index for respondents in same households
by household_code: gen num_in_hh_total = _N
foreach var of varlist hh_control Q13_A_1 - Q13_A_7 {
	gen `var'_1 = `var' if num_in_hh == 1
	by household_code: egen `var'_1max = max(`var'_1) // spreads #1's response across all members of household
	gen `var'_2 = `var' if num_in_hh == 2
	by household_code: egen `var'_2max = max(`var'_2) // spreads #2's response across all members of household
	gen spouse_`var' = `var'_1max if num_in_hh == 2 // _other is #2's response if this person is #1, and v.v.
	replace spouse_`var' = `var'_2max if num_in_hh == 1
	rename `var' myspouse_`var'
}

foreach var of varlist Q10_A_1 - Q10_A_7 {
	rename `var' self_`var'
}

gen self_controlSSB = self_Q10_A_7
gen myspouse_controlSSB = myspouse_Q13_A_7

drop Q10* Q13*
drop num_in_hh hh_control_1* hh_control_2* 

* grocery shopping arrangement
rename Q23 who_shops
label var who_shops "Grocery shopping arrangement"
label define groc_lbl 1 "We each shop separately for our own groceries" 2 "Groceries are shared, and I shop for all or most of them" 3 "Groceries are shared, and I shop for little or none of them" 4 "Groceries are shared, and shopping is shared equally"
label values who_shops groc_lbl

* taste for various drinks
label define taste_lbl 0 "Not at all" 10 "Very much" 
gen taste_fruit_juice = Q24_A_1 - 1
label var taste_fruit_juice "100% Fruit Juice Enjoyment"
label values taste_f taste_lbl
gen taste_sweet_fruit = Q24_A_2 - 1
label var taste_sweet_fruit "Sweetened Juice Drinks Enjoyment"
label values taste_sw taste_lbl
gen taste_soda = Q24_A_3 - 1
label var taste_soda "Soda Enjoyment"
label values taste_so taste_lbl
gen taste_diet = Q24_A_4 - 1
label var taste_diet "Diet Soda Enjoyment"
label values taste_d taste_lbl
gen taste_tea = Q24_A_5 - 1
label var taste_tea "Prepackaged Tea/Coffee Enjoyment"
label values taste_t taste_lbl
gen taste_sports = Q24_A_6 - 1
label var taste_sports "Sports Drink Enjoyment"
label values taste_sp taste_lbl
gen taste_energy = Q24_A_7 - 1
label var taste_energy "Energy Drink Enjoyment"
label values taste_en taste_lbl
drop Q24*

foreach var of var taste_fruit_juice taste_sweet_fruit taste_soda taste_diet taste_tea taste_sports taste_energy{
	gen improb_`var' = `var' == 0 | `var' == 10
}
egen improb_taste = rowmean(improb_taste*)
	replace improb_taste = 0 if improb_taste < 1
foreach var of var taste_fruit_juice taste_sweet_fruit taste_soda taste_diet taste_tea taste_sports taste_energy{
	drop improb_`var'
	replace `var' = . if improb_taste == 1
}


// true number of calories and grams of sugar stories in 12oz_metrics.xlsx under Documentation

* estimated number of calories
gen cals_fruit_juice = Q25_A_1 - 155
label var cals_fruit_juice "Fruit Juice - Caloric Difference between Estimate and Actual"
gen cals_sweet_fruit = Q25_A_2 - 90
label var cals_sweet_fruit "Sweetened Juice Drinks - Caloric Difference between Estimate and Actual"
gen cals_soda = Q25_A_3 - 140
label var cals_soda "Soda - Caloric Difference between Estimate and Actual"
gen cals_diet = Q25_A_4 - 0
label var cals_diet "Diet Soda - Caloric Difference between Estimate and Actual"
gen cals_tea = Q25_A_5 - 130 
label var cals_tea "Prepackaged Tea/Coffee - Caloric Difference between Estimate and Actual"
gen cals_sports = Q25_A_6 - 80
label var cals_sports "Sports Drink - Caloric Difference between Estimate and Actual"
gen cals_energy = Q25_A_7 - 157
label var cals_energy "Energy Drink - Caloric Difference between Estimate and Actual"

	**Assign as improbable if
	**(A) calorie estimate > 800, (B) calorie estimate < 1 for all estimates, (C) all estimates are the same
	egen maxestimate = rowmax(Q25*)
	egen minestimate = rowmin(Q25*)

	gen improb_cals = 0
		replace improb_cals = 1 if maxestimate > 800 & maxestimate != .
		replace improb_cals = 1 if maxestimate < 1 & minestimate < 1
		replace improb_cals = 1 if maxestimate == minestimate & minestimate!=.
	drop maxestimate minestimate
	
	foreach var of var Q25*{
		replace `var' = . if improb_cals == 1
	}

drop Q25*

* estimated grams of sugar
gen sug_fruit_juice = Q26_A_1 - 33
label var sug_fruit_juice "Fruit Juice - Sugar Difference between Estimate and Actual"
gen sug_sweet_fruit = Q26_A_2 - 20
label var sug_sweet_fruit "Sweetened Juice Drinks - Sugar Difference between Estimate and Actual"
gen sug_soda = Q26_A_3 - 39
label var sug_soda "Soda - Sugar Difference between Estimate and Actual"
gen sug_diet = Q26_A_4 - 0
label var sug_diet "Diet Soda - Sugar Difference between Estimate and Actual"
gen sug_tea = Q26_A_5 - 35
label var sug_tea "Prepackaged Tea/Coffee - Sugar Difference between Estimate and Actual"
gen sug_sports = Q26_A_6 - 21
label var sug_sports "Sports Drink - Sugar Difference between Estimate and Actual"
gen sug_energy = Q26_A_7 - 39
label var sug_energy "Energy Drink - Sugar Difference between Estimate and Actual"

	**Assign as improbable if
	**(A) sugar estimate > 500, (B) sugar estimate < 1 for all estimates, (C) all estimates are the same
	egen maxestimate = rowmax(Q26*)
	egen minestimate = rowmin(Q26*)

	gen improb_sugar = 0
		replace improb_sugar = 1 if maxestimate > 500 & maxestimate != .
		replace improb_sugar = 1 if maxestimate < 1 & minestimate < 1
		replace improb_sugar = 1 if maxestimate == minestimate & minestimate!=.
	drop maxestimate minestimate
	
	foreach var of var Q26*{
		replace `var' = . if improb_sugar == 1
	}

drop Q26*

* importance of health
ren Q27_A_1 health_importance
replace health_importance = health_im - 1
label var health_importance "How important is it to remain healthy?"

* health knowledge
generate health_knowledge = 0 
	* part 1: eat more, less, or the same (or not sure) of the following
	//1 fruit
	replace health_knowledge = 1 if Q28_A_1 == 1
	// food and drinks with added sugar
	replace health_knowledge = health_knowledge+1 if Q28_A_2 == 3
	//2 veggies
	replace health_knowledge = health_knowledge+1 if Q28_A_3 == 1
	//3 fatty foods
	replace health_knowledge = health_knowledge+1 if Q28_A_4 == 3
	//4 processed red meat
	replace health_knowledge = health_knowledge+1 if Q28_A_5 == 3
	//5 whole grains
	replace health_knowledge = health_knowledge+1 if Q28_A_6 == 1
	//6 salty foods
	replace health_knowledge = health_knowledge+1 if Q28_A_7 == 3
	//7 water
	replace health_knowledge = health_knowledge+1 if Q28_A_8 == 1
	* part 2: fat types
	//8 unsaturated fats
	replace health_knowledge = health_knowledge+1 if Q29_A_1 == 2
	//9 tran fats
	replace health_knowledge = health_knowledge+1 if Q29_A_2 == 1
	//10 saturated fats
	replace health_knowledge = health_knowledge+1 if Q29_A_3 == 1
	* part 3: added sugars
	//11 diet soda 
	replace health_knowledge = health_knowledge+1 if Q30_A_1 == 2
	//12 plain yogurt
	replace health_knowledge = health_knowledge+1 if Q30_A_2 == 2
	//13 ice cream
	replace health_knowledge = health_knowledge+1 if Q30_A_3 == 1
	//14 ketchup
	replace health_knowledge = health_knowledge+1 if Q30_A_4 == 1
	//15 melon
	replace health_knowledge = health_knowledge+1 if Q30_A_5 == 2
	* part 4: salt
	//16 breakfast cereals
	replace health_knowledge = health_knowledge+1 if Q31_A_1 == 1
	//17 frozen veggies
	replace health_knowledge = health_knowledge+1 if Q31_A_2 == 2
	//18 bread
	replace health_knowledge = health_knowledge+1 if Q31_A_3 == 1
	//19 baked beans
	replace health_knowledge = health_knowledge+1 if Q31_A_4 == 1
	//20 red meat
	replace health_knowledge = health_knowledge+1 if Q31_A_5 == 2
	//21 canned soup
	replace health_knowledge = health_knowledge+1 if Q31_A_6 == 1
	* part 5: fiber
	//22 oats
	replace health_knowledge = health_knowledge+1 if Q32_A_1 == 1
	//23 banana
	replace health_knowledge = health_knowledge+1 if Q32_A_2 == 1
	//24 white rice
	replace health_knowledge = health_knowledge+1 if Q32_A_3 == 2
	//25 eggs
	replace health_knowledge = health_knowledge+1 if Q32_A_4 == 2
	//26 potatoes
	replace health_knowledge = health_knowledge+1 if Q32_A_5 == 1
	//27 pasta
	replace health_knowledge = health_knowledge+1 if Q32_A_6 == 2
	* part 6: protein
	//28 poultry
	replace health_knowledge = health_knowledge+1 if Q33_A_1 == 1
	//29 cheese
	replace health_knowledge = health_knowledge+1 if Q33_A_2 == 1
	//30 fruit
	replace health_knowledge = health_knowledge+1 if Q33_A_3 == 2
	//31 baked beans
	replace health_knowledge = health_knowledge+1 if Q33_A_4 == 1
	//32 butter
	replace health_knowledge = health_knowledge+1 if Q33_A_5 == 2
	//33 nuts
	replace health_knowledge = health_knowledge+1 if Q33_A_6 == 1
	* part 7: starchy
	//34 cheese 
	replace health_knowledge = health_knowledge+1 if Q34_A_1 == 2
	//35 pasta
	replace health_knowledge = health_knowledge+1 if Q34_A_2 == 1
	//36 potato
	replace health_knowledge = health_knowledge+1 if Q34_A_3 == 1
	//37 nuts
	replace health_knowledge = health_knowledge+1 if Q34_A_4 == 2
	//38 plantains
	replace health_knowledge = health_knowledge+1 if Q34_A_5 == 1
	* part 8: fat types
	//39 olive oil
	replace health_knowledge = health_knowledge+1 if Q35_A_1 == 2
	//40 butter
	replace health_knowledge = health_knowledge+1 if Q35_A_2 == 3
	//41 sunflower oil
	replace health_knowledge = health_knowledge+1 if Q35_A_3 == 1 
	//42 eggs
	replace health_knowledge = health_knowledge+1 if Q35_A_4 == 4
	* part 9: assorted multiple choice
	//43 trans fat
	replace health_knowledge = health_knowledge+1 if Q36 == 1
	//44 milks
	replace health_knowledge = health_knowledge+1 if Q37 == 1
	//45 cals by weight
	replace health_knowledge = health_knowledge+1 if Q38 == 4
	//46 yogurts
	replace health_knowledge = health_knowledge+1 if Q39 == 2
	//47 soup
	replace health_knowledge = health_knowledge+1 if Q40 == 2
	//48 variety
	replace health_knowledge = health_knowledge+1 if Q41 == 2
	//49 add flavour
	replace health_knowledge = health_knowledge+1 if Q42 == 2
	//50 sugar disease
	replace health_knowledge = health_knowledge+1 if Q43 == 2
	//51 sodium disease
	replace health_knowledge = health_knowledge+1 if Q44 == 3
	//52 heart disease
	replace health_knowledge = health_knowledge+1 if Q45 == 3
	//53 diabetes prevention
	replace health_knowledge = health_knowledge+1 if Q46 == 1
	//54 raise blood cholesterol
	replace health_knowledge = health_knowledge+1 if Q47 == 3
	//55 glycemic index
	replace health_knowledge = health_knowledge+1 if Q48 == 2
	//56 fiber and weight gain
	replace health_knowledge = health_knowledge+1 if Q49 == 1
	//57 BMI - 23
	replace health_knowledge = health_knowledge+1 if Q54 == 2
	//58 BMI - 31
	replace health_knowledge = health_knowledge+1 if Q55 == 4
	
replace health_knowledge = . if Q55 == . // All health knowledge quiz questions had required answers. So this is a proxy for whether people finished the health knowledge quiz. Without this line, we give non-responders zero health knowledge, instead of missing health knowledge.
	
generate health_pct_knowledge = health_knowledge/58
label var health_knowledge "Normalized Health Knowledge Score"

	**Assign improbable if 90% or more of all answers are on one of two extremes
	foreach var of var Q29* Q30* Q31* Q32* Q33* Q34* Q49{
		gen improb_`var' = `var' == 1 | `var' == 3
	}

	foreach var of var Q28* Q39 - Q48{
		gen improb_`var' = `var' == 1 | `var' == 4
	}

	foreach var of var Q35* Q36 Q54 Q55{
		gen improb_`var' = `var' == 1 | `var' == 5
	}
	
	local improb_knowledge = "improb_Q29_A_1 improb_Q29_A_2 improb_Q29_A_3 improb_Q30_A_1 improb_Q30_A_2 improb_Q30_A_3 improb_Q30_A_4 improb_Q30_A_5  improb_Q31_A_1 improb_Q31_A_2 improb_Q31_A_3 improb_Q31_A_4 improb_Q31_A_5 improb_Q31_A_6 improb_Q32_A_1 improb_Q32_A_2 improb_Q32_A_3 improb_Q32_A_4 improb_Q32_A_5 improb_Q32_A_6 improb_Q33_A_1 improb_Q33_A_2 improb_Q33_A_3 improb_Q33_A_4 improb_Q33_A_5 improb_Q33_A_6 improb_Q34_A_1 improb_Q34_A_2 improb_Q34_A_3 improb_Q34_A_4 improb_Q34_A_5 improb_Q49 improb_Q28_A_1 improb_Q28_A_2 improb_Q28_A_3 improb_Q28_A_4 improb_Q28_A_5 improb_Q28_A_6 improb_Q28_A_7 improb_Q28_A_8 improb_Q39 improb_Q40 improb_Q41 improb_Q42 improb_Q43 improb_Q44 improb_Q45 improb_Q46 improb_Q47 improb_Q48 improb_Q35_A_1 improb_Q35_A_2 improb_Q35_A_3 improb_Q35_A_4 improb_Q36 improb_Q54 improb_Q55"
	
	egen improb_knowledge = rowmean(`improb_knowledge')
		replace improb_knowledge = 0 if improb_knowledge < .9
		replace improb_knowledge = 1 if improb_knowledge >= .9
	drop `improb_knowledge'
	replace health_knowledge = . if improb_knowledge == 1

drop Q28_A_1-Q55


* gender //unaccounted 0 value
gen svy_male = cond(Q56==1,1,0) if inlist(Q56,1,2)
drop Q56

* DOB
label define month_ll 1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" 7 "July" 8 "August" 9 "September" 10 "October" 11 "November" 12 "December"
generate dob_month = Q57_A_1 //0 month
label var dob_month "Month of Birth"
generate dob_day = Q57_B_1 //0 day
label var dob_day "Day of Month Born"
generate dob_yr = 1900 + Q57_C_1 - 1 //-1 or 1899 year
label var dob_yr "Year Born"
generate svy_age = 2017 - dob_yr 
label var svy_age "Age"
gen improb_age = !inrange(svy_age,13,100) & !missing(svy_age)
replace svy_age = . if improb_age
label values dob_month month_lbl
generate birth_date = mdy(dob_month, dob_day, dob_yr)
label var birth_date "Respondent's Birthday, mdy fmt"
format %td birth_date
drop Q57*
//There are three people under 18, and four people 100 or over.
//One of those people claims to be 117. That is the age of the current oldest 
//living person 
replace Q58_A_1 = Q58_A_1 - 1
rename Q58_A_1 height_feetcomp
replace Q58_B_1 = Q58_B_1 - 1
rename Q58_B_1 height_inchcomp
gen height = 12*height_feetcomp + height_inchcomp
label var height "Height in Inches"
gen improb_height = !inrange(height,48,84) & !missing(height)
replace height = . if improb_height

* diabetes
gen Diabetic=cond(Q60==1,1,0) if inlist(Q60,1,2)
label var Diabetic "Ever diagnosed with diabetes?"
drop Q60

* multi-member 
rename Q7 multi_taken
label define multi_lbl 1 "Some have not taken" 2 "All have taken"
label var multi_taken "Are there members of your household who have not yet taken survey?"
label values multi_taken multi_lbl

* weight
rename Q77_1 weight
label var weight "Weight in Pounds"
gen improb_weight = !inrange(weight,75,450) & !missing(weight)
replace weight = . if improb_weight

* BMI
	* BMI = kg/m^2
gen BMI = (weight/2.20462) / (height*0.0254)^2


* primary occupation
// merge crosswalk datafile obtained from https://www.bls.gov/soc/#classification 2000 data
rename (Q72_1 Q72_2) (occname occname_det)
replace occname = trim(occname)
replace occname_det = trim(occname_det)
merge m:1 occname occname_det using "$Externals/Data/PanelViews/occupation_data.dta"
drop if _merge == 2 // drop using only
replace occname = "" if occname == "Did not Answer"
replace occname_det = "" if occname_det == "None"
drop _merge

label var occcode_det "BLS Occupation Code"
label var occname_det "Name of Suboccupation"
label var occname "Name of Occupation"
gen health_nutr_occ = cond(inlist(occcode_det,3010,3030,3050,3060,3110,3130,3160,3260,3310,3410),1,0) if occcode_det`i'!=.
label var health_nutr_occ "Health or Nutrition Occupation: Binary Variable"
label define health_nutr_occ_lbl 1 "Health or Nutrition Occupation" 0 "Not Health or Nutrition Occupation"
label values health_n health_nutr_occ_lbl

/* STILL NEED TO SORT OUT CORRECT CODING OF GEOGRAPHIES
* places
destring Q62_A_1 - Q62_D_8, replace force
drop Q62_A_1 Q62_D_1 Q62_D_2 Q62_D_3 Q62_D_4 Q62_D_5 Q62_D_6 Q62_D_7 Q62_D_8

destring Q83_A_1 - Q88_5, replace force
drop Q83_A_1 Q83_B_1 Q83_A_2 Q83_B_2 Q83_A_3 Q83_B_3 Q83_A_4 Q83_B_4 Q83_A_5 Q83_B_5
*/

drop Q*

*merge using $Externals/Data/PanelViews/ssa_fips_state_county2017.dta
*drop if _m == 2
*drop _merge


/* Improbable variable */
egen improb_contin = rowmean(improb*) // share of questions answered improbably
gen improbable = improb_contin > 0.1 
drop improb_*

** Manual codes
replace improbable = 1 if household_code==31063841 & prim_shop==0 // 

*****************
/*
** Get percent dropped due to improbable answers
preserve
sum improbable
local percent = round((r(mean))*100,0.1)
display "`percent' percent of observations are improbable."
clear
set obs 1
gen percent = `percent'
outfile percent using "Output/Analysis/NumbersForText/PercentImprobable.tex", replace
restore
*/
*****************
drop if improbable==1
drop improbable

/* FINAL DATA PREP */
* Re-normalize health_importance and taste to be on a 0-1 scale.
foreach var of varlist health_importance taste_* {
	replace `var' = `var'/10
}

/* Rename variables for use later */
rename self_controlSSB SelfControl // This is SSB self-control.
rename health_pct_knowledge Knowledge
rename myspouse_controlSSB MySpouse_SelfControl



/* Get other spouse's rating of respondent self-control */
gen SelfControl_FromSpouse=.
sort household_code
replace SelfControl_FromSpouse = MySpouse_SelfControl[_n-1] if household_code==household_code[_n-1] & MySpouse_SelfControl[_n-1]!=.
replace SelfControl_FromSpouse = MySpouse_SelfControl[_n+1] if household_code==household_code[_n+1] & MySpouse_SelfControl[_n+1]!=.

/* Drop duplicates */
** Determine duplicates
sort household_code
foreach var in birth_date height { // weight
	gen int `var'_other = -30000 // so that it will not accidentally match with any birth_dates in the data
	replace `var'_other = `var'[_n-1] if household_code == household_code[_n-1]
	replace `var'_other = `var'[_n+1] if household_code == household_code[_n+1]
}

* Same birth dates if same date, within 2 days, off by one month, or off by one year
gen birth_date_same = cond(birth_date==birth_date_other | ///
	(birth_date>=birth_date_other-2 & birth_date<=birth_date_other+2) | ///
	birth_date==birth_date_other+30 | birth_date==birth_date_other-30 | ///
	birth_date==birth_date_other+31 | birth_date==birth_date_other-31 | ///
	birth_date==birth_date_other+365 | birth_date==birth_date_other-365 | ///
	birth_date==birth_date_other+366 | birth_date==birth_date_other-366 ///
	,1,0)
* Same height if same or within one inch
gen height_same = cond(height==height_other | ///
	(height>=height_other-1 & height<=height_other+1) ///
	,1,0)
* Not imposing weight_same. This falsely eliminates duplicates, due to people who appear to be the same person reporting different weights
*gen weight_same = cond(weight==weight_other | ///
*	(weight>=weight_other-10 & weight<=weight_other+10) | ///
*	weight==.|weight_other==.,1,0)

* If doing occnames, most of the discrepancies are because people are missing.

drop birth_date_other height_other

** Decide which to drop
* First drop observations if they are missing key variables, in order of the importance of these variables for the analysis
foreach var of varlist Knowledge SelfControl taste_* health_importance MySpouse_SelfControl cons_* health_nutr_occ {
	display "`var'"
	* Determine which observations are duplicates
	duplicates tag household_code prim_shop svy_male, gen(dup)
	gen dup_all = dup*birth_date_same*height_same 

	sum dup_all
	if r(mean)==0 {
		drop dup dup_all
		break
	}
	sort household_code
	gen `var'_oth = .
	replace `var'_oth = `var'[_n-1] if household_code == household_code[_n-1]
	replace `var'_oth = `var'[_n+1] if household_code == household_code[_n+1]
	drop if dup_all == 1 & `var'==.&`var'_oth!=.
	
	drop `var'_oth dup dup_all
}

* Determine which observations are still duplicates
duplicates tag household_code prim_shop svy_male, gen(dup)
gen dup_all = dup*birth_date_same*height_same 

* Then use only the final survey response, or a random
	* First and second survey responses have similar average Knowledge scores. In some cases, it looks like people may have done a more complete or correct job after a first practice round.
set seed 0
gen rand = uniform()
gsort household_code -multi_taken rand
by household_code: gen n = _n
drop if dup_all == 1 & n == 2

drop dup dup_all rand n birth_date_same height_same


/* Get spouse number */
* SpouseNumber = 1 if the survey is complete, then primary shopper, then woman, then oldest, then random
gen byte CompleteCase = 1
foreach var of varlist Knowledge SelfControl taste_* health_importance { 
	replace CompleteCase = 0 if `var' == .
}

set seed 0
gen rand=uniform()
gsort household_code -CompleteCase -prim_shop svy_male birth_date rand
by household_code: gen byte SpouseNumber=_n
label variable SpouseNumber "Head number"
drop CompleteCase


/* Other labels */
label var prim_shop "1(Primary shopper)"
label var svy_male "1(Male)"

label variable self_control "Self-control scale"
label variable SelfControl "Self-control"
label variable MySpouse_SelfControl "Other head self-control"
label variable SelfControl_FromSpouse "Self-control, rated by other head"

label variable Knowledge "Nutrition knowledge"
label variable taste_soda "Taste for soda"
label variable taste_tea "Taste for tea/coffee"
label variable taste_sweet_fruit "Taste for juice drinks"
label variable taste_sports "Taste for sports drinks"
label variable taste_energy "Taste for energy drinks"
label var taste_fruit_juice "Taste for fruit juice"
label var taste_diet "Taste for diet drinks"
label variable health_importance "Health importance"
label variable PVSSBCons "SSB consumption (liters)"

compress
saveold "$Externals/Intermediate/Homescan/PanelViews.dta", replace


/* Get household-level data */
** Reshape to get spouse ratings
use "$Externals/Intermediate/Homescan/PanelViews.dta", replace

keep household_code SpouseNumber SelfControl MySpouse_SelfControl Knowledge taste_* health_importance PVSSBCons BMI Diabetic // SelfControl_FromSpouse
bysort household_code: gen byte NumberofRespondents = _N

reshape wide SelfControl MySpouse_SelfControl Knowledge taste_* health_importance PVSSBCons BMI Diabetic, i(household_code) j(SpouseNumber) // SelfControl_FromSpouse

** Get averages for the households where observed
	* Either households with both heads responding or only one head
foreach var in SelfControl Knowledge $PVControls BMI Diabetic { 
	gen `var'_Av = (`var'1 + `var'2)/2
	replace `var'_Av = `var'1 if MySpouse_SelfControl1==.
}
forvalues s = 1/2 {
	gen SelfControl_RatedBy`s' = SelfControl`s'
	replace SelfControl_RatedBy`s' = (SelfControl`s'+MySpouse_SelfControl`s')/2 if MySpouse_SelfControl`s'!=.
}
** Get all respondent averages
foreach var in PVSSBCons {
	gen `var'_RespAv = `var'1
	replace `var'_RespAv  = `var'2 if `var'1==.
	replace `var'_RespAv = (`var'1+`var'2)/2 if `var'1!=.&`var'2!=.
}

label variable SelfControl1 "Head 1 self-control"
label variable MySpouse_SelfControl1 "Head 1 rating of head 2's self-control"
label variable SelfControl2 "Head 2 self-control"
label variable MySpouse_SelfControl2 "Head 2 rating of head 1's self-control"
label variable Knowledge1 "Head 1 nutrition knowledge"
label variable Knowledge2 "Head 2 nutrition knowledge"
label variable PVSSBCons1 "Head 1 SSB consumption (liters)"
label variable PVSSBCons2 "Head 2 SSB consumption (liters)"

*label variable self_control_Av "Self-control scale"
label variable SelfControl_Av "Self-control"

label var SelfControl_RatedBy1 "Self-control"
label variable Knowledge_Av "Nutrition knowledge"
label variable Knowledge1 "Nutrition knowledge"

** Household averages
label variable taste_soda_Av "Taste for soda"
label variable taste_soda1 "Taste for soda"
label variable taste_tea_Av "Taste for tea/coffee"
label variable taste_sweet_fruit_Av "Taste for juice drinks"
label variable taste_sports_Av "Taste for sports drinks"
label variable taste_energy_Av "Taste for energy drinks"
label var taste_fruit_juice_Av "Taste for fruit juice"
label var taste_diet_Av "Taste for diet drinks"

label variable health_importance_Av "Health importance"
label variable health_importance1 "Health importance"

*label variable PVSSBCons_Av "SSB consumption (liters)"

label variable BMI_Av "Body mass index"
label variable Diabetic_Av "Diabetic"


compress
saveold "$Externals/Intermediate/Homescan/PanelViews_by_Household.dta", replace
