/* GetGrams.do */
* This translates the size of each UPC into grams based on the size1_units
* For tea and powdered beverages, convert to units of liquid grams

/* Liquids */
gen Grams = size1_amount*multi if size1_units=="GR"
replace Grams = 28.350*size1_amount*multi if size1_units=="OZ"
replace Grams = 453.59*size1_amount*multi if size1_units=="PO"

* For liquid volumes, assume density of water
replace Grams = 1000*size1_amount*multi if size1_units=="LI"
replace Grams = size1_amount*multi if size1_units=="ML"
replace Grams = 946.35295*size1_amount*multi if size1_units=="QT" 


/* Other units with conversions available */
* Drink mixes, other beverages in non-liquid form, and counts
merge m:1 product_module_code size1_units using $Externals/Intermediate/NutritionFacts/ConversionToGrams.dta, keep(match master) nogen
replace size1_amount=1 if upc==85321030001 & size1_amount==.
replace Grams = ConversionToLiquidGrams*size1_amount*multi if ConversionToLiquidGrams!=.
drop ConversionToLiquidGrams

/*
We do not impute missing grams. Just consider this as missing data. Grams are missing for about 1% of the non-beverage substitutes. Grams are available for all but about 10 beverage UPCs.

/* IMPUTE MISSING GRAMS */
* When size1_amount is in count and grams is missing, impute using the counts based on what other products in the module or group use
* All beverages have grams at this point; this is only for non-beverage substitutes.
sum upc if Grams==.
if r(N)>0 {

	gen TotalCT = size1_amount*multi if size1_units=="CT" // Total Count in the UPC

	foreach cat in module group {
		gen ImputedGrams_`cat' = .
		levelsof product_`cat'_code,local(levels)
		foreach lev in `levels' {
			sum TotalCT if product_`cat'_code==`lev'
			if r(N) > 0 { // If there are UPCs with units in CT
				local levmeanCT = r(mean)
				local levsdCT = r(sd)
				sum Grams if product_`cat'_code==`lev'
				if r(N) > 0 { // Some modules may not have any UPCs already in Grams
					foreach stat in mean sd min max {
						local lev`stat'Grams = r(`stat')
					}

					replace ImputedGrams_`cat' = ( (TotalCT - `levmeanCT')/`levsdCT' ) * `levsdGrams' + `levmeanGrams' if size1_units=="CT"&product_`cat'_code==`lev'
					
					** Trim at min and max (most obviously important in that this eliminates negatives)
					replace ImputedGrams_`cat' = min(`levmaxGrams', max(`levminGrams',ImputedGrams_`cat')) if size1_units=="CT"&product_`cat'_code==`lev'&ImputedGrams_`cat'!=.	
				}
			}
		}
	}


	replace Grams = ImputedGrams_module if Grams==.&ImputedGrams_module!=.
	replace Grams = ImputedGrams_group if Grams==.&ImputedGrams_group!=.

	drop TotalCT ImputedGrams_*	
		
	* There are a small number of UPCs with no size1_amount. For these, impute the module or group average
	foreach cat in module group {
		bysort product_`cat'_code: egen `cat'_meanGrams = mean(Grams)
		replace Grams = `cat'_meanGrams if Grams==.
		drop `cat'_meanGrams
	} 
}
*/


