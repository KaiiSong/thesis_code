options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'NLSY79_0919_kai.dat' lrecl=414 missover DSD DLM=' ' print;
input
  H0004900
  H0005001
  R0000100
  R0009600
  R0173600
  R0214800
  T1298000
  T1298100
  T1298200
  T1298300
  T1298400
  T2056800
  T2056900
  T2057000
  T2057700
  T2057800
  T2209900
  T2210000
  T2210800
  T2212300
  T2217800
  T2326500
  T2326600
  T2326700
  T2326800
  T2326900
  T3027200
  T3027300
  T3027400
  T3028100
  T3028200
  T3107700
  T3107800
  T3110200
  T3115800
  T3308700
  T3308800
  T3308900
  T3309000
  T3309100
  T3958000
  T3958100
  T3958200
  T3958900
  T3959000
  T4112200
  T4112300
  T4114700
  T4120300
  T4282800
  T4282900
  T4283000
  T4283100
  T4283200
  T4895700
  T4895800
  T4895900
  T4896600
  T4896700
  T5022500
  T5022600
  T5026000
  T5031500
  T5256900
  T5257000
  T5257100
  T5257200
  T5257300
  T5599700
  T5599800
  T5599900
  T5600600
  T5600700
  T5770700
  T5770800
  T5774100
  T5779700
  T8428300
  T8428400
  T8428500
  T8428600
  T8428700
  T8624900
  T8625300
  T8625400
  T8787800
  T8787900
  T8790500
  T8796100
  T8982400
  T8982500
  T8982600
  T8982700
  T8982800
  T9183100
  T9183800
  T9183900
  T9299600
  T9299700
  T9302300
  T9307900
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label H0004900 = "CCR-DR DIAGNOSED DIABETES? XRND";
  label H0005001 = "CCR-DATE DIABETES DIAGNOSED XRND";
  label R0000100 = "ID# (1-12686) 79";
  label R0009600 = "1ST/ONLY RACL/ETHNIC ORIGIN 79";
  label R0173600 = "SAMPLE ID  79 INT";
  label R0214800 = "SEX OF R 79";
  label T1298000 = "OCCUPATION (2000 CODES) ALL JOB L1 2008";
  label T1298100 = "OCCUPATION (2000 CODES) ALL JOB L2 2008";
  label T1298200 = "OCCUPATION (2000 CODES) ALL JOB L3 2008";
  label T1298300 = "OCCUPATION (2000 CODES) ALL JOB L4 2008";
  label T1298400 = "OCCUPATION (2000 CODES) ALL JOB L5 2008";
  label T2056800 = "R TRYING TO LOSE OR GAIN WEIGHT 2008";
  label T2056900 = "READ NUTRITIONAL INFO ON FOOD 2008";
  label T2057000 = "READ INGREDIENTS ON FOOD 2008";
  label T2057700 = "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2008";
  label T2057800 = "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2008";
  label T2209900 = "FAMILY SIZE 2008";
  label T2210000 = "TOTAL NET FAMILY INCOME 2008";
  label T2210800 = "AGE AT INTERVIEW DATE 2008";
  label T2212300 = "RS RESIDENCE IN SMSA 2008";
  label T2217800 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2008";
  label T2326500 = "OCCUPATION (2000 CODES) ALL JOB L1 2010";
  label T2326600 = "OCCUPATION (2000 CODES) ALL JOB L2 2010";
  label T2326700 = "OCCUPATION (2000 CODES) ALL JOB L3 2010";
  label T2326800 = "OCCUPATION (2000 CODES) ALL JOB L4 2010";
  label T2326900 = "OCCUPATION (2000 CODES) ALL JOB L5 2010";
  label T3027200 = "R TRYING TO LOSE OR GAIN WEIGHT 2010";
  label T3027300 = "READ NUTRITIONAL INFO ON FOOD 2010";
  label T3027400 = "READ INGREDIENTS ON FOOD 2010";
  label T3028100 = "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2010";
  label T3028200 = "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2010";
  label T3107700 = "FAMILY SIZE 2010";
  label T3107800 = "TOTAL NET FAMILY INCOME 2010";
  label T3110200 = "RS RESIDENCE IN SMSA 2010";
  label T3115800 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2010";
  label T3308700 = "OCCUPATION (2000 CODES) ALL JOB L1 2012";
  label T3308800 = "OCCUPATION (2000 CODES) ALL JOB L2 2012";
  label T3308900 = "OCCUPATION (2000 CODES) ALL JOB L3 2012";
  label T3309000 = "OCCUPATION (2000 CODES) ALL JOB L4 2012";
  label T3309100 = "OCCUPATION (2000 CODES) ALL JOB L5 2012";
  label T3958000 = "R TRYING TO LOSE OR GAIN WEIGHT 2012";
  label T3958100 = "READ NUTRITIONAL INFO ON FOOD 2012";
  label T3958200 = "READ INGREDIENTS ON FOOD 2012";
  label T3958900 = "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2012";
  label T3959000 = "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2012";
  label T4112200 = "FAMILY SIZE 2012";
  label T4112300 = "TOTAL NET FAMILY INCOME 2012";
  label T4114700 = "RS RESIDENCE IN SMSA 2012";
  label T4120300 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2012";
  label T4282800 = "OCCUPATION (2000 CODES) ALL JOB L1 2014";
  label T4282900 = "OCCUPATION (2000 CODES) ALL JOB L2 2014";
  label T4283000 = "OCCUPATION (2000 CODES) ALL JOB L3 2014";
  label T4283100 = "OCCUPATION (2000 CODES) ALL JOB L4 2014";
  label T4283200 = "OCCUPATION (2000 CODES) ALL JOB L5 2014";
  label T4895700 = "R TRYING TO LOSE OR GAIN WEIGHT 2014";
  label T4895800 = "READ NUTRITIONAL INFO ON FOOD 2014";
  label T4895900 = "READ INGREDIENTS ON FOOD 2014";
  label T4896600 = "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2014";
  label T4896700 = "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2014";
  label T5022500 = "FAMILY SIZE 2014";
  label T5022600 = "TOTAL NET FAMILY INCOME 2014";
  label T5026000 = "RS RESIDENCE IN SMSA 2014";
  label T5031500 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2014";
  label T5256900 = "OCCUPATION (2000 CODES) ALL JOB L1 2016";
  label T5257000 = "OCCUPATION (2000 CODES) ALL JOB L2 2016";
  label T5257100 = "OCCUPATION (2000 CODES) ALL JOB L3 2016";
  label T5257200 = "OCCUPATION (2000 CODES) ALL JOB L4 2016";
  label T5257300 = "OCCUPATION (2000 CODES) ALL JOB L5 2016";
  label T5599700 = "R TRYING TO LOSE OR GAIN WEIGHT 2016";
  label T5599800 = "READ NUTRITIONAL INFO ON FOOD 2016";
  label T5599900 = "READ INGREDIENTS ON FOOD 2016";
  label T5600600 = "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2016";
  label T5600700 = "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2016";
  label T5770700 = "FAMILY SIZE 2016";
  label T5770800 = "TOTAL NET FAMILY INCOME 2016";
  label T5774100 = "RS RESIDENCE IN SMSA 2016";
  label T5779700 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2016";
  label T8428300 = "OCCUPATION (2000 CODES) ALL JOB L1 2020";
  label T8428400 = "OCCUPATION (2000 CODES) ALL JOB L2 2020";
  label T8428500 = "OCCUPATION (2000 CODES) ALL JOB L3 2020";
  label T8428600 = "OCCUPATION (2000 CODES) ALL JOB L4 2020";
  label T8428700 = "OCCUPATION (2000 CODES) ALL JOB L5 2020";
  label T8624900 = "R TRYING TO LOSE OR GAIN WEIGHT 2020";
  label T8625300 = "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2020";
  label T8625400 = "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2020";
  label T8787800 = "FAMILY SIZE 2020";
  label T8787900 = "TOTAL NET FAMILY INCOME 2020";
  label T8790500 = "RS RESIDENCE IN SMSA 2020";
  label T8796100 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2020";
  label T8982400 = "OCCUPATION (2000 CODES) ALL JOB L1 2022";
  label T8982500 = "OCCUPATION (2000 CODES) ALL JOB L2 2022";
  label T8982600 = "OCCUPATION (2000 CODES) ALL JOB L3 2022";
  label T8982700 = "OCCUPATION (2000 CODES) ALL JOB L4 2022";
  label T8982800 = "OCCUPATION (2000 CODES) ALL JOB L5 2022";
  label T9183100 = "R TRYING TO LOSE OR GAIN WEIGHT 2022";
  label T9183800 = "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2022";
  label T9183900 = "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2022";
  label T9299600 = "FAMILY SIZE 2022";
  label T9299700 = "TOTAL NET FAMILY INCOME 2022";
  label T9302300 = "RS RESIDENCE IN SMSA 2022";
  label T9307900 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2022";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarantee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  H0004900 = 'H40-CHRC-2_XRND'n
  H0005001 = 'H40-CHRC-2A~Y_XRND'n
  R0000100 = 'CASEID_1979'n
  R0009600 = 'FAM-30_1_1979'n
  R0173600 = 'SAMPLE_ID_1979'n
  R0214800 = 'SAMPLE_SEX_1979'n
  T1298000 = 'OCCALL-EMP.01_2008'n
  T1298100 = 'OCCALL-EMP.02_2008'n
  T1298200 = 'OCCALL-EMP.03_2008'n
  T1298300 = 'OCCALL-EMP.04_2008'n
  T1298400 = 'OCCALL-EMP.05_2008'n
  T2056800 = 'Q11-GENHLTH_6A_2008'n
  T2056900 = 'Q11-GENHLTH_7A_2008'n
  T2057000 = 'Q11-GENHLTH_7B_2008'n
  T2057700 = 'Q11-GENHLTH_7F_1_2008'n
  T2057800 = 'Q11-GENHLTH_7F_2_2008'n
  T2209900 = 'FAMSIZE_2008'n
  T2210000 = 'TNFI_TRUNC_2008'n
  T2210800 = 'AGEATINT_2008'n
  T2212300 = 'SMSARES_2008'n
  T2217800 = 'NUMCH08_2008'n
  T2326500 = 'OCCALL-EMP.01_2010'n
  T2326600 = 'OCCALL-EMP.02_2010'n
  T2326700 = 'OCCALL-EMP.03_2010'n
  T2326800 = 'OCCALL-EMP.04_2010'n
  T2326900 = 'OCCALL-EMP.05_2010'n
  T3027200 = 'Q11-GENHLTH_6A_2010'n
  T3027300 = 'Q11-GENHLTH_7A_2010'n
  T3027400 = 'Q11-GENHLTH_7B_2010'n
  T3028100 = 'Q11-GENHLTH_7F_1_2010'n
  T3028200 = 'Q11-GENHLTH_7F_2_2010'n
  T3107700 = 'FAMSIZE_2010'n
  T3107800 = 'TNFI_TRUNC_2010'n
  T3110200 = 'SMSARES_2010'n
  T3115800 = 'NUMCH10_2010'n
  T3308700 = 'OCCALL-EMP.01_2012'n
  T3308800 = 'OCCALL-EMP.02_2012'n
  T3308900 = 'OCCALL-EMP.03_2012'n
  T3309000 = 'OCCALL-EMP.04_2012'n
  T3309100 = 'OCCALL-EMP.05_2012'n
  T3958000 = 'Q11-GENHLTH_6A_2012'n
  T3958100 = 'Q11-GENHLTH_7A_2012'n
  T3958200 = 'Q11-GENHLTH_7B_2012'n
  T3958900 = 'Q11-GENHLTH_7F_1_2012'n
  T3959000 = 'Q11-GENHLTH_7F_2_2012'n
  T4112200 = 'FAMSIZE_2012'n
  T4112300 = 'TNFI_TRUNC_2012'n
  T4114700 = 'SMSARES_2012'n
  T4120300 = 'NUMCH12_2012'n
  T4282800 = 'OCCALL-EMP.01_2014'n
  T4282900 = 'OCCALL-EMP.02_2014'n
  T4283000 = 'OCCALL-EMP.03_2014'n
  T4283100 = 'OCCALL-EMP.04_2014'n
  T4283200 = 'OCCALL-EMP.05_2014'n
  T4895700 = 'Q11-GENHLTH_6A_2014'n
  T4895800 = 'Q11-GENHLTH_7A_2014'n
  T4895900 = 'Q11-GENHLTH_7B_2014'n
  T4896600 = 'Q11-GENHLTH_7F_1_2014'n
  T4896700 = 'Q11-GENHLTH_7F_2_2014'n
  T5022500 = 'FAMSIZE_2014'n
  T5022600 = 'TNFI_TRUNC_2014'n
  T5026000 = 'SMSARES_2014'n
  T5031500 = 'NUMCH14_2014'n
  T5256900 = 'OCCALL-EMP.01_2016'n
  T5257000 = 'OCCALL-EMP.02_2016'n
  T5257100 = 'OCCALL-EMP.03_2016'n
  T5257200 = 'OCCALL-EMP.04_2016'n
  T5257300 = 'OCCALL-EMP.05_2016'n
  T5599700 = 'Q11-GENHLTH_6A_2016'n
  T5599800 = 'Q11-GENHLTH_7A_2016'n
  T5599900 = 'Q11-GENHLTH_7B_2016'n
  T5600600 = 'Q11-GENHLTH_7F_1_2016'n
  T5600700 = 'Q11-GENHLTH_7F_2_2016'n
  T5770700 = 'FAMSIZE_2016'n
  T5770800 = 'TNFI_TRUNC_2016'n
  T5774100 = 'SMSARES_2016'n
  T5779700 = 'NUMCH16_2016'n
  T8428300 = 'OCCALL-EMP.01_2020'n
  T8428400 = 'OCCALL-EMP.02_2020'n
  T8428500 = 'OCCALL-EMP.03_2020'n
  T8428600 = 'OCCALL-EMP.04_2020'n
  T8428700 = 'OCCALL-EMP.05_2020'n
  T8624900 = 'Q11-GENHLTH_6A_2020'n
  T8625300 = 'Q11-GENHLTH_7F_1_2020'n
  T8625400 = 'Q11-GENHLTH_7F_2_2020'n
  T8787800 = 'FAMSIZE_2020'n
  T8787900 = 'TNFI_TRUNC_2020'n
  T8790500 = 'SMSARES_2020'n
  T8796100 = 'NUMCH20_2020'n
  T8982400 = 'OCCALL-EMP.01_2022'n
  T8982500 = 'OCCALL-EMP.02_2022'n
  T8982600 = 'OCCALL-EMP.03_2022'n
  T8982700 = 'OCCALL-EMP.04_2022'n
  T8982800 = 'OCCALL-EMP.05_2022'n
  T9183100 = 'Q11-GENHLTH_6A_2022'n
  T9183800 = 'Q11-GENHLTH_7F_1_2022'n
  T9183900 = 'Q11-GENHLTH_7F_2_2022'n
  T9299600 = 'FAMSIZE_2022'n
  T9299700 = 'TNFI_TRUNC_2022'n
  T9302300 = 'SMSARES_2022'n
  T9307900 = 'NUMCH22_2022'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx0f
  0='NO'
  1='YES'
;
value vx1f
  0-1978='0 TO 1978: < 1978'
  1979='1979'
  1980='1980'
  1981='1981'
  1982='1982'
  1983='1983'
  1984='1984'
  1985='1985'
  1986='1986'
  1987='1987'
  1988='1988'
  1989='1989'
  1990='1990'
  1991='1991'
  1992='1992'
  1993='1993'
  1994='1994'
  1995='1995'
  1996='1996'
  1997='1997'
  1998='1998'
  1999='1999'
  2000='2000'
  2001='2001'
  2002='2002'
  2003='2003'
  2004='2004'
  2005='2005'
  2006='2006'
  2007='2007'
  2008='2008'
  2009='2009'
  2010='2010'
  2011='2011'
  2012='2012'
  2013='2013'
  2014='2014'
  2015='2015'
  2016='2016'
  2017='2017'
  2018='2018'
  2019='2019'
  2020='2020'
  2021='2021'
  2022='2022'
  2023='2023'
  2024='2024'
  2025='2025'
;
value vx3f
  0='NONE'
  1='BLACK'
  2='CHINESE'
  3='ENGLISH'
  4='FILIPINO'
  5='FRENCH'
  6='GERMAN'
  7='GREEK'
  8='HAWAIIAN, P.I.'
  9='INDIAN-AMERICAN OR NATIVE AMERICAN'
  10='ASIAN INDIAN'
  11='IRISH'
  12='ITALIAN'
  13='JAPANESE'
  14='KOREAN'
  15='CUBAN'
  16='CHICANO'
  17='MEXICAN'
  18='MEXICAN-AMER'
  19='PUERTO RICAN'
  20='OTHER HISPANIC'
  21='OTHER SPANISH'
  22='POLISH'
  23='PORTUGUESE'
  24='RUSSIAN'
  25='SCOTTISH'
  26='VIETNAMESE'
  27='WELSH'
  28='OTHER'
  29='AMERICAN'
;
value vx4f
  1='CROSS MALE WHITE'
  2='CROSS MALE WH. POOR'
  3='CROSS MALE BLACK'
  4='CROSS MALE HISPANIC'
  5='CROSS FEMALE WHITE'
  6='CROSS FEMALE WH POOR'
  7='CROSS FEMALE BLACK'
  8='CROSS FEMALE HISPANIC'
  9='SUP MALE WH POOR'
  10='SUP MALE BLACK'
  11='SUP MALE HISPANIC'
  12='SUP FEM WH POOR'
  13='SUP FEMALE BLACK'
  14='SUP FEMALE HISPANIC'
  15='MIL MALE WHITE'
  16='MIL MALE BLACK'
  17='MIL MALE HISPANIC'
  18='MIL FEMALE WHITE'
  19='MIL FEMALE BLACK'
  20='MIL FEMALE HISPANIC'
;
value vx5f
  1='MALE'
  2='FEMALE'
;
value vx6f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx7f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx8f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx9f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx10f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx11f
  1='Lose weight'
  2='Gain weight'
  3='Stay about the same'
  4='Not trying to do anything'
;
value vx12f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx13f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx14f
  0='0'
  1-4='1 TO 4'
  5-9='5 TO 9'
  10-14='10 TO 14'
  15-19='15 TO 19'
  20-24='20 TO 24'
  25-29='25 TO 29'
  30-34='30 TO 34'
  35-39='35 TO 39'
  40-44='40 TO 44'
  45-49='45 TO 49'
  50-99999999='50 TO 99999999: 50+'
;
value vx15f
  1='Per day'
  2='Per week'
;
value vx16f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx17f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx18f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
;
value vx19f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx20f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx21f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx22f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx23f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx24f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx25f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx26f
  1='Lose weight'
  2='Gain weight'
  3='Stay about the same'
  4='Not trying to do anything'
;
value vx27f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx28f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx29f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15-999='15 TO 999: 15+'
;
value vx30f
  1='Per day'
  2='Per week'
;
value vx31f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx32f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx33f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx34f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx35f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx36f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx37f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx38f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx39f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx40f
  1='Lose weight'
  2='Gain weight'
  3='Stay about the same'
  4='Not trying to do anything'
;
value vx41f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx42f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx43f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15-999='15 TO 999: 15+'
;
value vx44f
  1='Per day'
  2='Per week'
;
value vx45f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx46f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx47f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx48f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx49f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx50f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx51f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx52f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx53f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx54f
  1='Lose weight'
  2='Gain weight'
  3='Stay about the same'
  4='Not trying to do anything'
;
value vx55f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx56f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx57f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15-999='15 TO 999: 15+'
;
value vx58f
  1='Per day'
  2='Per week'
;
value vx59f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx60f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx61f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx62f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx63f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx64f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx65f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx66f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx67f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx68f
  1='Lose weight'
  2='Gain weight'
  3='Stay about the same'
  4='Not trying to do anything'
;
value vx69f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx70f
  0='Don''t buy food'
  1='Always'
  2='Often'
  3='Sometimes'
  4='Rarely'
  5='Never'
;
value vx71f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15-999='15 TO 999: 15+'
;
value vx72f
  1='Per day'
  2='Per week'
;
value vx73f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx74f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx75f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx76f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx77f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx78f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx79f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx80f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx81f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx82f
  1='Lose weight'
  2='Gain weight'
  3='Stay about the same'
  4='Not trying to do anything'
;
value vx83f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15-99='15 TO 99: 15+'
;
value vx84f
  1='Per day'
  2='Per week'
;
value vx85f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx86f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx87f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx88f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx89f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx90f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx91f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx92f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx93f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx94f
  1='Lose weight'
  2='Gain weight'
  3='Stay about the same'
  4='Not trying to do anything'
;
value vx95f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15-100='15 TO 100: 15+'
;
value vx96f
  1='Per day'
  2='Per week'
;
value vx97f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx98f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx99f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx100f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format H0004900 vx0f.;
  format H0005001 vx1f.;
  format R0009600 vx3f.;
  format R0173600 vx4f.;
  format R0214800 vx5f.;
  format T1298000 vx6f.;
  format T1298100 vx7f.;
  format T1298200 vx8f.;
  format T1298300 vx9f.;
  format T1298400 vx10f.;
  format T2056800 vx11f.;
  format T2056900 vx12f.;
  format T2057000 vx13f.;
  format T2057700 vx14f.;
  format T2057800 vx15f.;
  format T2209900 vx16f.;
  format T2210000 vx17f.;
  format T2210800 vx18f.;
  format T2212300 vx19f.;
  format T2217800 vx20f.;
  format T2326500 vx21f.;
  format T2326600 vx22f.;
  format T2326700 vx23f.;
  format T2326800 vx24f.;
  format T2326900 vx25f.;
  format T3027200 vx26f.;
  format T3027300 vx27f.;
  format T3027400 vx28f.;
  format T3028100 vx29f.;
  format T3028200 vx30f.;
  format T3107700 vx31f.;
  format T3107800 vx32f.;
  format T3110200 vx33f.;
  format T3115800 vx34f.;
  format T3308700 vx35f.;
  format T3308800 vx36f.;
  format T3308900 vx37f.;
  format T3309000 vx38f.;
  format T3309100 vx39f.;
  format T3958000 vx40f.;
  format T3958100 vx41f.;
  format T3958200 vx42f.;
  format T3958900 vx43f.;
  format T3959000 vx44f.;
  format T4112200 vx45f.;
  format T4112300 vx46f.;
  format T4114700 vx47f.;
  format T4120300 vx48f.;
  format T4282800 vx49f.;
  format T4282900 vx50f.;
  format T4283000 vx51f.;
  format T4283100 vx52f.;
  format T4283200 vx53f.;
  format T4895700 vx54f.;
  format T4895800 vx55f.;
  format T4895900 vx56f.;
  format T4896600 vx57f.;
  format T4896700 vx58f.;
  format T5022500 vx59f.;
  format T5022600 vx60f.;
  format T5026000 vx61f.;
  format T5031500 vx62f.;
  format T5256900 vx63f.;
  format T5257000 vx64f.;
  format T5257100 vx65f.;
  format T5257200 vx66f.;
  format T5257300 vx67f.;
  format T5599700 vx68f.;
  format T5599800 vx69f.;
  format T5599900 vx70f.;
  format T5600600 vx71f.;
  format T5600700 vx72f.;
  format T5770700 vx73f.;
  format T5770800 vx74f.;
  format T5774100 vx75f.;
  format T5779700 vx76f.;
  format T8428300 vx77f.;
  format T8428400 vx78f.;
  format T8428500 vx79f.;
  format T8428600 vx80f.;
  format T8428700 vx81f.;
  format T8624900 vx82f.;
  format T8625300 vx83f.;
  format T8625400 vx84f.;
  format T8787800 vx85f.;
  format T8787900 vx86f.;
  format T8790500 vx87f.;
  format T8796100 vx88f.;
  format T8982400 vx89f.;
  format T8982500 vx90f.;
  format T8982600 vx91f.;
  format T8982700 vx92f.;
  format T8982800 vx93f.;
  format T9183100 vx94f.;
  format T9183800 vx95f.;
  format T9183900 vx96f.;
  format T9299600 vx97f.;
  format T9299700 vx98f.;
  format T9302300 vx99f.;
  format T9307900 vx100f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'H40-CHRC-2_XRND'n vx0f.;
  format 'H40-CHRC-2A~Y_XRND'n vx1f.;
  format 'FAM-30_1_1979'n vx3f.;
  format 'SAMPLE_ID_1979'n vx4f.;
  format 'SAMPLE_SEX_1979'n vx5f.;
  format 'OCCALL-EMP.01_2008'n vx6f.;
  format 'OCCALL-EMP.02_2008'n vx7f.;
  format 'OCCALL-EMP.03_2008'n vx8f.;
  format 'OCCALL-EMP.04_2008'n vx9f.;
  format 'OCCALL-EMP.05_2008'n vx10f.;
  format 'Q11-GENHLTH_6A_2008'n vx11f.;
  format 'Q11-GENHLTH_7A_2008'n vx12f.;
  format 'Q11-GENHLTH_7B_2008'n vx13f.;
  format 'Q11-GENHLTH_7F_1_2008'n vx14f.;
  format 'Q11-GENHLTH_7F_2_2008'n vx15f.;
  format 'FAMSIZE_2008'n vx16f.;
  format 'TNFI_TRUNC_2008'n vx17f.;
  format 'AGEATINT_2008'n vx18f.;
  format 'SMSARES_2008'n vx19f.;
  format 'NUMCH08_2008'n vx20f.;
  format 'OCCALL-EMP.01_2010'n vx21f.;
  format 'OCCALL-EMP.02_2010'n vx22f.;
  format 'OCCALL-EMP.03_2010'n vx23f.;
  format 'OCCALL-EMP.04_2010'n vx24f.;
  format 'OCCALL-EMP.05_2010'n vx25f.;
  format 'Q11-GENHLTH_6A_2010'n vx26f.;
  format 'Q11-GENHLTH_7A_2010'n vx27f.;
  format 'Q11-GENHLTH_7B_2010'n vx28f.;
  format 'Q11-GENHLTH_7F_1_2010'n vx29f.;
  format 'Q11-GENHLTH_7F_2_2010'n vx30f.;
  format 'FAMSIZE_2010'n vx31f.;
  format 'TNFI_TRUNC_2010'n vx32f.;
  format 'SMSARES_2010'n vx33f.;
  format 'NUMCH10_2010'n vx34f.;
  format 'OCCALL-EMP.01_2012'n vx35f.;
  format 'OCCALL-EMP.02_2012'n vx36f.;
  format 'OCCALL-EMP.03_2012'n vx37f.;
  format 'OCCALL-EMP.04_2012'n vx38f.;
  format 'OCCALL-EMP.05_2012'n vx39f.;
  format 'Q11-GENHLTH_6A_2012'n vx40f.;
  format 'Q11-GENHLTH_7A_2012'n vx41f.;
  format 'Q11-GENHLTH_7B_2012'n vx42f.;
  format 'Q11-GENHLTH_7F_1_2012'n vx43f.;
  format 'Q11-GENHLTH_7F_2_2012'n vx44f.;
  format 'FAMSIZE_2012'n vx45f.;
  format 'TNFI_TRUNC_2012'n vx46f.;
  format 'SMSARES_2012'n vx47f.;
  format 'NUMCH12_2012'n vx48f.;
  format 'OCCALL-EMP.01_2014'n vx49f.;
  format 'OCCALL-EMP.02_2014'n vx50f.;
  format 'OCCALL-EMP.03_2014'n vx51f.;
  format 'OCCALL-EMP.04_2014'n vx52f.;
  format 'OCCALL-EMP.05_2014'n vx53f.;
  format 'Q11-GENHLTH_6A_2014'n vx54f.;
  format 'Q11-GENHLTH_7A_2014'n vx55f.;
  format 'Q11-GENHLTH_7B_2014'n vx56f.;
  format 'Q11-GENHLTH_7F_1_2014'n vx57f.;
  format 'Q11-GENHLTH_7F_2_2014'n vx58f.;
  format 'FAMSIZE_2014'n vx59f.;
  format 'TNFI_TRUNC_2014'n vx60f.;
  format 'SMSARES_2014'n vx61f.;
  format 'NUMCH14_2014'n vx62f.;
  format 'OCCALL-EMP.01_2016'n vx63f.;
  format 'OCCALL-EMP.02_2016'n vx64f.;
  format 'OCCALL-EMP.03_2016'n vx65f.;
  format 'OCCALL-EMP.04_2016'n vx66f.;
  format 'OCCALL-EMP.05_2016'n vx67f.;
  format 'Q11-GENHLTH_6A_2016'n vx68f.;
  format 'Q11-GENHLTH_7A_2016'n vx69f.;
  format 'Q11-GENHLTH_7B_2016'n vx70f.;
  format 'Q11-GENHLTH_7F_1_2016'n vx71f.;
  format 'Q11-GENHLTH_7F_2_2016'n vx72f.;
  format 'FAMSIZE_2016'n vx73f.;
  format 'TNFI_TRUNC_2016'n vx74f.;
  format 'SMSARES_2016'n vx75f.;
  format 'NUMCH16_2016'n vx76f.;
  format 'OCCALL-EMP.01_2020'n vx77f.;
  format 'OCCALL-EMP.02_2020'n vx78f.;
  format 'OCCALL-EMP.03_2020'n vx79f.;
  format 'OCCALL-EMP.04_2020'n vx80f.;
  format 'OCCALL-EMP.05_2020'n vx81f.;
  format 'Q11-GENHLTH_6A_2020'n vx82f.;
  format 'Q11-GENHLTH_7F_1_2020'n vx83f.;
  format 'Q11-GENHLTH_7F_2_2020'n vx84f.;
  format 'FAMSIZE_2020'n vx85f.;
  format 'TNFI_TRUNC_2020'n vx86f.;
  format 'SMSARES_2020'n vx87f.;
  format 'NUMCH20_2020'n vx88f.;
  format 'OCCALL-EMP.01_2022'n vx89f.;
  format 'OCCALL-EMP.02_2022'n vx90f.;
  format 'OCCALL-EMP.03_2022'n vx91f.;
  format 'OCCALL-EMP.04_2022'n vx92f.;
  format 'OCCALL-EMP.05_2022'n vx93f.;
  format 'Q11-GENHLTH_6A_2022'n vx94f.;
  format 'Q11-GENHLTH_7F_1_2022'n vx95f.;
  format 'Q11-GENHLTH_7F_2_2022'n vx96f.;
  format 'FAMSIZE_2022'n vx97f.;
  format 'TNFI_TRUNC_2022'n vx98f.;
  format 'SMSARES_2022'n vx99f.;
  format 'NUMCH22_2022'n vx100f.;
run;
*/