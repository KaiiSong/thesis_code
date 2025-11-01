/* OptimalSodaTaxMasterFile.do */
* This is the master file for Allcott, Lockwood, and Taubinsky (2018)
	* Regressive Sin Taxes, with an Application to the Optimal Soda Tax

*******************************************************************************
/* SETUP */
clear
set more off

/* Set directory locations */
if "`c(username)'"=="Hunt"|"`c(username)'"=="hallcott" {
	cd C:/Users/`c(username)'/Documents/GitHub/OptimalSodaTax
	global Externals = "C:/Users/`c(username)'/Dropbox/OptimalSodaTax/Externals"
	global Nielsen = "C:/Users/`c(username)'/Dropbox/Nielsen/"
} 
else if inlist("`c(username)'","benlockwood","benlo") {
	global Externals =  "~/Dropbox/Research/OptimalSodaTax/Externals" 
	cd "~/Dropbox/Research/github_repositories/github_SodaTax/"
}

else if "`c(username)'"=="taubinsky" {
	cd C:/Users/taubinsky/Dropbox/OptimalSodaTax/Externals/
	global Externals = "C:/Users/taubinsky/Dropbox/OptimalSodaTax/Externals"
} 

if "`c(username)'" == "OID User"{
	global Externals = "C:/Users/OID User/Dropbox/OptimalSodaTax/Externals"
}

/* Set other globals */
include Code/SetGlobals.do


/* Install programs */
*ssc install ebalance
*ssc install estpost
*ssc install ftools // Faster merges and collapses: https://github.com/sergiocorreia/ftools
*capture ssc inst _gwtmean // Weighted means
*ssc install binscatter
*ssc install reghdfe
*ssc install maptile
*ssc install spmap
*maptile_install using "http://files.michaelstepner.com/geo_county2010.zip"
*maptile_install using "http://files.michaelstepner.com/geo_state.zip"
*ssc install ivreg2 
*ssc install ranktest
*ssc install _gwtmean
*******************************************************************************



/* PROGRAMS */
/* Data Prep */
include Code/Build/DataPrepMasterFile.do


/* Analysis */
include Code/Analysis/AnalysisMasterFile.do 

