file handle pcdat/name='NLSY79_0919_kai.dat' /lrecl=414.
data list file pcdat free /
  H0004900 (F2)
  H0005001 (F4)
  R0000100 (F5)
  R0009600 (F2)
  R0173600 (F2)
  R0214800 (F2)
  T1298000 (F4)
  T1298100 (F4)
  T1298200 (F4)
  T1298300 (F4)
  T1298400 (F4)
  T2056800 (F2)
  T2056900 (F2)
  T2057000 (F2)
  T2057700 (F3)
  T2057800 (F2)
  T2209900 (F2)
  T2210000 (F6)
  T2210800 (F2)
  T2212300 (F2)
  T2217800 (F2)
  T2326500 (F4)
  T2326600 (F4)
  T2326700 (F4)
  T2326800 (F4)
  T2326900 (F4)
  T3027200 (F2)
  T3027300 (F2)
  T3027400 (F2)
  T3028100 (F3)
  T3028200 (F2)
  T3107700 (F2)
  T3107800 (F6)
  T3110200 (F2)
  T3115800 (F2)
  T3308700 (F4)
  T3308800 (F4)
  T3308900 (F4)
  T3309000 (F4)
  T3309100 (F4)
  T3958000 (F2)
  T3958100 (F2)
  T3958200 (F2)
  T3958900 (F3)
  T3959000 (F2)
  T4112200 (F2)
  T4112300 (F6)
  T4114700 (F2)
  T4120300 (F2)
  T4282800 (F4)
  T4282900 (F4)
  T4283000 (F4)
  T4283100 (F4)
  T4283200 (F4)
  T4895700 (F2)
  T4895800 (F2)
  T4895900 (F2)
  T4896600 (F3)
  T4896700 (F2)
  T5022500 (F2)
  T5022600 (F6)
  T5026000 (F2)
  T5031500 (F2)
  T5256900 (F4)
  T5257000 (F4)
  T5257100 (F4)
  T5257200 (F4)
  T5257300 (F4)
  T5599700 (F2)
  T5599800 (F2)
  T5599900 (F2)
  T5600600 (F3)
  T5600700 (F2)
  T5770700 (F2)
  T5770800 (F6)
  T5774100 (F2)
  T5779700 (F2)
  T8428300 (F4)
  T8428400 (F4)
  T8428500 (F4)
  T8428600 (F4)
  T8428700 (F4)
  T8624900 (F2)
  T8625300 (F2)
  T8625400 (F2)
  T8787800 (F2)
  T8787900 (F6)
  T8790500 (F2)
  T8796100 (F2)
  T8982400 (F4)
  T8982500 (F4)
  T8982600 (F4)
  T8982700 (F4)
  T8982800 (F4)
  T9183100 (F2)
  T9183800 (F3)
  T9183900 (F2)
  T9299600 (F2)
  T9299700 (F6)
  T9302300 (F2)
  T9307900 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  H0004900  "CCR-DR DIAGNOSED DIABETES? XRND"
  H0005001  "CCR-DATE DIABETES DIAGNOSED XRND"
  R0000100  "ID# (1-12686) 79"
  R0009600  "1ST/ONLY RACL/ETHNIC ORIGIN 79"
  R0173600  "SAMPLE ID  79 INT"
  R0214800  "SEX OF R 79"
  T1298000  "OCCUPATION (2000 CODES) ALL JOB L1 2008"
  T1298100  "OCCUPATION (2000 CODES) ALL JOB L2 2008"
  T1298200  "OCCUPATION (2000 CODES) ALL JOB L3 2008"
  T1298300  "OCCUPATION (2000 CODES) ALL JOB L4 2008"
  T1298400  "OCCUPATION (2000 CODES) ALL JOB L5 2008"
  T2056800  "R TRYING TO LOSE OR GAIN WEIGHT 2008"
  T2056900  "READ NUTRITIONAL INFO ON FOOD 2008"
  T2057000  "READ INGREDIENTS ON FOOD 2008"
  T2057700  "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2008"
  T2057800  "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2008"
  T2209900  "FAMILY SIZE 2008"
  T2210000  "TOTAL NET FAMILY INCOME 2008"
  T2210800  "AGE AT INTERVIEW DATE 2008"
  T2212300  "RS RESIDENCE IN SMSA 2008"
  T2217800  "NUM BIO/STEP/ADPT CHILDREN IN HH 2008"
  T2326500  "OCCUPATION (2000 CODES) ALL JOB L1 2010"
  T2326600  "OCCUPATION (2000 CODES) ALL JOB L2 2010"
  T2326700  "OCCUPATION (2000 CODES) ALL JOB L3 2010"
  T2326800  "OCCUPATION (2000 CODES) ALL JOB L4 2010"
  T2326900  "OCCUPATION (2000 CODES) ALL JOB L5 2010"
  T3027200  "R TRYING TO LOSE OR GAIN WEIGHT 2010"
  T3027300  "READ NUTRITIONAL INFO ON FOOD 2010"
  T3027400  "READ INGREDIENTS ON FOOD 2010"
  T3028100  "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2010"
  T3028200  "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2010"
  T3107700  "FAMILY SIZE 2010"
  T3107800  "TOTAL NET FAMILY INCOME 2010"
  T3110200  "RS RESIDENCE IN SMSA 2010"
  T3115800  "NUM BIO/STEP/ADPT CHILDREN IN HH 2010"
  T3308700  "OCCUPATION (2000 CODES) ALL JOB L1 2012"
  T3308800  "OCCUPATION (2000 CODES) ALL JOB L2 2012"
  T3308900  "OCCUPATION (2000 CODES) ALL JOB L3 2012"
  T3309000  "OCCUPATION (2000 CODES) ALL JOB L4 2012"
  T3309100  "OCCUPATION (2000 CODES) ALL JOB L5 2012"
  T3958000  "R TRYING TO LOSE OR GAIN WEIGHT 2012"
  T3958100  "READ NUTRITIONAL INFO ON FOOD 2012"
  T3958200  "READ INGREDIENTS ON FOOD 2012"
  T3958900  "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2012"
  T3959000  "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2012"
  T4112200  "FAMILY SIZE 2012"
  T4112300  "TOTAL NET FAMILY INCOME 2012"
  T4114700  "RS RESIDENCE IN SMSA 2012"
  T4120300  "NUM BIO/STEP/ADPT CHILDREN IN HH 2012"
  T4282800  "OCCUPATION (2000 CODES) ALL JOB L1 2014"
  T4282900  "OCCUPATION (2000 CODES) ALL JOB L2 2014"
  T4283000  "OCCUPATION (2000 CODES) ALL JOB L3 2014"
  T4283100  "OCCUPATION (2000 CODES) ALL JOB L4 2014"
  T4283200  "OCCUPATION (2000 CODES) ALL JOB L5 2014"
  T4895700  "R TRYING TO LOSE OR GAIN WEIGHT 2014"
  T4895800  "READ NUTRITIONAL INFO ON FOOD 2014"
  T4895900  "READ INGREDIENTS ON FOOD 2014"
  T4896600  "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2014"
  T4896700  "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2014"
  T5022500  "FAMILY SIZE 2014"
  T5022600  "TOTAL NET FAMILY INCOME 2014"
  T5026000  "RS RESIDENCE IN SMSA 2014"
  T5031500  "NUM BIO/STEP/ADPT CHILDREN IN HH 2014"
  T5256900  "OCCUPATION (2000 CODES) ALL JOB L1 2016"
  T5257000  "OCCUPATION (2000 CODES) ALL JOB L2 2016"
  T5257100  "OCCUPATION (2000 CODES) ALL JOB L3 2016"
  T5257200  "OCCUPATION (2000 CODES) ALL JOB L4 2016"
  T5257300  "OCCUPATION (2000 CODES) ALL JOB L5 2016"
  T5599700  "R TRYING TO LOSE OR GAIN WEIGHT 2016"
  T5599800  "READ NUTRITIONAL INFO ON FOOD 2016"
  T5599900  "READ INGREDIENTS ON FOOD 2016"
  T5600600  "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2016"
  T5600700  "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2016"
  T5770700  "FAMILY SIZE 2016"
  T5770800  "TOTAL NET FAMILY INCOME 2016"
  T5774100  "RS RESIDENCE IN SMSA 2016"
  T5779700  "NUM BIO/STEP/ADPT CHILDREN IN HH 2016"
  T8428300  "OCCUPATION (2000 CODES) ALL JOB L1 2020"
  T8428400  "OCCUPATION (2000 CODES) ALL JOB L2 2020"
  T8428500  "OCCUPATION (2000 CODES) ALL JOB L3 2020"
  T8428600  "OCCUPATION (2000 CODES) ALL JOB L4 2020"
  T8428700  "OCCUPATION (2000 CODES) ALL JOB L5 2020"
  T8624900  "R TRYING TO LOSE OR GAIN WEIGHT 2020"
  T8625300  "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2020"
  T8625400  "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2020"
  T8787800  "FAMILY SIZE 2020"
  T8787900  "TOTAL NET FAMILY INCOME 2020"
  T8790500  "RS RESIDENCE IN SMSA 2020"
  T8796100  "NUM BIO/STEP/ADPT CHILDREN IN HH 2020"
  T8982400  "OCCUPATION (2000 CODES) ALL JOB L1 2022"
  T8982500  "OCCUPATION (2000 CODES) ALL JOB L2 2022"
  T8982600  "OCCUPATION (2000 CODES) ALL JOB L3 2022"
  T8982700  "OCCUPATION (2000 CODES) ALL JOB L4 2022"
  T8982800  "OCCUPATION (2000 CODES) ALL JOB L5 2022"
  T9183100  "R TRYING TO LOSE OR GAIN WEIGHT 2022"
  T9183800  "TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2022"
  T9183900  "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2022"
  T9299600  "FAMILY SIZE 2022"
  T9299700  "TOTAL NET FAMILY INCOME 2022"
  T9302300  "RS RESIDENCE IN SMSA 2022"
  T9307900  "NUM BIO/STEP/ADPT CHILDREN IN HH 2022"
.

* Recode continuous values. 
* recode 
    / 
 H0005001 
    (0 thru 1978 eq 0)
    (1979 thru 1979 eq 1979)
    (1980 thru 1980 eq 1980)
    (1981 thru 1981 eq 1981)
    (1982 thru 1982 eq 1982)
    (1983 thru 1983 eq 1983)
    (1984 thru 1984 eq 1984)
    (1985 thru 1985 eq 1985)
    (1986 thru 1986 eq 1986)
    (1987 thru 1987 eq 1987)
    (1988 thru 1988 eq 1988)
    (1989 thru 1989 eq 1989)
    (1990 thru 1990 eq 1990)
    (1991 thru 1991 eq 1991)
    (1992 thru 1992 eq 1992)
    (1993 thru 1993 eq 1993)
    (1994 thru 1994 eq 1994)
    (1995 thru 1995 eq 1995)
    (1996 thru 1996 eq 1996)
    (1997 thru 1997 eq 1997)
    (1998 thru 1998 eq 1998)
    (1999 thru 1999 eq 1999)
    (2000 thru 2000 eq 2000)
    (2001 thru 2001 eq 2001)
    (2002 thru 2002 eq 2002)
    (2003 thru 2003 eq 2003)
    (2004 thru 2004 eq 2004)
    (2005 thru 2005 eq 2005)
    (2006 thru 2006 eq 2006)
    (2007 thru 2007 eq 2007)
    (2008 thru 2008 eq 2008)
    (2009 thru 2009 eq 2009)
    (2010 thru 2010 eq 2010)
    (2011 thru 2011 eq 2011)
    (2012 thru 2012 eq 2012)
    (2013 thru 2013 eq 2013)
    (2014 thru 2014 eq 2014)
    (2015 thru 2015 eq 2015)
    (2016 thru 2016 eq 2016)
    (2017 thru 2017 eq 2017)
    (2018 thru 2018 eq 2018)
    (2019 thru 2019 eq 2019)
    (2020 thru 2020 eq 2020)
    (2021 thru 2021 eq 2021)
    (2022 thru 2022 eq 2022)
    (2023 thru 2023 eq 2023)
    (2024 thru 2024 eq 2024)
    (2025 thru 2025 eq 2025)
    / 
 T1298000 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T1298100 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T1298200 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T1298300 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T1298400 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T2057700 
    (0 thru 0 eq 0)
    (1 thru 4 eq 1)
    (5 thru 9 eq 5)
    (10 thru 14 eq 10)
    (15 thru 19 eq 15)
    (20 thru 24 eq 20)
    (25 thru 29 eq 25)
    (30 thru 34 eq 30)
    (35 thru 39 eq 35)
    (40 thru 44 eq 40)
    (45 thru 49 eq 45)
    (50 thru 99999999 eq 50)
    / 
 T2209900 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T2210000 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T2217800 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T2326500 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T2326600 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T2326700 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T2326800 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T2326900 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T3028100 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 999 eq 15)
    / 
 T3107700 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T3107800 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T3115800 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T3308700 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T3308800 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T3308900 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T3309000 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T3309100 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T3958900 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 999 eq 15)
    / 
 T4112200 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T4112300 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T4120300 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T4282800 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4282900 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4283000 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4283100 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4283200 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4896600 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 999 eq 15)
    / 
 T5022500 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T5022600 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T5031500 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T5256900 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T5257000 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T5257100 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T5257200 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T5257300 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T5600600 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 999 eq 15)
    / 
 T5770700 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T5770800 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T5779700 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T8428300 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8428400 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8428500 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8428600 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8428700 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8625300 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 99 eq 15)
    / 
 T8787800 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T8787900 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T8796100 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T8982400 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8982500 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8982600 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8982700 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T8982800 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T9183800 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 100 eq 15)
    / 
 T9299600 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T9299700 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T9307900 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
.

* value labels
 H0004900
    0 "NO"
    1 "YES"
    /
 H0005001
    0 "0 TO 1978: < 1978"
    1979 "1979"
    1980 "1980"
    1981 "1981"
    1982 "1982"
    1983 "1983"
    1984 "1984"
    1985 "1985"
    1986 "1986"
    1987 "1987"
    1988 "1988"
    1989 "1989"
    1990 "1990"
    1991 "1991"
    1992 "1992"
    1993 "1993"
    1994 "1994"
    1995 "1995"
    1996 "1996"
    1997 "1997"
    1998 "1998"
    1999 "1999"
    2000 "2000"
    2001 "2001"
    2002 "2002"
    2003 "2003"
    2004 "2004"
    2005 "2005"
    2006 "2006"
    2007 "2007"
    2008 "2008"
    2009 "2009"
    2010 "2010"
    2011 "2011"
    2012 "2012"
    2013 "2013"
    2014 "2014"
    2015 "2015"
    2016 "2016"
    2017 "2017"
    2018 "2018"
    2019 "2019"
    2020 "2020"
    2021 "2021"
    2022 "2022"
    2023 "2023"
    2024 "2024"
    2025 "2025"
    /
 R0009600
    0 "NONE"
    1 "BLACK"
    2 "CHINESE"
    3 "ENGLISH"
    4 "FILIPINO"
    5 "FRENCH"
    6 "GERMAN"
    7 "GREEK"
    8 "HAWAIIAN, P.I."
    9 "INDIAN-AMERICAN OR NATIVE AMERICAN"
    10 "ASIAN INDIAN"
    11 "IRISH"
    12 "ITALIAN"
    13 "JAPANESE"
    14 "KOREAN"
    15 "CUBAN"
    16 "CHICANO"
    17 "MEXICAN"
    18 "MEXICAN-AMER"
    19 "PUERTO RICAN"
    20 "OTHER HISPANIC"
    21 "OTHER SPANISH"
    22 "POLISH"
    23 "PORTUGUESE"
    24 "RUSSIAN"
    25 "SCOTTISH"
    26 "VIETNAMESE"
    27 "WELSH"
    28 "OTHER"
    29 "AMERICAN"
    /
 R0173600
    1 "CROSS MALE WHITE"
    2 "CROSS MALE WH. POOR"
    3 "CROSS MALE BLACK"
    4 "CROSS MALE HISPANIC"
    5 "CROSS FEMALE WHITE"
    6 "CROSS FEMALE WH POOR"
    7 "CROSS FEMALE BLACK"
    8 "CROSS FEMALE HISPANIC"
    9 "SUP MALE WH POOR"
    10 "SUP MALE BLACK"
    11 "SUP MALE HISPANIC"
    12 "SUP FEM WH POOR"
    13 "SUP FEMALE BLACK"
    14 "SUP FEMALE HISPANIC"
    15 "MIL MALE WHITE"
    16 "MIL MALE BLACK"
    17 "MIL MALE HISPANIC"
    18 "MIL FEMALE WHITE"
    19 "MIL FEMALE BLACK"
    20 "MIL FEMALE HISPANIC"
    /
 R0214800
    1 "MALE"
    2 "FEMALE"
    /
 T1298000
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T1298100
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T1298200
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T1298300
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T1298400
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T2056800
    1 "Lose weight"
    2 "Gain weight"
    3 "Stay about the same"
    4 "Not trying to do anything"
    /
 T2056900
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T2057000
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T2057700
    0 "0"
    1 "1 TO 4"
    5 "5 TO 9"
    10 "10 TO 14"
    15 "15 TO 19"
    20 "20 TO 24"
    25 "25 TO 29"
    30 "30 TO 34"
    35 "35 TO 39"
    40 "40 TO 44"
    45 "45 TO 49"
    50 "50 TO 99999999: 50+"
    /
 T2057800
    1 "Per day"
    2 "Per week"
    /
 T2209900
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T2210000
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T2210800
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    /
 T2212300
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T2217800
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T2326500
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T2326600
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T2326700
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T2326800
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T2326900
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T3027200
    1 "Lose weight"
    2 "Gain weight"
    3 "Stay about the same"
    4 "Not trying to do anything"
    /
 T3027300
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T3027400
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T3028100
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15 TO 999: 15+"
    /
 T3028200
    1 "Per day"
    2 "Per week"
    /
 T3107700
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T3107800
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T3110200
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T3115800
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T3308700
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T3308800
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T3308900
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T3309000
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T3309100
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T3958000
    1 "Lose weight"
    2 "Gain weight"
    3 "Stay about the same"
    4 "Not trying to do anything"
    /
 T3958100
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T3958200
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T3958900
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15 TO 999: 15+"
    /
 T3959000
    1 "Per day"
    2 "Per week"
    /
 T4112200
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T4112300
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T4114700
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T4120300
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T4282800
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4282900
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4283000
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4283100
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4283200
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4895700
    1 "Lose weight"
    2 "Gain weight"
    3 "Stay about the same"
    4 "Not trying to do anything"
    /
 T4895800
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T4895900
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T4896600
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15 TO 999: 15+"
    /
 T4896700
    1 "Per day"
    2 "Per week"
    /
 T5022500
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T5022600
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T5026000
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T5031500
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T5256900
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T5257000
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T5257100
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T5257200
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T5257300
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T5599700
    1 "Lose weight"
    2 "Gain weight"
    3 "Stay about the same"
    4 "Not trying to do anything"
    /
 T5599800
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T5599900
    0 "Don't buy food"
    1 "Always"
    2 "Often"
    3 "Sometimes"
    4 "Rarely"
    5 "Never"
    /
 T5600600
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15 TO 999: 15+"
    /
 T5600700
    1 "Per day"
    2 "Per week"
    /
 T5770700
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T5770800
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T5774100
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T5779700
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T8428300
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8428400
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8428500
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8428600
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8428700
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8624900
    1 "Lose weight"
    2 "Gain weight"
    3 "Stay about the same"
    4 "Not trying to do anything"
    /
 T8625300
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15 TO 99: 15+"
    /
 T8625400
    1 "Per day"
    2 "Per week"
    /
 T8787800
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T8787900
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T8790500
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T8796100
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T8982400
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8982500
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8982600
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8982700
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T8982800
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T9183100
    1 "Lose weight"
    2 "Gain weight"
    3 "Stay about the same"
    4 "Not trying to do anything"
    /
 T9183800
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15 TO 100: 15+"
    /
 T9183900
    1 "Per day"
    2 "Per week"
    /
 T9299600
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T9299700
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T9302300
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T9307900
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (H0004900 = H40_CHRC_2_XRND)   /* H40-CHRC-2 */
  (H0005001 = H40_CHRC_2A_Y_XRND)   /* H40-CHRC-2A~Y */
  (R0000100 = CASEID_1979) 
  (R0009600 = FAM_30_1_1979)   /* FAM-30_1 */
  (R0173600 = SAMPLE_ID_1979) 
  (R0214800 = SAMPLE_SEX_1979) 
  (T1298000 = OCCALL_EMP_01_2008)   /* OCCALL-EMP.01 */
  (T1298100 = OCCALL_EMP_02_2008)   /* OCCALL-EMP.02 */
  (T1298200 = OCCALL_EMP_03_2008)   /* OCCALL-EMP.03 */
  (T1298300 = OCCALL_EMP_04_2008)   /* OCCALL-EMP.04 */
  (T1298400 = OCCALL_EMP_05_2008)   /* OCCALL-EMP.05 */
  (T2056800 = Q11_GENHLTH_6A_2008)   /* Q11-GENHLTH_6A */
  (T2056900 = Q11_GENHLTH_7A_2008)   /* Q11-GENHLTH_7A */
  (T2057000 = Q11_GENHLTH_7B_2008)   /* Q11-GENHLTH_7B */
  (T2057700 = Q11_GENHLTH_7F_1_2008)   /* Q11-GENHLTH_7F_1 */
  (T2057800 = Q11_GENHLTH_7F_2_2008)   /* Q11-GENHLTH_7F_2 */
  (T2209900 = FAMSIZE_2008) 
  (T2210000 = TNFI_TRUNC_2008) 
  (T2210800 = AGEATINT_2008) 
  (T2212300 = SMSARES_2008) 
  (T2217800 = NUMCH08_2008) 
  (T2326500 = OCCALL_EMP_01_2010)   /* OCCALL-EMP.01 */
  (T2326600 = OCCALL_EMP_02_2010)   /* OCCALL-EMP.02 */
  (T2326700 = OCCALL_EMP_03_2010)   /* OCCALL-EMP.03 */
  (T2326800 = OCCALL_EMP_04_2010)   /* OCCALL-EMP.04 */
  (T2326900 = OCCALL_EMP_05_2010)   /* OCCALL-EMP.05 */
  (T3027200 = Q11_GENHLTH_6A_2010)   /* Q11-GENHLTH_6A */
  (T3027300 = Q11_GENHLTH_7A_2010)   /* Q11-GENHLTH_7A */
  (T3027400 = Q11_GENHLTH_7B_2010)   /* Q11-GENHLTH_7B */
  (T3028100 = Q11_GENHLTH_7F_1_2010)   /* Q11-GENHLTH_7F_1 */
  (T3028200 = Q11_GENHLTH_7F_2_2010)   /* Q11-GENHLTH_7F_2 */
  (T3107700 = FAMSIZE_2010) 
  (T3107800 = TNFI_TRUNC_2010) 
  (T3110200 = SMSARES_2010) 
  (T3115800 = NUMCH10_2010) 
  (T3308700 = OCCALL_EMP_01_2012)   /* OCCALL-EMP.01 */
  (T3308800 = OCCALL_EMP_02_2012)   /* OCCALL-EMP.02 */
  (T3308900 = OCCALL_EMP_03_2012)   /* OCCALL-EMP.03 */
  (T3309000 = OCCALL_EMP_04_2012)   /* OCCALL-EMP.04 */
  (T3309100 = OCCALL_EMP_05_2012)   /* OCCALL-EMP.05 */
  (T3958000 = Q11_GENHLTH_6A_2012)   /* Q11-GENHLTH_6A */
  (T3958100 = Q11_GENHLTH_7A_2012)   /* Q11-GENHLTH_7A */
  (T3958200 = Q11_GENHLTH_7B_2012)   /* Q11-GENHLTH_7B */
  (T3958900 = Q11_GENHLTH_7F_1_2012)   /* Q11-GENHLTH_7F_1 */
  (T3959000 = Q11_GENHLTH_7F_2_2012)   /* Q11-GENHLTH_7F_2 */
  (T4112200 = FAMSIZE_2012) 
  (T4112300 = TNFI_TRUNC_2012) 
  (T4114700 = SMSARES_2012) 
  (T4120300 = NUMCH12_2012) 
  (T4282800 = OCCALL_EMP_01_2014)   /* OCCALL-EMP.01 */
  (T4282900 = OCCALL_EMP_02_2014)   /* OCCALL-EMP.02 */
  (T4283000 = OCCALL_EMP_03_2014)   /* OCCALL-EMP.03 */
  (T4283100 = OCCALL_EMP_04_2014)   /* OCCALL-EMP.04 */
  (T4283200 = OCCALL_EMP_05_2014)   /* OCCALL-EMP.05 */
  (T4895700 = Q11_GENHLTH_6A_2014)   /* Q11-GENHLTH_6A */
  (T4895800 = Q11_GENHLTH_7A_2014)   /* Q11-GENHLTH_7A */
  (T4895900 = Q11_GENHLTH_7B_2014)   /* Q11-GENHLTH_7B */
  (T4896600 = Q11_GENHLTH_7F_1_2014)   /* Q11-GENHLTH_7F_1 */
  (T4896700 = Q11_GENHLTH_7F_2_2014)   /* Q11-GENHLTH_7F_2 */
  (T5022500 = FAMSIZE_2014) 
  (T5022600 = TNFI_TRUNC_2014) 
  (T5026000 = SMSARES_2014) 
  (T5031500 = NUMCH14_2014) 
  (T5256900 = OCCALL_EMP_01_2016)   /* OCCALL-EMP.01 */
  (T5257000 = OCCALL_EMP_02_2016)   /* OCCALL-EMP.02 */
  (T5257100 = OCCALL_EMP_03_2016)   /* OCCALL-EMP.03 */
  (T5257200 = OCCALL_EMP_04_2016)   /* OCCALL-EMP.04 */
  (T5257300 = OCCALL_EMP_05_2016)   /* OCCALL-EMP.05 */
  (T5599700 = Q11_GENHLTH_6A_2016)   /* Q11-GENHLTH_6A */
  (T5599800 = Q11_GENHLTH_7A_2016)   /* Q11-GENHLTH_7A */
  (T5599900 = Q11_GENHLTH_7B_2016)   /* Q11-GENHLTH_7B */
  (T5600600 = Q11_GENHLTH_7F_1_2016)   /* Q11-GENHLTH_7F_1 */
  (T5600700 = Q11_GENHLTH_7F_2_2016)   /* Q11-GENHLTH_7F_2 */
  (T5770700 = FAMSIZE_2016) 
  (T5770800 = TNFI_TRUNC_2016) 
  (T5774100 = SMSARES_2016) 
  (T5779700 = NUMCH16_2016) 
  (T8428300 = OCCALL_EMP_01_2020)   /* OCCALL-EMP.01 */
  (T8428400 = OCCALL_EMP_02_2020)   /* OCCALL-EMP.02 */
  (T8428500 = OCCALL_EMP_03_2020)   /* OCCALL-EMP.03 */
  (T8428600 = OCCALL_EMP_04_2020)   /* OCCALL-EMP.04 */
  (T8428700 = OCCALL_EMP_05_2020)   /* OCCALL-EMP.05 */
  (T8624900 = Q11_GENHLTH_6A_2020)   /* Q11-GENHLTH_6A */
  (T8625300 = Q11_GENHLTH_7F_1_2020)   /* Q11-GENHLTH_7F_1 */
  (T8625400 = Q11_GENHLTH_7F_2_2020)   /* Q11-GENHLTH_7F_2 */
  (T8787800 = FAMSIZE_2020) 
  (T8787900 = TNFI_TRUNC_2020) 
  (T8790500 = SMSARES_2020) 
  (T8796100 = NUMCH20_2020) 
  (T8982400 = OCCALL_EMP_01_2022)   /* OCCALL-EMP.01 */
  (T8982500 = OCCALL_EMP_02_2022)   /* OCCALL-EMP.02 */
  (T8982600 = OCCALL_EMP_03_2022)   /* OCCALL-EMP.03 */
  (T8982700 = OCCALL_EMP_04_2022)   /* OCCALL-EMP.04 */
  (T8982800 = OCCALL_EMP_05_2022)   /* OCCALL-EMP.05 */
  (T9183100 = Q11_GENHLTH_6A_2022)   /* Q11-GENHLTH_6A */
  (T9183800 = Q11_GENHLTH_7F_1_2022)   /* Q11-GENHLTH_7F_1 */
  (T9183900 = Q11_GENHLTH_7F_2_2022)   /* Q11-GENHLTH_7F_2 */
  (T9299600 = FAMSIZE_2022) 
  (T9299700 = TNFI_TRUNC_2022) 
  (T9302300 = SMSARES_2022) 
  (T9307900 = NUMCH22_2022) 
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables.
*freq var=H0004900, 
  H0005001, 
  R0000100, 
  R0009600, 
  R0173600, 
  R0214800, 
  T1298000, 
  T1298100, 
  T1298200, 
  T1298300, 
  T1298400, 
  T2056800, 
  T2056900, 
  T2057000, 
  T2057700, 
  T2057800, 
  T2209900, 
  T2210000, 
  T2210800, 
  T2212300, 
  T2217800, 
  T2326500, 
  T2326600, 
  T2326700, 
  T2326800, 
  T2326900, 
  T3027200, 
  T3027300, 
  T3027400, 
  T3028100, 
  T3028200, 
  T3107700, 
  T3107800, 
  T3110200, 
  T3115800, 
  T3308700, 
  T3308800, 
  T3308900, 
  T3309000, 
  T3309100, 
  T3958000, 
  T3958100, 
  T3958200, 
  T3958900, 
  T3959000, 
  T4112200, 
  T4112300, 
  T4114700, 
  T4120300, 
  T4282800, 
  T4282900, 
  T4283000, 
  T4283100, 
  T4283200, 
  T4895700, 
  T4895800, 
  T4895900, 
  T4896600, 
  T4896700, 
  T5022500, 
  T5022600, 
  T5026000, 
  T5031500, 
  T5256900, 
  T5257000, 
  T5257100, 
  T5257200, 
  T5257300, 
  T5599700, 
  T5599800, 
  T5599900, 
  T5600600, 
  T5600700, 
  T5770700, 
  T5770800, 
  T5774100, 
  T5779700, 
  T8428300, 
  T8428400, 
  T8428500, 
  T8428600, 
  T8428700, 
  T8624900, 
  T8625300, 
  T8625400, 
  T8787800, 
  T8787900, 
  T8790500, 
  T8796100, 
  T8982400, 
  T8982500, 
  T8982600, 
  T8982700, 
  T8982800, 
  T9183100, 
  T9183800, 
  T9183900, 
  T9299600, 
  T9299700, 
  T9302300, 
  T9307900.

*--- Tabulations using qname variables.
*freq var=H40_CHRC_2_XRND, 
  H40_CHRC_2A_Y_XRND, 
  CASEID_1979, 
  FAM_30_1_1979, 
  SAMPLE_ID_1979, 
  SAMPLE_SEX_1979, 
  OCCALL_EMP_01_2008, 
  OCCALL_EMP_02_2008, 
  OCCALL_EMP_03_2008, 
  OCCALL_EMP_04_2008, 
  OCCALL_EMP_05_2008, 
  Q11_GENHLTH_6A_2008, 
  Q11_GENHLTH_7A_2008, 
  Q11_GENHLTH_7B_2008, 
  Q11_GENHLTH_7F_1_2008, 
  Q11_GENHLTH_7F_2_2008, 
  FAMSIZE_2008, 
  TNFI_TRUNC_2008, 
  AGEATINT_2008, 
  SMSARES_2008, 
  NUMCH08_2008, 
  OCCALL_EMP_01_2010, 
  OCCALL_EMP_02_2010, 
  OCCALL_EMP_03_2010, 
  OCCALL_EMP_04_2010, 
  OCCALL_EMP_05_2010, 
  Q11_GENHLTH_6A_2010, 
  Q11_GENHLTH_7A_2010, 
  Q11_GENHLTH_7B_2010, 
  Q11_GENHLTH_7F_1_2010, 
  Q11_GENHLTH_7F_2_2010, 
  FAMSIZE_2010, 
  TNFI_TRUNC_2010, 
  SMSARES_2010, 
  NUMCH10_2010, 
  OCCALL_EMP_01_2012, 
  OCCALL_EMP_02_2012, 
  OCCALL_EMP_03_2012, 
  OCCALL_EMP_04_2012, 
  OCCALL_EMP_05_2012, 
  Q11_GENHLTH_6A_2012, 
  Q11_GENHLTH_7A_2012, 
  Q11_GENHLTH_7B_2012, 
  Q11_GENHLTH_7F_1_2012, 
  Q11_GENHLTH_7F_2_2012, 
  FAMSIZE_2012, 
  TNFI_TRUNC_2012, 
  SMSARES_2012, 
  NUMCH12_2012, 
  OCCALL_EMP_01_2014, 
  OCCALL_EMP_02_2014, 
  OCCALL_EMP_03_2014, 
  OCCALL_EMP_04_2014, 
  OCCALL_EMP_05_2014, 
  Q11_GENHLTH_6A_2014, 
  Q11_GENHLTH_7A_2014, 
  Q11_GENHLTH_7B_2014, 
  Q11_GENHLTH_7F_1_2014, 
  Q11_GENHLTH_7F_2_2014, 
  FAMSIZE_2014, 
  TNFI_TRUNC_2014, 
  SMSARES_2014, 
  NUMCH14_2014, 
  OCCALL_EMP_01_2016, 
  OCCALL_EMP_02_2016, 
  OCCALL_EMP_03_2016, 
  OCCALL_EMP_04_2016, 
  OCCALL_EMP_05_2016, 
  Q11_GENHLTH_6A_2016, 
  Q11_GENHLTH_7A_2016, 
  Q11_GENHLTH_7B_2016, 
  Q11_GENHLTH_7F_1_2016, 
  Q11_GENHLTH_7F_2_2016, 
  FAMSIZE_2016, 
  TNFI_TRUNC_2016, 
  SMSARES_2016, 
  NUMCH16_2016, 
  OCCALL_EMP_01_2020, 
  OCCALL_EMP_02_2020, 
  OCCALL_EMP_03_2020, 
  OCCALL_EMP_04_2020, 
  OCCALL_EMP_05_2020, 
  Q11_GENHLTH_6A_2020, 
  Q11_GENHLTH_7F_1_2020, 
  Q11_GENHLTH_7F_2_2020, 
  FAMSIZE_2020, 
  TNFI_TRUNC_2020, 
  SMSARES_2020, 
  NUMCH20_2020, 
  OCCALL_EMP_01_2022, 
  OCCALL_EMP_02_2022, 
  OCCALL_EMP_03_2022, 
  OCCALL_EMP_04_2022, 
  OCCALL_EMP_05_2022, 
  Q11_GENHLTH_6A_2022, 
  Q11_GENHLTH_7F_1_2022, 
  Q11_GENHLTH_7F_2_2022, 
  FAMSIZE_2022, 
  TNFI_TRUNC_2022, 
  SMSARES_2022, 
  NUMCH22_2022.
