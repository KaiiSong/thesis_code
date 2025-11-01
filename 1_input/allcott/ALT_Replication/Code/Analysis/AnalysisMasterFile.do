/* AnalysisMasterFile.do */
* This carries out all Stata analyses.

include Code/Analysis/ExistingSodaTaxLevels.do

include Code/Analysis/DataSection.do 


include Code/Analysis/DescriptiveCorrelations.do
include Code/Analysis/DescribingInstrument.do


include Code/Analysis/EstimateDemand.do // must come before s_pref.do and BiasEffects.do because we use the demand elasticity to get gamma.
include Code/Analysis/SubstitutionPatterns.do
include Code/Analysis/s_pref.do 
include Code/Analysis/BiasEffects.do


* Other data prep for simulation
include Code/Analysis/GetGroupConsumptionAndPrices.do

