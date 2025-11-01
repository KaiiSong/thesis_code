/* SetGlobals.do */

/* Additional file paths for JDube01 */
if "`c(username)'"=="hallcott" { // This is Hunt's login on JP's new linux box
	capture cd /data/desert/Hunt/
	if _rc != 170 { // hallcott is HA's username on both Lenovo and JDube01. This allows the program to accommodate either.
		global Nielsen = "/nielsen_extracts/"
		global Externals = "/data/desert/Hunt/"
	}
}

/* Globals for instruments */
global InstrumentArea = "county" // zip
global PriceVars = "dmNat_lnPrice dmReg_lnPrice" 
global LOPriceVars = "LOdmNat_lnPrice LOdmReg_lnPrice LOdmNat_lnPriceA"
global dmaPriceVars = "Hausman_lnPrice"
global PrimaryIV = "LOdmNat_lnPrice"

/* Set other globals */
global BeginYear = 2006
global EndYear = 2016

global OutFigDir "Output/Figures"

global Controls = "lnIncome lnEduc lnAge R_White R_Black Children HouseholdSize Employed WorkHours"
global Controls_SumStats = "Income Educ Age R_White R_Black Children HouseholdSize Employed WorkHours"
global WeightingVars = "Income Educ Age R_White R_Black Children HouseholdSize" // To approximate the variables used to construct Nielsen projection factors
global DemandControls = ""  // Controls in price elasticity IV regressions //  "Employed WorkHours"  // subinstr("$Controls","lnIncome","",.)

global PVControls = "taste_sweet_fruit taste_soda taste_tea taste_sports taste_energy taste_fruit_juice taste_diet health_importance"
global PVControls1 = "taste_sweet_fruit1 taste_soda1 taste_tea1 taste_sports1 taste_energy1 taste_fruit_juice1 taste_diet1 health_importance1"
global PVControls2 = "taste_sweet_fruit2 taste_soda2 taste_tea2 taste_sports2 taste_energy2 taste_fruit_juice2 taste_diet2 health_importance2"
global PVControls_Av = "taste_sweet_fruit_Av taste_soda_Av taste_tea_Av taste_sports_Av taste_energy_Av taste_fruit_juice_Av taste_diet_Av health_importance_Av"

global SubstituteGroupList = "1 3 5 6 8 11 12 13 14 15 16 17 18 19 20"

global TimeVar = "YQ" // YQ or year. This is the time frequency of the data for the demand estimation and instruments

