/* GetAuditedStores_JPLinux.do */
* This file gets Audited, an indicator variable for whether any store in the DMA-retailer-week was audited
* Note: this may cause Stata on JDube01 to crash due to I/O error when importing the largest movement tsv files. In this case, the correct thing to do for 2012 and later is to replace Audited and AuditedInDMA with 1 if they are zero, but keep as missing if they are missing.

/* SETUP */
clear all
set more off
include Code/SetGlobals.do

capture log close
log using GetAuditedStores_JPLinux.log, replace


/* OPEN MOVEMENT FILES AND COLLAPSE */
forvalues year = $BeginYear/$EndYear {
	display "Starting year `year'."

	** Define location of movement files and Product_Hierarchy file
	local Doc = "$Nielsen/RMS/reference_documentation"
	local Movement = "$Nielsen/RMS/`year'/Movement_Files/"


	/* IMPORT HIERARCHY FILE */
	import excel "`Doc'/Product_Hierarchy_01.15.2018.xlsx", sheet("hierarchy 10-10-2016")  cellrange(A1:J1405) firstrow clear
	drop if Available == "X" // drop if only available in consumer panel
	drop if product_module_code==8621 // drop cellular phones. this is a duplicate and messes up the 1:1 merge below.
		
	/* Drop if not included in RMS for year `year' */
		* The format here can include things like "2007, 2012-2014"
		* The below code works as long as there is no more than one year range (e.g. 2007-2014) in a cell, for a product module that is being prepared.
	** Drop any years explicitly listed
	drop if strpos(Scannerdatayearsnodata,"`year'")!=0 
	** Drop if between the bounds of a year range
	gen LB = real(substr(Scannerdatayearsnodata,strpos(Scannerdatayearsnodata,"-")-4,4)) if strpos(Scannerdatayearsnodata,"-")!=0
	gen UB = real(substr(Scannerdatayearsnodata,strpos(Scannerdatayearsnodata,"-")+1,4)) if strpos(Scannerdatayearsnodata,"-")!=0
	drop if LB!=. & UB!=. & `year' <= UB & `year' >= LB
			
	tostring product_group_code, gen(group_string)
	replace group_string="0"+group_string if length(group_string)==3
	tostring product_module_code, gen(module_string)

	local NModules = _N

	keep group_string module_string
	
	save $Externals/Intermediate/RMS/Product_Hierarchy`year'_All.dta, replace


	/* Set up movement file */
	clear
	save $Externals/Intermediate/RMS/Audited_`year'.dta, replace emptyok


	/* COLLAPSE THE MOVEMENT FILE FOR EACH MODULE */
	forvalues n = 1/`NModules' { 
		use $Externals/Intermediate/RMS/Product_Hierarchy`year'_All.dta, replace
		local module = module_string[`n']
		display "`module'"
		local group = group_string[`n']
		display "`group'"
		
		** 
		capture noisily insheet using `Movement'/`group'_`year'/`module'_`year'.tsv,clear
		if _rc != 601 { // _rc = 601 if the file isn't found
			collapse (max) feature display, by(store_code_uc week_end)
			
			compress
			append using $Externals/Intermediate/RMS/Audited_`year'.dta
			
			collapse (max) feature display, by(store_code_uc week_end) // This keeps a running tally of whether any of the UPCs has feature=1 and display=1 across all the modules checked so far in the loop.
			
			saveold $Externals/Intermediate/RMS/Audited_`year'.dta, replace
		}
		
	}
	
	*** Get Audited variable
	gen byte Audited = feature*display // RMS manual: "You will know that a store was audited by Nielsen in a given week if at least 1 UPC has Feature=1 and at least 1 UPC has Display=1." 
	drop feature display

	*** Get AuditedInDMA variable
	gen int year = `year'
	merge m:1 store_code_uc year using $Externals/Intermediate/RMS/Stores.dta, ///
		nogen keep(match master) keepusing(retailer_code dma)
	bysort retailer_code week_end dma: egen byte AuditedInDMA = max(Audited) // For 2006-2011, this will be zero in a few cases, but mostly it's 1 or "."
	drop retailer_code dma year

	sort store_code_uc week_end
	compress
	saveold $Externals/Intermediate/RMS/Audited_`year'.dta, replace
	
	erase $Externals/Intermediate/RMS/Product_Hierarchy`year'_All.dta
}


! chmod -R 777 /data/desert/Hunt/

