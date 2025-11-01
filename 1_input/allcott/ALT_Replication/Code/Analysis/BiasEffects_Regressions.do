/* BiasEffects_Regressions.do */
* This carries out the regressions for the main bias effects table

*** Primary specification
areg `YVar' Knowledge SelfControl $PVControls lnIncome lnEduc $OtherControls $weight, ///
	cluster(household_code) absorb(county)
	eststo `spec'P // P for primary
	estadd local Controls "Yes"
	estadd local OtherControls "Yes"
	estadd local County "Yes"	
	estadd local SelfControlIV "No"

*** Robustness checks
** Coefficient movement
areg `YVar' Knowledge SelfControl $OtherControls $weight, ///
	cluster(household_code) absorb(county)
	eststo `spec'2
	estadd local Controls "No"
	estadd local OtherControls "Yes"
	estadd local County "Yes"	
	estadd local SelfControlIV "No"

areg `YVar' Knowledge SelfControl $PVControls lnIncome lnEduc $weight, ///
	cluster(household_code) absorb(county)
	eststo `spec'3
	estadd local Controls "Yes"
	estadd local OtherControls "No"
	estadd local County "Yes"	
	estadd local SelfControlIV "No"

reg `YVar' Knowledge SelfControl $PVControls lnIncome lnEduc $OtherControls $weight, ///
	cluster(household_code)
	eststo `spec'4
	estadd local Controls "Yes"
	estadd local OtherControls "Yes"
	estadd local County "No"		
	estadd local SelfControlIV "No"

** Omit self-control variable
areg `YVar' Knowledge $PVControls lnIncome lnEduc $OtherControls $weight, ///
	cluster(household_code) absorb(county)
	eststo `spec'K // K for knowledge-only
	estadd local Controls "Yes"
	estadd local OtherControls "Yes"
	estadd local County "Yes"	
	estadd local SelfControlIV "No"
	
	
*** With interaction term 
gen KnowledgeXSelfControl = Knowledge*SelfControl
label var KnowledgeXSelfControl "Nutrition knowledge $\times$ self-control"

areg `YVar' Knowledge SelfControl KnowledgeXSelfControl $PVControls lnIncome lnEduc $OtherControls $weight, ///
	cluster(household_code) absorb(county)

	eststo `spec'_Interaction
	estadd local SelfControlIV "No"
	estadd local Controls "Yes"
	estadd local OtherControls "Yes"
	estadd local County "Yes"


*** Self-control measurement error correction
** First stage
areg `EndogVar' Knowledge SelfControl $PVControls lnIncome lnEduc $OtherControls $weight, ///
	absorb(county) vce(robust)
capture drop SelfControl_Hat
predict SelfControl_Hat

	eststo `spec'_FirstStage
	estadd local Controls "Yes"
	estadd local OtherControls "Yes"
	estadd local County "Yes"
	
	
** 2SLS
* Rename variables for table output
rename SelfControl SelfControl_IV
rename `EndogVar' SelfControl
label var SelfControl "Self-control"

ts2sls `YVar' Knowledge $PVControls lnIncome lnEduc $OtherControls (SelfControl=SelfControl_IV) $weight, ///
	cl(household_code) absorb(county)
	eststo `spec'M // M for measurement error correction
	estadd local SelfControlIV "Yes"
	estadd local Controls "Yes"
	estadd local OtherControls "Yes"
	estadd local County "Yes"	

* Undo the renames
rename SelfControl `EndogVar' 
rename SelfControl_IV SelfControl 

	*** Export results table
	esttab `spec'? using "Output/Analysis/`spec'Effects.tex", replace ///
		b(%8.3f) se(%8.3f) /// 
		stats(Controls OtherControls County SelfControlIV r2 N, ///
			l("Other beverage tastes" "Other demographics" "County indicators" "Self-control 2SLS" "$ R^{2}$" "N")  ///
			fmt(%8.0fc %8.0fc %8.0fc %8.0fc %8.3f %8.0fc)) ///
		star star(* 0.10 ** 0.05 *** 0.01) nogaps nonotes depvars label nomtitles ///
		keep(Knowledge SelfControl taste_soda health_importance lnIncome lnEduc) ///
		order(Knowledge SelfControl taste_soda health_importance lnIncome lnEduc) 


