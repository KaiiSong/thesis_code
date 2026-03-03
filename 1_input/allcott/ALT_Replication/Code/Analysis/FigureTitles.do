/* FigureTitles.do */
* This sets the figure titles depending on `var', which is held as a local


if "`var'" == "cals_Purchased_Need" {
	local varlabel = "Share of recommended calories from SSBs"
}
if "`var'" == "kg_Purchased_AdultEq" {
	local varlabel = "Liters purchased per adult equivalent per year"
}
if "`var'" == "Knowledge" {
	local varlabel = "Nutrition knowledge"
}
if "`var'" == "self_control" | "`var'" == "SelfControl" | "`var'" == "SelfControl_RatedBy1" {
	local varlabel = "Self-control"
}
if "`var'" == "taste_soda" {
	local varlabel = "Like the taste and enjoy drinking soda"
}
if "`var'" == "health_importance" {
	local varlabel = "How important is it to stay healthy?"
}
if "`var'" == "Knowledge" {
	local varlabel = "Nutrition knowledge"
}


*** Bias proxies
if "`var'" == "BiasEffect_K" {
	local varlabel = "ln(consumption) explained by imperfect knowledge"
}
if "`var'" == "BiasEffect_SC" {
	local varlabel = "ln(consumption) explained by imperfect self-control"
}
if "`var'" == "BiasEffect_T" { 
	local varlabel = "ln(consumption) explained by bias"
}
if "`var'" == "BiasEffect" { 
	*local varlabel = "Overconsumption attributable to bias"
	local varlabel = "Share of consumption attributable to bias"
}
if "`var'" == "gamma" {
	*local varlabel = "Money-metric bias ($/liter SSB)"
	local varlabel = "Average marginal bias (cents per ounce)"
}
