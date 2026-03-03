/* Prep_dma_Data.do */


import excel "$Nielsen\HMS\reference_documentation\2014 DMA to FIPS conversion table.xlsx", sheet("2014") firstrow clear
destring FIPS, gen(county) force
rename DMA dma
saveold $Externals/Intermediate/Geographic/DMA-county_crosswalk.dta, replace


merge 1:m county using $Externals/Intermediate/Geographic/county-year.dta, nogen keep(match) keepusing(countyIncome year)



collapse (mean) dmaIncome=countyIncome,by(dma year)

saveold $Externals/Intermediate/Geographic/dma-year.dta, replace


/* DMA-level sample average income */
collapse (mean) dmaIncome,by(dma)
gen dmalnIncome = ln(dmaIncome)
saveold $Externals/Intermediate/Geographic/dma.dta, replace
