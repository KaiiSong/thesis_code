/* DemandEstimateEstAdds.do */


if `ctls'==1 {
	estadd local County "Yes"
	estadd local YearXGroup "Yes"
	estadd local NatAvPrice "No"
	estadd local CountyCtls "No"
}
if `ctls'==2 {
	estadd local County "Yes"
	estadd local YearXGroup "Yes"
	estadd local NatAvPrice "No"
	estadd local CountyCtls "No"
}
if `ctls'==3 {
	estadd local County "Yes"
	estadd local YearXGroup "Yes"
	estadd local NatAvPrice "Yes"
	estadd local CountyCtls "No"
}
if `ctls'==4 {
	estadd local County "Yes"
	estadd local YearXGroup "Yes"
	estadd local NatAvPrice "Yes"
	estadd local CountyCtls "Yes"
}
