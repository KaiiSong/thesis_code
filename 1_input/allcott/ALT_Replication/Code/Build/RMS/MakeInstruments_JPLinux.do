/* MakeInstruments_JPLinux.do */
* This file imports the RMS movement tsv files and creates the instruments.
* With only taxable bevs (group=0 only), this takes approx 3 days on JPLinux.
* This also prepares the leave-out instruments for all groups in $SubstituteGroupList, but skips the Hausman and other instruments for those substitutes.



/* SETUP */
include Code/SetGlobals.do

capture log close
log using MakeInstruments_JPLinux.log, replace


/* Get UPC version file for each year */
forvalues year = $BeginYear/$EndYear {
	insheet using $Nielsen/RMS/`year'/Annual_Files/rms_versions_`year'.tsv, clear
	format upc %12.0f
	drop panel_year
	saveold $Externals/Intermediate/RMS/rms_versions_`year'.dta, replace
}

** Initialize files
* Make UPC-Store-Time instruments and UPC-Chain-$InstrumentArea-Time instruments
clear 
save $Externals/Intermediate/RMS/UPC-Store-Time_Instruments.dta, replace emptyok
clear 
save $Externals/Intermediate/RMS/UPC-Chain-$InstrumentArea-Time_Instruments.dta, replace emptyok
clear 
save $Externals/Intermediate/RMS/UPC-dma-Time_Instruments.dta, replace emptyok

* Primary instrument files for the substitutes
foreach group in $SubstituteGroupList {
	clear 
	save $Externals/Intermediate/RMS/UPC-Store-Time_Instruments_Group`group'.dta, replace emptyok
	clear 
	save $Externals/Intermediate/RMS/UPC-Chain-$InstrumentArea-Time_Instruments_Group`group'.dta, replace emptyok
}


/* OPEN MOVEMENT FILES AND COLLAPSE */
forvalues year = $BeginYear/$EndYear {
	display "Starting year `year'."
	foreach group in 0 $SubstituteGroupList {

		/* IMPORT HIERARCHY FILE TO DETERMINE THE SET OF PRODUCT MODULES */
		import excel "$Nielsen/RMS/reference_documentation/Product_Hierarchy_01.15.2018.xlsx", sheet("hierarchy 10-10-2016")  cellrange(A1:J1405) firstrow clear
		drop if Available == "X" // drop if only available in consumer panel
		drop if product_module_code==8621 // drop cellular phones. this is a duplicate and messes up the 1:1 merge below.
		
		** Keep only the relevant group being prepared
		fmerge 1:1 product_module_code using $Externals/Intermediate/NutritionFacts/Groups.dta, keep(match) keepusing(group Taxable) nogen
			* Keep only SSB modules
			*drop if Taxable != 1
			*drop Taxable
		* Keep only the relevant group
		replace group = 0 if Taxable == 1
		keep if group==`group'
		drop Taxable group
		
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
		
		save $Externals/Intermediate/RMS/Product_Hierarchy`year'.dta, replace


		/* COLLAPSE THE MOVEMENT FILE FOR EACH MODULE */
		forvalues n = 1/`NModules' { 
			use $Externals/Intermediate/RMS/Product_Hierarchy`year'.dta, replace
			local product_module = module_string[`n']
			display "`product_module'"
			local product_group = group_string[`n']
			display "`product_group'"
			
			** 
			capture noisily insheet using $Nielsen/RMS/`year'/Movement_Files/`product_group'_`year'/`product_module'_`year'.tsv,clear
			if _rc != 601 { // _rc = 601 if the file isn't found
				replace price = price/prmult
				format upc %12.0f
				
				** Collapse to eliminate "almost duplicates"
					* Use the first one. According to the codebook, these are duplicates
				collapse (max) feature display (first) price, by(store_code_uc week_end upc) fast // units
				
				** Create $TimeVar
				if "$TimeVar" == "YQ" {
					gen byte month = real(substr(string(week_end,"%11.0g"),5,2))
					gen byte quarter = ceil(month/3)
							
					* The week_end is the Saturday ending the week of the data. Put the data into the previous quarter if week_end is one of the first three days of the next quarter.
					gen byte day = real(substr(string(week_end,"%11.0g"),7,2))
					replace quarter = 1 if month==4&day<=3
					replace quarter = 2 if month==7&day<=3
					replace quarter = 3 if month==10&day<=3
					drop day
								
					gen int YQ = yq(`year',quarter)
					format %tq YQ
					drop month quarter
				}
				
				** Deflate
				fmerge m:1 $TimeVar using $Externals/Intermediate/CPI/CPI_$TimeVar.dta, keep(match master) nogen keepusing(CPI)
				replace price = price/CPI
				drop CPI
				
				** Get the feature, display, and audited variables
					* See RMS manual, description of Movement files. 
					* Nielsen only observes features for a subset of stores (called "audited stores"). 
					* For non-audited stores, "it is reasonable to assume that all other stores for that retailer in the same DMA have that same item featured."
					* For 2004-2012, missing is sometimes coded as zero. For 2013 forward, missing is always coded as missing. HA has checked and it is correct that there are non-missing values of feature and display in all years before 2013, including 2012, in some cases when Audited!=1
					* From RMS manual, describing pre-2012 data: "Therefore, when researchers are using casual information (feature & display settings), they should consider only stores that have both Features and Displays for a given week, and should ignore the Feature/Display values for non-audited stores."
				* Merge Audited variables
				fmerge m:1 store_code_uc week_end using $Externals/Intermediate/RMS/Audited_`year'.dta, ///
					nogen keep(match master) keepusing(Audited AuditedInDMA) 
				* Make feature and display missing if not audited
					* This does not change any data in 2013 and later
				replace feature = . if Audited!=1
				replace display = . if Audited!=1
				drop Audited
				
				** Merge retailer data
				gen int year = `year'
				fmerge m:1 store_code_uc year using $Externals/Intermediate/RMS/Stores.dta, ///
					nogen keep(match master) keepusing(ChainCodeForIV $InstrumentArea retailer_code region dma)
				drop year
				
				** Get indicator for whether any stores at that retailer-DMA featured each UPC. Make missing if no stores in DMA audited.
				bysort week_end upc dma retailer_code: egen byte FeaturedInDMA = max(feature) if AuditedInDMA==1 // Note that for some UPCs (say 5%), all feature variables are missing within a DMA-retailer-week, even if some store was audited. So you can have a store that's audited but still have UPC-level missing data within that store.			
				drop feature retailer_code AuditedInDMA
				
				** Get price and average prices
				gen lnprice = ln(price)
				bysort week_end upc region: egen lnprice_region = mean(lnprice)
				drop region
				bysort week_end upc: egen lnprice_nation = mean(lnprice)

				**************************
				*** Save for the UPC-Store-Time instruments
				
					preserve
						drop week_end dma
					** Get relative price instruments
						* Make them missing if we don't observe feature
					gen dmNat_lnPrice = lnprice-lnprice_nation if FeaturedInDMA!=. 
					gen dmReg_lnPrice = lnprice-lnprice_region if FeaturedInDMA!=. 
					
					collapse (mean) price $PriceVars feature=FeaturedInDMA display, by(store_code_uc upc $TimeVar) fast //  (sum) units
					
					* Get upc_ver_uc
					fmerge m:1 upc using $Externals/Intermediate/RMS/rms_versions_`year'.dta, keep(match master) nogen keepusing(upc_ver_uc)
					
					* Append and save
					if `group' == 0 {
						append using $Externals/Intermediate/RMS/UPC-Store-Time_Instruments.dta
						saveold $Externals/Intermediate/RMS/UPC-Store-Time_Instruments.dta, replace
					}
					else {
						capture noisily drop $PriceVars // we just want feature and display. Also keep price as a data check.
						append using $Externals/Intermediate/RMS/UPC-Store-Time_Instruments_Group`group'.dta
						saveold $Externals/Intermediate/RMS/UPC-Store-Time_Instruments_Group`group'.dta, replace
					}
					restore

					
				*************************
				
				if `group'==0 { // then preserve for Hausman instruments below
					preserve
				}
				
				*************************
				
				*** Prepare the leave-out instruments
				drop display price dma
				
				gen NStores_county = 1
				collapse (first) $TimeVar lnprice_nation lnprice_region (sum) NStores_county (mean) lnprice FeaturedInDMA, ///
					by(upc ChainCodeForIV week_end $InstrumentArea) fast
				
				** Get leave-out price
				bysort upc ChainCodeForIV week_end: egen NStores = sum(NStores_county)
				bysort upc ChainCodeForIV week_end: egen lnprice_ChainAverage = wtmean(lnprice), weight(NStores_county)
					drop week_end
				gen LOlnprice = (lnprice_ChainAverage*NStores - lnprice*NStores_county) / (NStores-NStores_county)
					drop lnprice lnprice_ChainAverage NStores NStores_county
						
				** Get relative prices
				gen LOdmNat_lnPrice = LOlnprice - lnprice_nation if FeaturedInDMA!=. 
				gen LOdmReg_lnPrice = LOlnprice - lnprice_region if FeaturedInDMA!=. 
				gen LOdmNat_lnPriceA = LOlnprice - lnprice_nation
				drop lnprice_nation lnprice_region LOlnprice FeaturedInDMA
		
				collapse (mean) $LOPriceVars, by(upc ChainCodeForIV $TimeVar $InstrumentArea) fast
				
				* Get upc_ver_uc
				fmerge m:1 upc using $Externals/Intermediate/RMS/rms_versions_`year'.dta, keep(match master) nogen keepusing(upc_ver_uc)
				
				* Append and save
				if `group'==0 {
					append using $Externals/Intermediate/RMS/UPC-Chain-$InstrumentArea-Time_Instruments.dta
					saveold $Externals/Intermediate/RMS/UPC-Chain-$InstrumentArea-Time_Instruments.dta, replace
				}
				else {
					drop LOdmNat_lnPriceA
					append using $Externals/Intermediate/RMS/UPC-Chain-$InstrumentArea-Time_Instruments_Group`group'.dta
					saveold $Externals/Intermediate/RMS/UPC-Chain-$InstrumentArea-Time_Instruments_Group`group'.dta, replace
				}
				
				
				*************************
				*** Prepare the Hausman instruments
				if `group'==0 {
					restore
					
					gen NObs_dma = 1
					collapse (sum) NObs_dma (mean) lnprice, ///
						by(upc $TimeVar dma) fast
					
					** Get leave-out price
					bysort upc $TimeVar: egen NObs = sum(NObs_dma)
					bysort upc $TimeVar: egen lnprice_NationalAverage = wtmean(lnprice), weight(NObs_dma)
					
					gen Hausman_lnPrice = (lnprice_NationalAverage*NObs - lnprice*NObs_dma) / (NObs-NObs_dma)
						drop lnprice lnprice_NationalAverage NObs NObs_dma
						
					collapse (mean) Hausman_lnPrice, by(upc $TimeVar dma) fast
					
					* Get upc_ver_uc
					fmerge m:1 upc using $Externals/Intermediate/RMS/rms_versions_`year'.dta, keep(match master) nogen keepusing(upc_ver_uc)
					
					* Append and save
					append using $Externals/Intermediate/RMS/UPC-dma-Time_Instruments.dta
					saveold $Externals/Intermediate/RMS/UPC-dma-Time_Instruments.dta, replace
				}
			}
		}
	}
	erase $Externals/Intermediate/RMS/Product_Hierarchy`year'.dta
}



! chmod -R 777 /data/desert/Hunt/

