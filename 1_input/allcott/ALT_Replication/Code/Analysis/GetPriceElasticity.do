/* GetPriceElasticity.do */
	
	* Get price elasticity	
	local PriceElasticity = -1*($CumulativeElasticity)
	matrix V = e(V)
	matrix V = V[1..$NLags,1..$NLags]
	
	* Use delta method to get standard error
	* Get Gradient
	local Gradient = "[1"
	forvalues l=2/$NLags {
		local Gradient = "`Gradient',1"
	}
	local Gradient = "`Gradient']"
	matrix Gradient = `Gradient'
	matrix Var = Gradient*V*(Gradient')
	local se_PriceElasticity = Var[1,1]^0.5
	display `se_PriceElasticity'
