
# Set working directory
# setwd()


new_data <- read.table('79_2909.dat', sep=' ')
names(new_data) <- c('H0004900',
'H0005001',
'R0000100',
'R0214700',
'R0214800',
'R9900002',
'T1298000',
'T1298100',
'T1298200',
'T1298300',
'T1298400',
'T2056800',
'T2057700',
'T2057800',
'T2209900',
'T2210000',
'T2210800',
'T2212300',
'T2217800',
'T2326500',
'T2326600',
'T2326700',
'T2326800',
'T2326900',
'T3027200',
'T3028100',
'T3028200',
'T3107700',
'T3107800',
'T3108700',
'T3110200',
'T3115800',
'T3308700',
'T3308800',
'T3308900',
'T3309000',
'T3309100',
'T3958000',
'T3958900',
'T3959000',
'T4112200',
'T4112300',
'T4113200',
'T4114700',
'T4120300',
'T4282800',
'T4282900',
'T4283000',
'T4283100',
'T4283200',
'T4895700',
'T4896600',
'T4896700',
'T5022500',
'T5022600',
'T5023600',
'T5026000',
'T5031500',
'T5256900',
'T5257000',
'T5257100',
'T5257200',
'T5257300',
'T5599700',
'T5600600',
'T5600700',
'T5770700',
'T5770800',
'T5771500',
'T5774100',
'T5779700',
'T8428300',
'T8428400',
'T8428500',
'T8428600',
'T8428700',
'T8624900',
'T8625300',
'T8625400',
'T8787800',
'T8787900',
'T8788600',
'T8790500',
'T8796100',
'T8982400',
'T8982500',
'T8982600',
'T8982700',
'T8982800',
'T9183100',
'T9183800',
'T9183900',
'T9299600',
'T9299700',
'T9300400',
'T9302300',
'T9307900')


# Handle missing values

new_data[new_data == -1] = NA  # Refused
new_data[new_data == -2] = NA  # Dont know
new_data[new_data == -3] = NA  # Invalid missing
new_data[new_data == -4] = NA  # Valid missing
new_data[new_data == -5] = NA  # Non-interview


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$H0004900 <- factor(data$H0004900,
levels=c(0.0,1.0),
labels=c("NO",
"YES"))
  data$R0214700 <- factor(data$R0214700,
levels=c(1.0,2.0,3.0),
labels=c("HISPANIC",
"BLACK",
"NON-BLACK, NON-HISPANIC"))
  data$R0214800 <- factor(data$R0214800,
levels=c(1.0,2.0),
labels=c("MALE",
"FEMALE"))
  data$T2056800 <- factor(data$T2056800,
levels=c(1.0,2.0,3.0,4.0),
labels=c("Lose weight",
"Gain weight",
"Stay about the same",
"Not trying to do anything"))
  data$T2057800 <- factor(data$T2057800,
levels=c(1.0,2.0),
labels=c("Per day",
"Per week"))
  data$T2210800 <- factor(data$T2210800,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52"))
  data$T2212300 <- factor(data$T2212300,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN SMSA",
"2: SMSA, NOT CENTRAL CITY",
"3: SMSA, IN CENTRAL CITY",
"4: SMSA, CENTRAL CITY NOT KNOWN"))
  data$T3027200 <- factor(data$T3027200,
levels=c(1.0,2.0,3.0,4.0),
labels=c("Lose weight",
"Gain weight",
"Stay about the same",
"Not trying to do anything"))
  data$T3028200 <- factor(data$T3028200,
levels=c(1.0,2.0),
labels=c("Per day",
"Per week"))
  data$T3108700 <- factor(data$T3108700,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53"))
  data$T3110200 <- factor(data$T3110200,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN SMSA",
"2: SMSA, NOT CENTRAL CITY",
"3: SMSA, IN CENTRAL CITY",
"4: SMSA, CENTRAL CITY NOT KNOWN"))
  data$T3958000 <- factor(data$T3958000,
levels=c(1.0,2.0,3.0,4.0),
labels=c("Lose weight",
"Gain weight",
"Stay about the same",
"Not trying to do anything"))
  data$T3959000 <- factor(data$T3959000,
levels=c(1.0,2.0),
labels=c("Per day",
"Per week"))
  data$T4113200 <- factor(data$T4113200,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56"))
  data$T4114700 <- factor(data$T4114700,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN SMSA",
"2: SMSA, NOT CENTRAL CITY",
"3: SMSA, IN CENTRAL CITY",
"4: SMSA, CENTRAL CITY NOT KNOWN"))
  data$T4895700 <- factor(data$T4895700,
levels=c(1.0,2.0,3.0,4.0),
labels=c("Lose weight",
"Gain weight",
"Stay about the same",
"Not trying to do anything"))
  data$T4896700 <- factor(data$T4896700,
levels=c(1.0,2.0),
labels=c("Per day",
"Per week"))
  data$T5023600 <- factor(data$T5023600,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58"))
  data$T5026000 <- factor(data$T5026000,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN SMSA",
"2: SMSA, NOT CENTRAL CITY",
"3: SMSA, IN CENTRAL CITY",
"4: SMSA, CENTRAL CITY NOT KNOWN"))
  data$T5599700 <- factor(data$T5599700,
levels=c(1.0,2.0,3.0,4.0),
labels=c("Lose weight",
"Gain weight",
"Stay about the same",
"Not trying to do anything"))
  data$T5600700 <- factor(data$T5600700,
levels=c(1.0,2.0),
labels=c("Per day",
"Per week"))
  data$T5771500 <- factor(data$T5771500,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,61.0,62.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58",
"59",
"60",
"61",
"62"))
  data$T5774100 <- factor(data$T5774100,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN SMSA",
"2: SMSA, NOT CENTRAL CITY",
"3: SMSA, IN CENTRAL CITY",
"4: SMSA, CENTRAL CITY NOT KNOWN"))
  data$T8624900 <- factor(data$T8624900,
levels=c(1.0,2.0,3.0,4.0),
labels=c("Lose weight",
"Gain weight",
"Stay about the same",
"Not trying to do anything"))
  data$T8625400 <- factor(data$T8625400,
levels=c(1.0,2.0),
labels=c("Per day",
"Per week"))
  data$T8788600 <- factor(data$T8788600,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,61.0,62.0,63.0,64.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58",
"59",
"60",
"61",
"62",
"63",
"64"))
  data$T8790500 <- factor(data$T8790500,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN SMSA",
"2: SMSA, NOT CENTRAL CITY",
"3: SMSA, IN CENTRAL CITY",
"4: SMSA, CENTRAL CITY NOT KNOWN"))
  data$T9183100 <- factor(data$T9183100,
levels=c(1.0,2.0,3.0,4.0),
labels=c("Lose weight",
"Gain weight",
"Stay about the same",
"Not trying to do anything"))
  data$T9183900 <- factor(data$T9183900,
levels=c(1.0,2.0),
labels=c("Per day",
"Per week"))
  data$T9300400 <- factor(data$T9300400,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,61.0,62.0,63.0,64.0,65.0,66.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58",
"59",
"60",
"61",
"62",
"63",
"64",
"65",
"66"))
  data$T9302300 <- factor(data$T9302300,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN SMSA",
"2: SMSA, NOT CENTRAL CITY",
"3: SMSA, IN CENTRAL CITY",
"4: SMSA, CENTRAL CITY NOT KNOWN"))
return(data)
}


# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {
data$H0005001[0.0 <= data$H0005001 & data$H0005001 <= 1978.0] <- 0.0
data$H0005001 <- factor(data$H0005001,
levels=c(0.0,1979.0,1980.0,1981.0,1982.0,1983.0,1984.0,1985.0,1986.0,1987.0,1988.0,1989.0,1990.0,1991.0,1992.0,1993.0,1994.0,1995.0,1996.0,1997.0,1998.0,1999.0,2000.0,2001.0,2002.0,2003.0,2004.0,2005.0,2006.0,2007.0,2008.0,2009.0,2010.0,2011.0,2012.0,2013.0,2014.0,2015.0,2016.0,2017.0,2018.0,2019.0,2020.0,2021.0,2022.0,2023.0,2024.0,2025.0),
labels=c("0 TO 1978: < 1978",
"1979",
"1980",
"1981",
"1982",
"1983",
"1984",
"1985",
"1986",
"1987",
"1988",
"1989",
"1990",
"1991",
"1992",
"1993",
"1994",
"1995",
"1996",
"1997",
"1998",
"1999",
"2000",
"2001",
"2002",
"2003",
"2004",
"2005",
"2006",
"2007",
"2008",
"2009",
"2010",
"2011",
"2012",
"2013",
"2014",
"2015",
"2016",
"2017",
"2018",
"2019",
"2020",
"2021",
"2022",
"2023",
"2024",
"2025"))
data$R9900002[0.0 <= data$R9900002 & data$R9900002 <= 1978.0] <- 0.0
data$R9900002 <- factor(data$R9900002,
levels=c(0.0,1979.0,1980.0,1981.0,1982.0,1983.0,1984.0,1985.0,1986.0,1987.0,1988.0,1989.0,1990.0,1991.0,1992.0,1993.0,1994.0,1995.0,1996.0,1997.0,1998.0,1999.0,2000.0,2001.0,2002.0,2003.0,2004.0,2005.0,2006.0,2007.0,2008.0,2009.0,2010.0,2011.0,2012.0,2013.0,2014.0,2015.0,2016.0,2017.0,2018.0,2019.0,2020.0,2021.0,2022.0,2023.0,2024.0,2025.0),
labels=c("0 TO 1978: < 1978",
"1979",
"1980",
"1981",
"1982",
"1983",
"1984",
"1985",
"1986",
"1987",
"1988",
"1989",
"1990",
"1991",
"1992",
"1993",
"1994",
"1995",
"1996",
"1997",
"1998",
"1999",
"2000",
"2001",
"2002",
"2003",
"2004",
"2005",
"2006",
"2007",
"2008",
"2009",
"2010",
"2011",
"2012",
"2013",
"2014",
"2015",
"2016",
"2017",
"2018",
"2019",
"2020",
"2021",
"2022",
"2023",
"2024",
"2025"))
data$T1298000[10.0 <= data$T1298000 & data$T1298000 <= 430.0] <- 10.0
data$T1298000[500.0 <= data$T1298000 & data$T1298000 <= 950.0] <- 500.0
data$T1298000[1000.0 <= data$T1298000 & data$T1298000 <= 1240.0] <- 1000.0
data$T1298000[1300.0 <= data$T1298000 & data$T1298000 <= 1560.0] <- 1300.0
data$T1298000[1600.0 <= data$T1298000 & data$T1298000 <= 1760.0] <- 1600.0
data$T1298000[1800.0 <= data$T1298000 & data$T1298000 <= 1860.0] <- 1800.0
data$T1298000[1900.0 <= data$T1298000 & data$T1298000 <= 1960.0] <- 1900.0
data$T1298000[2000.0 <= data$T1298000 & data$T1298000 <= 2060.0] <- 2000.0
data$T1298000[2100.0 <= data$T1298000 & data$T1298000 <= 2150.0] <- 2100.0
data$T1298000[2200.0 <= data$T1298000 & data$T1298000 <= 2340.0] <- 2200.0
data$T1298000[2400.0 <= data$T1298000 & data$T1298000 <= 2550.0] <- 2400.0
data$T1298000[2600.0 <= data$T1298000 & data$T1298000 <= 2760.0] <- 2600.0
data$T1298000[2800.0 <= data$T1298000 & data$T1298000 <= 2960.0] <- 2800.0
data$T1298000[3000.0 <= data$T1298000 & data$T1298000 <= 3260.0] <- 3000.0
data$T1298000[3300.0 <= data$T1298000 & data$T1298000 <= 3650.0] <- 3300.0
data$T1298000[3700.0 <= data$T1298000 & data$T1298000 <= 3950.0] <- 3700.0
data$T1298000[4000.0 <= data$T1298000 & data$T1298000 <= 4160.0] <- 4000.0
data$T1298000[4200.0 <= data$T1298000 & data$T1298000 <= 4250.0] <- 4200.0
data$T1298000[4300.0 <= data$T1298000 & data$T1298000 <= 4430.0] <- 4300.0
data$T1298000[4500.0 <= data$T1298000 & data$T1298000 <= 4650.0] <- 4500.0
data$T1298000[4700.0 <= data$T1298000 & data$T1298000 <= 4960.0] <- 4700.0
data$T1298000[5000.0 <= data$T1298000 & data$T1298000 <= 5930.0] <- 5000.0
data$T1298000[6000.0 <= data$T1298000 & data$T1298000 <= 6130.0] <- 6000.0
data$T1298000[6200.0 <= data$T1298000 & data$T1298000 <= 6940.0] <- 6200.0
data$T1298000[7000.0 <= data$T1298000 & data$T1298000 <= 7620.0] <- 7000.0
data$T1298000[7700.0 <= data$T1298000 & data$T1298000 <= 7750.0] <- 7700.0
data$T1298000[7800.0 <= data$T1298000 & data$T1298000 <= 7850.0] <- 7800.0
data$T1298000[7900.0 <= data$T1298000 & data$T1298000 <= 8960.0] <- 7900.0
data$T1298000[9000.0 <= data$T1298000 & data$T1298000 <= 9750.0] <- 9000.0
data$T1298000[9800.0 <= data$T1298000 & data$T1298000 <= 9830.0] <- 9800.0
data$T1298000 <- factor(data$T1298000,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T1298100[10.0 <= data$T1298100 & data$T1298100 <= 430.0] <- 10.0
data$T1298100[500.0 <= data$T1298100 & data$T1298100 <= 950.0] <- 500.0
data$T1298100[1000.0 <= data$T1298100 & data$T1298100 <= 1240.0] <- 1000.0
data$T1298100[1300.0 <= data$T1298100 & data$T1298100 <= 1560.0] <- 1300.0
data$T1298100[1600.0 <= data$T1298100 & data$T1298100 <= 1760.0] <- 1600.0
data$T1298100[1800.0 <= data$T1298100 & data$T1298100 <= 1860.0] <- 1800.0
data$T1298100[1900.0 <= data$T1298100 & data$T1298100 <= 1960.0] <- 1900.0
data$T1298100[2000.0 <= data$T1298100 & data$T1298100 <= 2060.0] <- 2000.0
data$T1298100[2100.0 <= data$T1298100 & data$T1298100 <= 2150.0] <- 2100.0
data$T1298100[2200.0 <= data$T1298100 & data$T1298100 <= 2340.0] <- 2200.0
data$T1298100[2400.0 <= data$T1298100 & data$T1298100 <= 2550.0] <- 2400.0
data$T1298100[2600.0 <= data$T1298100 & data$T1298100 <= 2760.0] <- 2600.0
data$T1298100[2800.0 <= data$T1298100 & data$T1298100 <= 2960.0] <- 2800.0
data$T1298100[3000.0 <= data$T1298100 & data$T1298100 <= 3260.0] <- 3000.0
data$T1298100[3300.0 <= data$T1298100 & data$T1298100 <= 3650.0] <- 3300.0
data$T1298100[3700.0 <= data$T1298100 & data$T1298100 <= 3950.0] <- 3700.0
data$T1298100[4000.0 <= data$T1298100 & data$T1298100 <= 4160.0] <- 4000.0
data$T1298100[4200.0 <= data$T1298100 & data$T1298100 <= 4250.0] <- 4200.0
data$T1298100[4300.0 <= data$T1298100 & data$T1298100 <= 4430.0] <- 4300.0
data$T1298100[4500.0 <= data$T1298100 & data$T1298100 <= 4650.0] <- 4500.0
data$T1298100[4700.0 <= data$T1298100 & data$T1298100 <= 4960.0] <- 4700.0
data$T1298100[5000.0 <= data$T1298100 & data$T1298100 <= 5930.0] <- 5000.0
data$T1298100[6000.0 <= data$T1298100 & data$T1298100 <= 6130.0] <- 6000.0
data$T1298100[6200.0 <= data$T1298100 & data$T1298100 <= 6940.0] <- 6200.0
data$T1298100[7000.0 <= data$T1298100 & data$T1298100 <= 7620.0] <- 7000.0
data$T1298100[7700.0 <= data$T1298100 & data$T1298100 <= 7750.0] <- 7700.0
data$T1298100[7800.0 <= data$T1298100 & data$T1298100 <= 7850.0] <- 7800.0
data$T1298100[7900.0 <= data$T1298100 & data$T1298100 <= 8960.0] <- 7900.0
data$T1298100[9000.0 <= data$T1298100 & data$T1298100 <= 9750.0] <- 9000.0
data$T1298100[9800.0 <= data$T1298100 & data$T1298100 <= 9830.0] <- 9800.0
data$T1298100 <- factor(data$T1298100,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T1298200[10.0 <= data$T1298200 & data$T1298200 <= 430.0] <- 10.0
data$T1298200[500.0 <= data$T1298200 & data$T1298200 <= 950.0] <- 500.0
data$T1298200[1000.0 <= data$T1298200 & data$T1298200 <= 1240.0] <- 1000.0
data$T1298200[1300.0 <= data$T1298200 & data$T1298200 <= 1560.0] <- 1300.0
data$T1298200[1600.0 <= data$T1298200 & data$T1298200 <= 1760.0] <- 1600.0
data$T1298200[1800.0 <= data$T1298200 & data$T1298200 <= 1860.0] <- 1800.0
data$T1298200[1900.0 <= data$T1298200 & data$T1298200 <= 1960.0] <- 1900.0
data$T1298200[2000.0 <= data$T1298200 & data$T1298200 <= 2060.0] <- 2000.0
data$T1298200[2100.0 <= data$T1298200 & data$T1298200 <= 2150.0] <- 2100.0
data$T1298200[2200.0 <= data$T1298200 & data$T1298200 <= 2340.0] <- 2200.0
data$T1298200[2400.0 <= data$T1298200 & data$T1298200 <= 2550.0] <- 2400.0
data$T1298200[2600.0 <= data$T1298200 & data$T1298200 <= 2760.0] <- 2600.0
data$T1298200[2800.0 <= data$T1298200 & data$T1298200 <= 2960.0] <- 2800.0
data$T1298200[3000.0 <= data$T1298200 & data$T1298200 <= 3260.0] <- 3000.0
data$T1298200[3300.0 <= data$T1298200 & data$T1298200 <= 3650.0] <- 3300.0
data$T1298200[3700.0 <= data$T1298200 & data$T1298200 <= 3950.0] <- 3700.0
data$T1298200[4000.0 <= data$T1298200 & data$T1298200 <= 4160.0] <- 4000.0
data$T1298200[4200.0 <= data$T1298200 & data$T1298200 <= 4250.0] <- 4200.0
data$T1298200[4300.0 <= data$T1298200 & data$T1298200 <= 4430.0] <- 4300.0
data$T1298200[4500.0 <= data$T1298200 & data$T1298200 <= 4650.0] <- 4500.0
data$T1298200[4700.0 <= data$T1298200 & data$T1298200 <= 4960.0] <- 4700.0
data$T1298200[5000.0 <= data$T1298200 & data$T1298200 <= 5930.0] <- 5000.0
data$T1298200[6000.0 <= data$T1298200 & data$T1298200 <= 6130.0] <- 6000.0
data$T1298200[6200.0 <= data$T1298200 & data$T1298200 <= 6940.0] <- 6200.0
data$T1298200[7000.0 <= data$T1298200 & data$T1298200 <= 7620.0] <- 7000.0
data$T1298200[7700.0 <= data$T1298200 & data$T1298200 <= 7750.0] <- 7700.0
data$T1298200[7800.0 <= data$T1298200 & data$T1298200 <= 7850.0] <- 7800.0
data$T1298200[7900.0 <= data$T1298200 & data$T1298200 <= 8960.0] <- 7900.0
data$T1298200[9000.0 <= data$T1298200 & data$T1298200 <= 9750.0] <- 9000.0
data$T1298200[9800.0 <= data$T1298200 & data$T1298200 <= 9830.0] <- 9800.0
data$T1298200 <- factor(data$T1298200,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T1298300[10.0 <= data$T1298300 & data$T1298300 <= 430.0] <- 10.0
data$T1298300[500.0 <= data$T1298300 & data$T1298300 <= 950.0] <- 500.0
data$T1298300[1000.0 <= data$T1298300 & data$T1298300 <= 1240.0] <- 1000.0
data$T1298300[1300.0 <= data$T1298300 & data$T1298300 <= 1560.0] <- 1300.0
data$T1298300[1600.0 <= data$T1298300 & data$T1298300 <= 1760.0] <- 1600.0
data$T1298300[1800.0 <= data$T1298300 & data$T1298300 <= 1860.0] <- 1800.0
data$T1298300[1900.0 <= data$T1298300 & data$T1298300 <= 1960.0] <- 1900.0
data$T1298300[2000.0 <= data$T1298300 & data$T1298300 <= 2060.0] <- 2000.0
data$T1298300[2100.0 <= data$T1298300 & data$T1298300 <= 2150.0] <- 2100.0
data$T1298300[2200.0 <= data$T1298300 & data$T1298300 <= 2340.0] <- 2200.0
data$T1298300[2400.0 <= data$T1298300 & data$T1298300 <= 2550.0] <- 2400.0
data$T1298300[2600.0 <= data$T1298300 & data$T1298300 <= 2760.0] <- 2600.0
data$T1298300[2800.0 <= data$T1298300 & data$T1298300 <= 2960.0] <- 2800.0
data$T1298300[3000.0 <= data$T1298300 & data$T1298300 <= 3260.0] <- 3000.0
data$T1298300[3300.0 <= data$T1298300 & data$T1298300 <= 3650.0] <- 3300.0
data$T1298300[3700.0 <= data$T1298300 & data$T1298300 <= 3950.0] <- 3700.0
data$T1298300[4000.0 <= data$T1298300 & data$T1298300 <= 4160.0] <- 4000.0
data$T1298300[4200.0 <= data$T1298300 & data$T1298300 <= 4250.0] <- 4200.0
data$T1298300[4300.0 <= data$T1298300 & data$T1298300 <= 4430.0] <- 4300.0
data$T1298300[4500.0 <= data$T1298300 & data$T1298300 <= 4650.0] <- 4500.0
data$T1298300[4700.0 <= data$T1298300 & data$T1298300 <= 4960.0] <- 4700.0
data$T1298300[5000.0 <= data$T1298300 & data$T1298300 <= 5930.0] <- 5000.0
data$T1298300[6000.0 <= data$T1298300 & data$T1298300 <= 6130.0] <- 6000.0
data$T1298300[6200.0 <= data$T1298300 & data$T1298300 <= 6940.0] <- 6200.0
data$T1298300[7000.0 <= data$T1298300 & data$T1298300 <= 7620.0] <- 7000.0
data$T1298300[7700.0 <= data$T1298300 & data$T1298300 <= 7750.0] <- 7700.0
data$T1298300[7800.0 <= data$T1298300 & data$T1298300 <= 7850.0] <- 7800.0
data$T1298300[7900.0 <= data$T1298300 & data$T1298300 <= 8960.0] <- 7900.0
data$T1298300[9000.0 <= data$T1298300 & data$T1298300 <= 9750.0] <- 9000.0
data$T1298300[9800.0 <= data$T1298300 & data$T1298300 <= 9830.0] <- 9800.0
data$T1298300 <- factor(data$T1298300,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T1298400[10.0 <= data$T1298400 & data$T1298400 <= 430.0] <- 10.0
data$T1298400[500.0 <= data$T1298400 & data$T1298400 <= 950.0] <- 500.0
data$T1298400[1000.0 <= data$T1298400 & data$T1298400 <= 1240.0] <- 1000.0
data$T1298400[1300.0 <= data$T1298400 & data$T1298400 <= 1560.0] <- 1300.0
data$T1298400[1600.0 <= data$T1298400 & data$T1298400 <= 1760.0] <- 1600.0
data$T1298400[1800.0 <= data$T1298400 & data$T1298400 <= 1860.0] <- 1800.0
data$T1298400[1900.0 <= data$T1298400 & data$T1298400 <= 1960.0] <- 1900.0
data$T1298400[2000.0 <= data$T1298400 & data$T1298400 <= 2060.0] <- 2000.0
data$T1298400[2100.0 <= data$T1298400 & data$T1298400 <= 2150.0] <- 2100.0
data$T1298400[2200.0 <= data$T1298400 & data$T1298400 <= 2340.0] <- 2200.0
data$T1298400[2400.0 <= data$T1298400 & data$T1298400 <= 2550.0] <- 2400.0
data$T1298400[2600.0 <= data$T1298400 & data$T1298400 <= 2760.0] <- 2600.0
data$T1298400[2800.0 <= data$T1298400 & data$T1298400 <= 2960.0] <- 2800.0
data$T1298400[3000.0 <= data$T1298400 & data$T1298400 <= 3260.0] <- 3000.0
data$T1298400[3300.0 <= data$T1298400 & data$T1298400 <= 3650.0] <- 3300.0
data$T1298400[3700.0 <= data$T1298400 & data$T1298400 <= 3950.0] <- 3700.0
data$T1298400[4000.0 <= data$T1298400 & data$T1298400 <= 4160.0] <- 4000.0
data$T1298400[4200.0 <= data$T1298400 & data$T1298400 <= 4250.0] <- 4200.0
data$T1298400[4300.0 <= data$T1298400 & data$T1298400 <= 4430.0] <- 4300.0
data$T1298400[4500.0 <= data$T1298400 & data$T1298400 <= 4650.0] <- 4500.0
data$T1298400[4700.0 <= data$T1298400 & data$T1298400 <= 4960.0] <- 4700.0
data$T1298400[5000.0 <= data$T1298400 & data$T1298400 <= 5930.0] <- 5000.0
data$T1298400[6000.0 <= data$T1298400 & data$T1298400 <= 6130.0] <- 6000.0
data$T1298400[6200.0 <= data$T1298400 & data$T1298400 <= 6940.0] <- 6200.0
data$T1298400[7000.0 <= data$T1298400 & data$T1298400 <= 7620.0] <- 7000.0
data$T1298400[7700.0 <= data$T1298400 & data$T1298400 <= 7750.0] <- 7700.0
data$T1298400[7800.0 <= data$T1298400 & data$T1298400 <= 7850.0] <- 7800.0
data$T1298400[7900.0 <= data$T1298400 & data$T1298400 <= 8960.0] <- 7900.0
data$T1298400[9000.0 <= data$T1298400 & data$T1298400 <= 9750.0] <- 9000.0
data$T1298400[9800.0 <= data$T1298400 & data$T1298400 <= 9830.0] <- 9800.0
data$T1298400 <- factor(data$T1298400,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T2057700[1.0 <= data$T2057700 & data$T2057700 <= 4.0] <- 1.0
data$T2057700[5.0 <= data$T2057700 & data$T2057700 <= 9.0] <- 5.0
data$T2057700[10.0 <= data$T2057700 & data$T2057700 <= 14.0] <- 10.0
data$T2057700[15.0 <= data$T2057700 & data$T2057700 <= 19.0] <- 15.0
data$T2057700[20.0 <= data$T2057700 & data$T2057700 <= 24.0] <- 20.0
data$T2057700[25.0 <= data$T2057700 & data$T2057700 <= 29.0] <- 25.0
data$T2057700[30.0 <= data$T2057700 & data$T2057700 <= 34.0] <- 30.0
data$T2057700[35.0 <= data$T2057700 & data$T2057700 <= 39.0] <- 35.0
data$T2057700[40.0 <= data$T2057700 & data$T2057700 <= 44.0] <- 40.0
data$T2057700[45.0 <= data$T2057700 & data$T2057700 <= 49.0] <- 45.0
data$T2057700[50.0 <= data$T2057700 & data$T2057700 <= 9.9999999E7] <- 50.0
data$T2057700 <- factor(data$T2057700,
levels=c(0.0,1.0,5.0,10.0,15.0,20.0,25.0,30.0,35.0,40.0,45.0,50.0),
labels=c("0",
"1 TO 4",
"5 TO 9",
"10 TO 14",
"15 TO 19",
"20 TO 24",
"25 TO 29",
"30 TO 34",
"35 TO 39",
"40 TO 44",
"45 TO 49",
"50 TO 99999999: 50+"))
data$T2209900[10.0 <= data$T2209900 & data$T2209900 <= 999.0] <- 10.0
data$T2209900 <- factor(data$T2209900,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T2210000[1.0 <= data$T2210000 & data$T2210000 <= 999.0] <- 1.0
data$T2210000[1000.0 <= data$T2210000 & data$T2210000 <= 1999.0] <- 1000.0
data$T2210000[2000.0 <= data$T2210000 & data$T2210000 <= 2999.0] <- 2000.0
data$T2210000[3000.0 <= data$T2210000 & data$T2210000 <= 3999.0] <- 3000.0
data$T2210000[4000.0 <= data$T2210000 & data$T2210000 <= 4999.0] <- 4000.0
data$T2210000[5000.0 <= data$T2210000 & data$T2210000 <= 5999.0] <- 5000.0
data$T2210000[6000.0 <= data$T2210000 & data$T2210000 <= 6999.0] <- 6000.0
data$T2210000[7000.0 <= data$T2210000 & data$T2210000 <= 7999.0] <- 7000.0
data$T2210000[8000.0 <= data$T2210000 & data$T2210000 <= 8999.0] <- 8000.0
data$T2210000[9000.0 <= data$T2210000 & data$T2210000 <= 9999.0] <- 9000.0
data$T2210000[10000.0 <= data$T2210000 & data$T2210000 <= 14999.0] <- 10000.0
data$T2210000[15000.0 <= data$T2210000 & data$T2210000 <= 19999.0] <- 15000.0
data$T2210000[20000.0 <= data$T2210000 & data$T2210000 <= 24999.0] <- 20000.0
data$T2210000[25000.0 <= data$T2210000 & data$T2210000 <= 49999.0] <- 25000.0
data$T2210000[50000.0 <= data$T2210000 & data$T2210000 <= 9.9999999E7] <- 50000.0
data$T2210000 <- factor(data$T2210000,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
labels=c("0",
"1 TO 999",
"1000 TO 1999",
"2000 TO 2999",
"3000 TO 3999",
"4000 TO 4999",
"5000 TO 5999",
"6000 TO 6999",
"7000 TO 7999",
"8000 TO 8999",
"9000 TO 9999",
"10000 TO 14999",
"15000 TO 19999",
"20000 TO 24999",
"25000 TO 49999",
"50000 TO 99999999: 50000+"))
data$T2217800[10.0 <= data$T2217800 & data$T2217800 <= 999.0] <- 10.0
data$T2217800 <- factor(data$T2217800,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T2326500[10.0 <= data$T2326500 & data$T2326500 <= 430.0] <- 10.0
data$T2326500[500.0 <= data$T2326500 & data$T2326500 <= 950.0] <- 500.0
data$T2326500[1000.0 <= data$T2326500 & data$T2326500 <= 1240.0] <- 1000.0
data$T2326500[1300.0 <= data$T2326500 & data$T2326500 <= 1560.0] <- 1300.0
data$T2326500[1600.0 <= data$T2326500 & data$T2326500 <= 1760.0] <- 1600.0
data$T2326500[1800.0 <= data$T2326500 & data$T2326500 <= 1860.0] <- 1800.0
data$T2326500[1900.0 <= data$T2326500 & data$T2326500 <= 1960.0] <- 1900.0
data$T2326500[2000.0 <= data$T2326500 & data$T2326500 <= 2060.0] <- 2000.0
data$T2326500[2100.0 <= data$T2326500 & data$T2326500 <= 2150.0] <- 2100.0
data$T2326500[2200.0 <= data$T2326500 & data$T2326500 <= 2340.0] <- 2200.0
data$T2326500[2400.0 <= data$T2326500 & data$T2326500 <= 2550.0] <- 2400.0
data$T2326500[2600.0 <= data$T2326500 & data$T2326500 <= 2760.0] <- 2600.0
data$T2326500[2800.0 <= data$T2326500 & data$T2326500 <= 2960.0] <- 2800.0
data$T2326500[3000.0 <= data$T2326500 & data$T2326500 <= 3260.0] <- 3000.0
data$T2326500[3300.0 <= data$T2326500 & data$T2326500 <= 3650.0] <- 3300.0
data$T2326500[3700.0 <= data$T2326500 & data$T2326500 <= 3950.0] <- 3700.0
data$T2326500[4000.0 <= data$T2326500 & data$T2326500 <= 4160.0] <- 4000.0
data$T2326500[4200.0 <= data$T2326500 & data$T2326500 <= 4250.0] <- 4200.0
data$T2326500[4300.0 <= data$T2326500 & data$T2326500 <= 4430.0] <- 4300.0
data$T2326500[4500.0 <= data$T2326500 & data$T2326500 <= 4650.0] <- 4500.0
data$T2326500[4700.0 <= data$T2326500 & data$T2326500 <= 4960.0] <- 4700.0
data$T2326500[5000.0 <= data$T2326500 & data$T2326500 <= 5930.0] <- 5000.0
data$T2326500[6000.0 <= data$T2326500 & data$T2326500 <= 6130.0] <- 6000.0
data$T2326500[6200.0 <= data$T2326500 & data$T2326500 <= 6940.0] <- 6200.0
data$T2326500[7000.0 <= data$T2326500 & data$T2326500 <= 7620.0] <- 7000.0
data$T2326500[7700.0 <= data$T2326500 & data$T2326500 <= 7750.0] <- 7700.0
data$T2326500[7800.0 <= data$T2326500 & data$T2326500 <= 7850.0] <- 7800.0
data$T2326500[7900.0 <= data$T2326500 & data$T2326500 <= 8960.0] <- 7900.0
data$T2326500[9000.0 <= data$T2326500 & data$T2326500 <= 9750.0] <- 9000.0
data$T2326500[9800.0 <= data$T2326500 & data$T2326500 <= 9830.0] <- 9800.0
data$T2326500 <- factor(data$T2326500,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T2326600[10.0 <= data$T2326600 & data$T2326600 <= 430.0] <- 10.0
data$T2326600[500.0 <= data$T2326600 & data$T2326600 <= 950.0] <- 500.0
data$T2326600[1000.0 <= data$T2326600 & data$T2326600 <= 1240.0] <- 1000.0
data$T2326600[1300.0 <= data$T2326600 & data$T2326600 <= 1560.0] <- 1300.0
data$T2326600[1600.0 <= data$T2326600 & data$T2326600 <= 1760.0] <- 1600.0
data$T2326600[1800.0 <= data$T2326600 & data$T2326600 <= 1860.0] <- 1800.0
data$T2326600[1900.0 <= data$T2326600 & data$T2326600 <= 1960.0] <- 1900.0
data$T2326600[2000.0 <= data$T2326600 & data$T2326600 <= 2060.0] <- 2000.0
data$T2326600[2100.0 <= data$T2326600 & data$T2326600 <= 2150.0] <- 2100.0
data$T2326600[2200.0 <= data$T2326600 & data$T2326600 <= 2340.0] <- 2200.0
data$T2326600[2400.0 <= data$T2326600 & data$T2326600 <= 2550.0] <- 2400.0
data$T2326600[2600.0 <= data$T2326600 & data$T2326600 <= 2760.0] <- 2600.0
data$T2326600[2800.0 <= data$T2326600 & data$T2326600 <= 2960.0] <- 2800.0
data$T2326600[3000.0 <= data$T2326600 & data$T2326600 <= 3260.0] <- 3000.0
data$T2326600[3300.0 <= data$T2326600 & data$T2326600 <= 3650.0] <- 3300.0
data$T2326600[3700.0 <= data$T2326600 & data$T2326600 <= 3950.0] <- 3700.0
data$T2326600[4000.0 <= data$T2326600 & data$T2326600 <= 4160.0] <- 4000.0
data$T2326600[4200.0 <= data$T2326600 & data$T2326600 <= 4250.0] <- 4200.0
data$T2326600[4300.0 <= data$T2326600 & data$T2326600 <= 4430.0] <- 4300.0
data$T2326600[4500.0 <= data$T2326600 & data$T2326600 <= 4650.0] <- 4500.0
data$T2326600[4700.0 <= data$T2326600 & data$T2326600 <= 4960.0] <- 4700.0
data$T2326600[5000.0 <= data$T2326600 & data$T2326600 <= 5930.0] <- 5000.0
data$T2326600[6000.0 <= data$T2326600 & data$T2326600 <= 6130.0] <- 6000.0
data$T2326600[6200.0 <= data$T2326600 & data$T2326600 <= 6940.0] <- 6200.0
data$T2326600[7000.0 <= data$T2326600 & data$T2326600 <= 7620.0] <- 7000.0
data$T2326600[7700.0 <= data$T2326600 & data$T2326600 <= 7750.0] <- 7700.0
data$T2326600[7800.0 <= data$T2326600 & data$T2326600 <= 7850.0] <- 7800.0
data$T2326600[7900.0 <= data$T2326600 & data$T2326600 <= 8960.0] <- 7900.0
data$T2326600[9000.0 <= data$T2326600 & data$T2326600 <= 9750.0] <- 9000.0
data$T2326600[9800.0 <= data$T2326600 & data$T2326600 <= 9830.0] <- 9800.0
data$T2326600 <- factor(data$T2326600,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T2326700[10.0 <= data$T2326700 & data$T2326700 <= 430.0] <- 10.0
data$T2326700[500.0 <= data$T2326700 & data$T2326700 <= 950.0] <- 500.0
data$T2326700[1000.0 <= data$T2326700 & data$T2326700 <= 1240.0] <- 1000.0
data$T2326700[1300.0 <= data$T2326700 & data$T2326700 <= 1560.0] <- 1300.0
data$T2326700[1600.0 <= data$T2326700 & data$T2326700 <= 1760.0] <- 1600.0
data$T2326700[1800.0 <= data$T2326700 & data$T2326700 <= 1860.0] <- 1800.0
data$T2326700[1900.0 <= data$T2326700 & data$T2326700 <= 1960.0] <- 1900.0
data$T2326700[2000.0 <= data$T2326700 & data$T2326700 <= 2060.0] <- 2000.0
data$T2326700[2100.0 <= data$T2326700 & data$T2326700 <= 2150.0] <- 2100.0
data$T2326700[2200.0 <= data$T2326700 & data$T2326700 <= 2340.0] <- 2200.0
data$T2326700[2400.0 <= data$T2326700 & data$T2326700 <= 2550.0] <- 2400.0
data$T2326700[2600.0 <= data$T2326700 & data$T2326700 <= 2760.0] <- 2600.0
data$T2326700[2800.0 <= data$T2326700 & data$T2326700 <= 2960.0] <- 2800.0
data$T2326700[3000.0 <= data$T2326700 & data$T2326700 <= 3260.0] <- 3000.0
data$T2326700[3300.0 <= data$T2326700 & data$T2326700 <= 3650.0] <- 3300.0
data$T2326700[3700.0 <= data$T2326700 & data$T2326700 <= 3950.0] <- 3700.0
data$T2326700[4000.0 <= data$T2326700 & data$T2326700 <= 4160.0] <- 4000.0
data$T2326700[4200.0 <= data$T2326700 & data$T2326700 <= 4250.0] <- 4200.0
data$T2326700[4300.0 <= data$T2326700 & data$T2326700 <= 4430.0] <- 4300.0
data$T2326700[4500.0 <= data$T2326700 & data$T2326700 <= 4650.0] <- 4500.0
data$T2326700[4700.0 <= data$T2326700 & data$T2326700 <= 4960.0] <- 4700.0
data$T2326700[5000.0 <= data$T2326700 & data$T2326700 <= 5930.0] <- 5000.0
data$T2326700[6000.0 <= data$T2326700 & data$T2326700 <= 6130.0] <- 6000.0
data$T2326700[6200.0 <= data$T2326700 & data$T2326700 <= 6940.0] <- 6200.0
data$T2326700[7000.0 <= data$T2326700 & data$T2326700 <= 7620.0] <- 7000.0
data$T2326700[7700.0 <= data$T2326700 & data$T2326700 <= 7750.0] <- 7700.0
data$T2326700[7800.0 <= data$T2326700 & data$T2326700 <= 7850.0] <- 7800.0
data$T2326700[7900.0 <= data$T2326700 & data$T2326700 <= 8960.0] <- 7900.0
data$T2326700[9000.0 <= data$T2326700 & data$T2326700 <= 9750.0] <- 9000.0
data$T2326700[9800.0 <= data$T2326700 & data$T2326700 <= 9830.0] <- 9800.0
data$T2326700 <- factor(data$T2326700,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T2326800[10.0 <= data$T2326800 & data$T2326800 <= 430.0] <- 10.0
data$T2326800[500.0 <= data$T2326800 & data$T2326800 <= 950.0] <- 500.0
data$T2326800[1000.0 <= data$T2326800 & data$T2326800 <= 1240.0] <- 1000.0
data$T2326800[1300.0 <= data$T2326800 & data$T2326800 <= 1560.0] <- 1300.0
data$T2326800[1600.0 <= data$T2326800 & data$T2326800 <= 1760.0] <- 1600.0
data$T2326800[1800.0 <= data$T2326800 & data$T2326800 <= 1860.0] <- 1800.0
data$T2326800[1900.0 <= data$T2326800 & data$T2326800 <= 1960.0] <- 1900.0
data$T2326800[2000.0 <= data$T2326800 & data$T2326800 <= 2060.0] <- 2000.0
data$T2326800[2100.0 <= data$T2326800 & data$T2326800 <= 2150.0] <- 2100.0
data$T2326800[2200.0 <= data$T2326800 & data$T2326800 <= 2340.0] <- 2200.0
data$T2326800[2400.0 <= data$T2326800 & data$T2326800 <= 2550.0] <- 2400.0
data$T2326800[2600.0 <= data$T2326800 & data$T2326800 <= 2760.0] <- 2600.0
data$T2326800[2800.0 <= data$T2326800 & data$T2326800 <= 2960.0] <- 2800.0
data$T2326800[3000.0 <= data$T2326800 & data$T2326800 <= 3260.0] <- 3000.0
data$T2326800[3300.0 <= data$T2326800 & data$T2326800 <= 3650.0] <- 3300.0
data$T2326800[3700.0 <= data$T2326800 & data$T2326800 <= 3950.0] <- 3700.0
data$T2326800[4000.0 <= data$T2326800 & data$T2326800 <= 4160.0] <- 4000.0
data$T2326800[4200.0 <= data$T2326800 & data$T2326800 <= 4250.0] <- 4200.0
data$T2326800[4300.0 <= data$T2326800 & data$T2326800 <= 4430.0] <- 4300.0
data$T2326800[4500.0 <= data$T2326800 & data$T2326800 <= 4650.0] <- 4500.0
data$T2326800[4700.0 <= data$T2326800 & data$T2326800 <= 4960.0] <- 4700.0
data$T2326800[5000.0 <= data$T2326800 & data$T2326800 <= 5930.0] <- 5000.0
data$T2326800[6000.0 <= data$T2326800 & data$T2326800 <= 6130.0] <- 6000.0
data$T2326800[6200.0 <= data$T2326800 & data$T2326800 <= 6940.0] <- 6200.0
data$T2326800[7000.0 <= data$T2326800 & data$T2326800 <= 7620.0] <- 7000.0
data$T2326800[7700.0 <= data$T2326800 & data$T2326800 <= 7750.0] <- 7700.0
data$T2326800[7800.0 <= data$T2326800 & data$T2326800 <= 7850.0] <- 7800.0
data$T2326800[7900.0 <= data$T2326800 & data$T2326800 <= 8960.0] <- 7900.0
data$T2326800[9000.0 <= data$T2326800 & data$T2326800 <= 9750.0] <- 9000.0
data$T2326800[9800.0 <= data$T2326800 & data$T2326800 <= 9830.0] <- 9800.0
data$T2326800 <- factor(data$T2326800,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T2326900[10.0 <= data$T2326900 & data$T2326900 <= 430.0] <- 10.0
data$T2326900[500.0 <= data$T2326900 & data$T2326900 <= 950.0] <- 500.0
data$T2326900[1000.0 <= data$T2326900 & data$T2326900 <= 1240.0] <- 1000.0
data$T2326900[1300.0 <= data$T2326900 & data$T2326900 <= 1560.0] <- 1300.0
data$T2326900[1600.0 <= data$T2326900 & data$T2326900 <= 1760.0] <- 1600.0
data$T2326900[1800.0 <= data$T2326900 & data$T2326900 <= 1860.0] <- 1800.0
data$T2326900[1900.0 <= data$T2326900 & data$T2326900 <= 1960.0] <- 1900.0
data$T2326900[2000.0 <= data$T2326900 & data$T2326900 <= 2060.0] <- 2000.0
data$T2326900[2100.0 <= data$T2326900 & data$T2326900 <= 2150.0] <- 2100.0
data$T2326900[2200.0 <= data$T2326900 & data$T2326900 <= 2340.0] <- 2200.0
data$T2326900[2400.0 <= data$T2326900 & data$T2326900 <= 2550.0] <- 2400.0
data$T2326900[2600.0 <= data$T2326900 & data$T2326900 <= 2760.0] <- 2600.0
data$T2326900[2800.0 <= data$T2326900 & data$T2326900 <= 2960.0] <- 2800.0
data$T2326900[3000.0 <= data$T2326900 & data$T2326900 <= 3260.0] <- 3000.0
data$T2326900[3300.0 <= data$T2326900 & data$T2326900 <= 3650.0] <- 3300.0
data$T2326900[3700.0 <= data$T2326900 & data$T2326900 <= 3950.0] <- 3700.0
data$T2326900[4000.0 <= data$T2326900 & data$T2326900 <= 4160.0] <- 4000.0
data$T2326900[4200.0 <= data$T2326900 & data$T2326900 <= 4250.0] <- 4200.0
data$T2326900[4300.0 <= data$T2326900 & data$T2326900 <= 4430.0] <- 4300.0
data$T2326900[4500.0 <= data$T2326900 & data$T2326900 <= 4650.0] <- 4500.0
data$T2326900[4700.0 <= data$T2326900 & data$T2326900 <= 4960.0] <- 4700.0
data$T2326900[5000.0 <= data$T2326900 & data$T2326900 <= 5930.0] <- 5000.0
data$T2326900[6000.0 <= data$T2326900 & data$T2326900 <= 6130.0] <- 6000.0
data$T2326900[6200.0 <= data$T2326900 & data$T2326900 <= 6940.0] <- 6200.0
data$T2326900[7000.0 <= data$T2326900 & data$T2326900 <= 7620.0] <- 7000.0
data$T2326900[7700.0 <= data$T2326900 & data$T2326900 <= 7750.0] <- 7700.0
data$T2326900[7800.0 <= data$T2326900 & data$T2326900 <= 7850.0] <- 7800.0
data$T2326900[7900.0 <= data$T2326900 & data$T2326900 <= 8960.0] <- 7900.0
data$T2326900[9000.0 <= data$T2326900 & data$T2326900 <= 9750.0] <- 9000.0
data$T2326900[9800.0 <= data$T2326900 & data$T2326900 <= 9830.0] <- 9800.0
data$T2326900 <- factor(data$T2326900,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T3028100[15.0 <= data$T3028100 & data$T3028100 <= 999.0] <- 15.0
data$T3028100 <- factor(data$T3028100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 999: 15+"))
data$T3107700[10.0 <= data$T3107700 & data$T3107700 <= 999.0] <- 10.0
data$T3107700 <- factor(data$T3107700,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T3107800[1.0 <= data$T3107800 & data$T3107800 <= 999.0] <- 1.0
data$T3107800[1000.0 <= data$T3107800 & data$T3107800 <= 1999.0] <- 1000.0
data$T3107800[2000.0 <= data$T3107800 & data$T3107800 <= 2999.0] <- 2000.0
data$T3107800[3000.0 <= data$T3107800 & data$T3107800 <= 3999.0] <- 3000.0
data$T3107800[4000.0 <= data$T3107800 & data$T3107800 <= 4999.0] <- 4000.0
data$T3107800[5000.0 <= data$T3107800 & data$T3107800 <= 5999.0] <- 5000.0
data$T3107800[6000.0 <= data$T3107800 & data$T3107800 <= 6999.0] <- 6000.0
data$T3107800[7000.0 <= data$T3107800 & data$T3107800 <= 7999.0] <- 7000.0
data$T3107800[8000.0 <= data$T3107800 & data$T3107800 <= 8999.0] <- 8000.0
data$T3107800[9000.0 <= data$T3107800 & data$T3107800 <= 9999.0] <- 9000.0
data$T3107800[10000.0 <= data$T3107800 & data$T3107800 <= 14999.0] <- 10000.0
data$T3107800[15000.0 <= data$T3107800 & data$T3107800 <= 19999.0] <- 15000.0
data$T3107800[20000.0 <= data$T3107800 & data$T3107800 <= 24999.0] <- 20000.0
data$T3107800[25000.0 <= data$T3107800 & data$T3107800 <= 49999.0] <- 25000.0
data$T3107800[50000.0 <= data$T3107800 & data$T3107800 <= 9.9999999E7] <- 50000.0
data$T3107800 <- factor(data$T3107800,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
labels=c("0",
"1 TO 999",
"1000 TO 1999",
"2000 TO 2999",
"3000 TO 3999",
"4000 TO 4999",
"5000 TO 5999",
"6000 TO 6999",
"7000 TO 7999",
"8000 TO 8999",
"9000 TO 9999",
"10000 TO 14999",
"15000 TO 19999",
"20000 TO 24999",
"25000 TO 49999",
"50000 TO 99999999: 50000+"))
data$T3115800[10.0 <= data$T3115800 & data$T3115800 <= 999.0] <- 10.0
data$T3115800 <- factor(data$T3115800,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T3308700[10.0 <= data$T3308700 & data$T3308700 <= 430.0] <- 10.0
data$T3308700[500.0 <= data$T3308700 & data$T3308700 <= 950.0] <- 500.0
data$T3308700[1000.0 <= data$T3308700 & data$T3308700 <= 1240.0] <- 1000.0
data$T3308700[1300.0 <= data$T3308700 & data$T3308700 <= 1560.0] <- 1300.0
data$T3308700[1600.0 <= data$T3308700 & data$T3308700 <= 1760.0] <- 1600.0
data$T3308700[1800.0 <= data$T3308700 & data$T3308700 <= 1860.0] <- 1800.0
data$T3308700[1900.0 <= data$T3308700 & data$T3308700 <= 1960.0] <- 1900.0
data$T3308700[2000.0 <= data$T3308700 & data$T3308700 <= 2060.0] <- 2000.0
data$T3308700[2100.0 <= data$T3308700 & data$T3308700 <= 2150.0] <- 2100.0
data$T3308700[2200.0 <= data$T3308700 & data$T3308700 <= 2340.0] <- 2200.0
data$T3308700[2400.0 <= data$T3308700 & data$T3308700 <= 2550.0] <- 2400.0
data$T3308700[2600.0 <= data$T3308700 & data$T3308700 <= 2760.0] <- 2600.0
data$T3308700[2800.0 <= data$T3308700 & data$T3308700 <= 2960.0] <- 2800.0
data$T3308700[3000.0 <= data$T3308700 & data$T3308700 <= 3260.0] <- 3000.0
data$T3308700[3300.0 <= data$T3308700 & data$T3308700 <= 3650.0] <- 3300.0
data$T3308700[3700.0 <= data$T3308700 & data$T3308700 <= 3950.0] <- 3700.0
data$T3308700[4000.0 <= data$T3308700 & data$T3308700 <= 4160.0] <- 4000.0
data$T3308700[4200.0 <= data$T3308700 & data$T3308700 <= 4250.0] <- 4200.0
data$T3308700[4300.0 <= data$T3308700 & data$T3308700 <= 4430.0] <- 4300.0
data$T3308700[4500.0 <= data$T3308700 & data$T3308700 <= 4650.0] <- 4500.0
data$T3308700[4700.0 <= data$T3308700 & data$T3308700 <= 4960.0] <- 4700.0
data$T3308700[5000.0 <= data$T3308700 & data$T3308700 <= 5930.0] <- 5000.0
data$T3308700[6000.0 <= data$T3308700 & data$T3308700 <= 6130.0] <- 6000.0
data$T3308700[6200.0 <= data$T3308700 & data$T3308700 <= 6940.0] <- 6200.0
data$T3308700[7000.0 <= data$T3308700 & data$T3308700 <= 7620.0] <- 7000.0
data$T3308700[7700.0 <= data$T3308700 & data$T3308700 <= 7750.0] <- 7700.0
data$T3308700[7800.0 <= data$T3308700 & data$T3308700 <= 7850.0] <- 7800.0
data$T3308700[7900.0 <= data$T3308700 & data$T3308700 <= 8960.0] <- 7900.0
data$T3308700[9000.0 <= data$T3308700 & data$T3308700 <= 9750.0] <- 9000.0
data$T3308700[9800.0 <= data$T3308700 & data$T3308700 <= 9830.0] <- 9800.0
data$T3308700 <- factor(data$T3308700,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T3308800[10.0 <= data$T3308800 & data$T3308800 <= 430.0] <- 10.0
data$T3308800[500.0 <= data$T3308800 & data$T3308800 <= 950.0] <- 500.0
data$T3308800[1000.0 <= data$T3308800 & data$T3308800 <= 1240.0] <- 1000.0
data$T3308800[1300.0 <= data$T3308800 & data$T3308800 <= 1560.0] <- 1300.0
data$T3308800[1600.0 <= data$T3308800 & data$T3308800 <= 1760.0] <- 1600.0
data$T3308800[1800.0 <= data$T3308800 & data$T3308800 <= 1860.0] <- 1800.0
data$T3308800[1900.0 <= data$T3308800 & data$T3308800 <= 1960.0] <- 1900.0
data$T3308800[2000.0 <= data$T3308800 & data$T3308800 <= 2060.0] <- 2000.0
data$T3308800[2100.0 <= data$T3308800 & data$T3308800 <= 2150.0] <- 2100.0
data$T3308800[2200.0 <= data$T3308800 & data$T3308800 <= 2340.0] <- 2200.0
data$T3308800[2400.0 <= data$T3308800 & data$T3308800 <= 2550.0] <- 2400.0
data$T3308800[2600.0 <= data$T3308800 & data$T3308800 <= 2760.0] <- 2600.0
data$T3308800[2800.0 <= data$T3308800 & data$T3308800 <= 2960.0] <- 2800.0
data$T3308800[3000.0 <= data$T3308800 & data$T3308800 <= 3260.0] <- 3000.0
data$T3308800[3300.0 <= data$T3308800 & data$T3308800 <= 3650.0] <- 3300.0
data$T3308800[3700.0 <= data$T3308800 & data$T3308800 <= 3950.0] <- 3700.0
data$T3308800[4000.0 <= data$T3308800 & data$T3308800 <= 4160.0] <- 4000.0
data$T3308800[4200.0 <= data$T3308800 & data$T3308800 <= 4250.0] <- 4200.0
data$T3308800[4300.0 <= data$T3308800 & data$T3308800 <= 4430.0] <- 4300.0
data$T3308800[4500.0 <= data$T3308800 & data$T3308800 <= 4650.0] <- 4500.0
data$T3308800[4700.0 <= data$T3308800 & data$T3308800 <= 4960.0] <- 4700.0
data$T3308800[5000.0 <= data$T3308800 & data$T3308800 <= 5930.0] <- 5000.0
data$T3308800[6000.0 <= data$T3308800 & data$T3308800 <= 6130.0] <- 6000.0
data$T3308800[6200.0 <= data$T3308800 & data$T3308800 <= 6940.0] <- 6200.0
data$T3308800[7000.0 <= data$T3308800 & data$T3308800 <= 7620.0] <- 7000.0
data$T3308800[7700.0 <= data$T3308800 & data$T3308800 <= 7750.0] <- 7700.0
data$T3308800[7800.0 <= data$T3308800 & data$T3308800 <= 7850.0] <- 7800.0
data$T3308800[7900.0 <= data$T3308800 & data$T3308800 <= 8960.0] <- 7900.0
data$T3308800[9000.0 <= data$T3308800 & data$T3308800 <= 9750.0] <- 9000.0
data$T3308800[9800.0 <= data$T3308800 & data$T3308800 <= 9830.0] <- 9800.0
data$T3308800 <- factor(data$T3308800,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T3308900[10.0 <= data$T3308900 & data$T3308900 <= 430.0] <- 10.0
data$T3308900[500.0 <= data$T3308900 & data$T3308900 <= 950.0] <- 500.0
data$T3308900[1000.0 <= data$T3308900 & data$T3308900 <= 1240.0] <- 1000.0
data$T3308900[1300.0 <= data$T3308900 & data$T3308900 <= 1560.0] <- 1300.0
data$T3308900[1600.0 <= data$T3308900 & data$T3308900 <= 1760.0] <- 1600.0
data$T3308900[1800.0 <= data$T3308900 & data$T3308900 <= 1860.0] <- 1800.0
data$T3308900[1900.0 <= data$T3308900 & data$T3308900 <= 1960.0] <- 1900.0
data$T3308900[2000.0 <= data$T3308900 & data$T3308900 <= 2060.0] <- 2000.0
data$T3308900[2100.0 <= data$T3308900 & data$T3308900 <= 2150.0] <- 2100.0
data$T3308900[2200.0 <= data$T3308900 & data$T3308900 <= 2340.0] <- 2200.0
data$T3308900[2400.0 <= data$T3308900 & data$T3308900 <= 2550.0] <- 2400.0
data$T3308900[2600.0 <= data$T3308900 & data$T3308900 <= 2760.0] <- 2600.0
data$T3308900[2800.0 <= data$T3308900 & data$T3308900 <= 2960.0] <- 2800.0
data$T3308900[3000.0 <= data$T3308900 & data$T3308900 <= 3260.0] <- 3000.0
data$T3308900[3300.0 <= data$T3308900 & data$T3308900 <= 3650.0] <- 3300.0
data$T3308900[3700.0 <= data$T3308900 & data$T3308900 <= 3950.0] <- 3700.0
data$T3308900[4000.0 <= data$T3308900 & data$T3308900 <= 4160.0] <- 4000.0
data$T3308900[4200.0 <= data$T3308900 & data$T3308900 <= 4250.0] <- 4200.0
data$T3308900[4300.0 <= data$T3308900 & data$T3308900 <= 4430.0] <- 4300.0
data$T3308900[4500.0 <= data$T3308900 & data$T3308900 <= 4650.0] <- 4500.0
data$T3308900[4700.0 <= data$T3308900 & data$T3308900 <= 4960.0] <- 4700.0
data$T3308900[5000.0 <= data$T3308900 & data$T3308900 <= 5930.0] <- 5000.0
data$T3308900[6000.0 <= data$T3308900 & data$T3308900 <= 6130.0] <- 6000.0
data$T3308900[6200.0 <= data$T3308900 & data$T3308900 <= 6940.0] <- 6200.0
data$T3308900[7000.0 <= data$T3308900 & data$T3308900 <= 7620.0] <- 7000.0
data$T3308900[7700.0 <= data$T3308900 & data$T3308900 <= 7750.0] <- 7700.0
data$T3308900[7800.0 <= data$T3308900 & data$T3308900 <= 7850.0] <- 7800.0
data$T3308900[7900.0 <= data$T3308900 & data$T3308900 <= 8960.0] <- 7900.0
data$T3308900[9000.0 <= data$T3308900 & data$T3308900 <= 9750.0] <- 9000.0
data$T3308900[9800.0 <= data$T3308900 & data$T3308900 <= 9830.0] <- 9800.0
data$T3308900 <- factor(data$T3308900,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T3309000[10.0 <= data$T3309000 & data$T3309000 <= 430.0] <- 10.0
data$T3309000[500.0 <= data$T3309000 & data$T3309000 <= 950.0] <- 500.0
data$T3309000[1000.0 <= data$T3309000 & data$T3309000 <= 1240.0] <- 1000.0
data$T3309000[1300.0 <= data$T3309000 & data$T3309000 <= 1560.0] <- 1300.0
data$T3309000[1600.0 <= data$T3309000 & data$T3309000 <= 1760.0] <- 1600.0
data$T3309000[1800.0 <= data$T3309000 & data$T3309000 <= 1860.0] <- 1800.0
data$T3309000[1900.0 <= data$T3309000 & data$T3309000 <= 1960.0] <- 1900.0
data$T3309000[2000.0 <= data$T3309000 & data$T3309000 <= 2060.0] <- 2000.0
data$T3309000[2100.0 <= data$T3309000 & data$T3309000 <= 2150.0] <- 2100.0
data$T3309000[2200.0 <= data$T3309000 & data$T3309000 <= 2340.0] <- 2200.0
data$T3309000[2400.0 <= data$T3309000 & data$T3309000 <= 2550.0] <- 2400.0
data$T3309000[2600.0 <= data$T3309000 & data$T3309000 <= 2760.0] <- 2600.0
data$T3309000[2800.0 <= data$T3309000 & data$T3309000 <= 2960.0] <- 2800.0
data$T3309000[3000.0 <= data$T3309000 & data$T3309000 <= 3260.0] <- 3000.0
data$T3309000[3300.0 <= data$T3309000 & data$T3309000 <= 3650.0] <- 3300.0
data$T3309000[3700.0 <= data$T3309000 & data$T3309000 <= 3950.0] <- 3700.0
data$T3309000[4000.0 <= data$T3309000 & data$T3309000 <= 4160.0] <- 4000.0
data$T3309000[4200.0 <= data$T3309000 & data$T3309000 <= 4250.0] <- 4200.0
data$T3309000[4300.0 <= data$T3309000 & data$T3309000 <= 4430.0] <- 4300.0
data$T3309000[4500.0 <= data$T3309000 & data$T3309000 <= 4650.0] <- 4500.0
data$T3309000[4700.0 <= data$T3309000 & data$T3309000 <= 4960.0] <- 4700.0
data$T3309000[5000.0 <= data$T3309000 & data$T3309000 <= 5930.0] <- 5000.0
data$T3309000[6000.0 <= data$T3309000 & data$T3309000 <= 6130.0] <- 6000.0
data$T3309000[6200.0 <= data$T3309000 & data$T3309000 <= 6940.0] <- 6200.0
data$T3309000[7000.0 <= data$T3309000 & data$T3309000 <= 7620.0] <- 7000.0
data$T3309000[7700.0 <= data$T3309000 & data$T3309000 <= 7750.0] <- 7700.0
data$T3309000[7800.0 <= data$T3309000 & data$T3309000 <= 7850.0] <- 7800.0
data$T3309000[7900.0 <= data$T3309000 & data$T3309000 <= 8960.0] <- 7900.0
data$T3309000[9000.0 <= data$T3309000 & data$T3309000 <= 9750.0] <- 9000.0
data$T3309000[9800.0 <= data$T3309000 & data$T3309000 <= 9830.0] <- 9800.0
data$T3309000 <- factor(data$T3309000,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T3309100[10.0 <= data$T3309100 & data$T3309100 <= 430.0] <- 10.0
data$T3309100[500.0 <= data$T3309100 & data$T3309100 <= 950.0] <- 500.0
data$T3309100[1000.0 <= data$T3309100 & data$T3309100 <= 1240.0] <- 1000.0
data$T3309100[1300.0 <= data$T3309100 & data$T3309100 <= 1560.0] <- 1300.0
data$T3309100[1600.0 <= data$T3309100 & data$T3309100 <= 1760.0] <- 1600.0
data$T3309100[1800.0 <= data$T3309100 & data$T3309100 <= 1860.0] <- 1800.0
data$T3309100[1900.0 <= data$T3309100 & data$T3309100 <= 1960.0] <- 1900.0
data$T3309100[2000.0 <= data$T3309100 & data$T3309100 <= 2060.0] <- 2000.0
data$T3309100[2100.0 <= data$T3309100 & data$T3309100 <= 2150.0] <- 2100.0
data$T3309100[2200.0 <= data$T3309100 & data$T3309100 <= 2340.0] <- 2200.0
data$T3309100[2400.0 <= data$T3309100 & data$T3309100 <= 2550.0] <- 2400.0
data$T3309100[2600.0 <= data$T3309100 & data$T3309100 <= 2760.0] <- 2600.0
data$T3309100[2800.0 <= data$T3309100 & data$T3309100 <= 2960.0] <- 2800.0
data$T3309100[3000.0 <= data$T3309100 & data$T3309100 <= 3260.0] <- 3000.0
data$T3309100[3300.0 <= data$T3309100 & data$T3309100 <= 3650.0] <- 3300.0
data$T3309100[3700.0 <= data$T3309100 & data$T3309100 <= 3950.0] <- 3700.0
data$T3309100[4000.0 <= data$T3309100 & data$T3309100 <= 4160.0] <- 4000.0
data$T3309100[4200.0 <= data$T3309100 & data$T3309100 <= 4250.0] <- 4200.0
data$T3309100[4300.0 <= data$T3309100 & data$T3309100 <= 4430.0] <- 4300.0
data$T3309100[4500.0 <= data$T3309100 & data$T3309100 <= 4650.0] <- 4500.0
data$T3309100[4700.0 <= data$T3309100 & data$T3309100 <= 4960.0] <- 4700.0
data$T3309100[5000.0 <= data$T3309100 & data$T3309100 <= 5930.0] <- 5000.0
data$T3309100[6000.0 <= data$T3309100 & data$T3309100 <= 6130.0] <- 6000.0
data$T3309100[6200.0 <= data$T3309100 & data$T3309100 <= 6940.0] <- 6200.0
data$T3309100[7000.0 <= data$T3309100 & data$T3309100 <= 7620.0] <- 7000.0
data$T3309100[7700.0 <= data$T3309100 & data$T3309100 <= 7750.0] <- 7700.0
data$T3309100[7800.0 <= data$T3309100 & data$T3309100 <= 7850.0] <- 7800.0
data$T3309100[7900.0 <= data$T3309100 & data$T3309100 <= 8960.0] <- 7900.0
data$T3309100[9000.0 <= data$T3309100 & data$T3309100 <= 9750.0] <- 9000.0
data$T3309100[9800.0 <= data$T3309100 & data$T3309100 <= 9830.0] <- 9800.0
data$T3309100 <- factor(data$T3309100,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T3958900[15.0 <= data$T3958900 & data$T3958900 <= 999.0] <- 15.0
data$T3958900 <- factor(data$T3958900,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 999: 15+"))
data$T4112200[10.0 <= data$T4112200 & data$T4112200 <= 999.0] <- 10.0
data$T4112200 <- factor(data$T4112200,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T4112300[1.0 <= data$T4112300 & data$T4112300 <= 999.0] <- 1.0
data$T4112300[1000.0 <= data$T4112300 & data$T4112300 <= 1999.0] <- 1000.0
data$T4112300[2000.0 <= data$T4112300 & data$T4112300 <= 2999.0] <- 2000.0
data$T4112300[3000.0 <= data$T4112300 & data$T4112300 <= 3999.0] <- 3000.0
data$T4112300[4000.0 <= data$T4112300 & data$T4112300 <= 4999.0] <- 4000.0
data$T4112300[5000.0 <= data$T4112300 & data$T4112300 <= 5999.0] <- 5000.0
data$T4112300[6000.0 <= data$T4112300 & data$T4112300 <= 6999.0] <- 6000.0
data$T4112300[7000.0 <= data$T4112300 & data$T4112300 <= 7999.0] <- 7000.0
data$T4112300[8000.0 <= data$T4112300 & data$T4112300 <= 8999.0] <- 8000.0
data$T4112300[9000.0 <= data$T4112300 & data$T4112300 <= 9999.0] <- 9000.0
data$T4112300[10000.0 <= data$T4112300 & data$T4112300 <= 14999.0] <- 10000.0
data$T4112300[15000.0 <= data$T4112300 & data$T4112300 <= 19999.0] <- 15000.0
data$T4112300[20000.0 <= data$T4112300 & data$T4112300 <= 24999.0] <- 20000.0
data$T4112300[25000.0 <= data$T4112300 & data$T4112300 <= 49999.0] <- 25000.0
data$T4112300[50000.0 <= data$T4112300 & data$T4112300 <= 9.9999999E7] <- 50000.0
data$T4112300 <- factor(data$T4112300,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
labels=c("0",
"1 TO 999",
"1000 TO 1999",
"2000 TO 2999",
"3000 TO 3999",
"4000 TO 4999",
"5000 TO 5999",
"6000 TO 6999",
"7000 TO 7999",
"8000 TO 8999",
"9000 TO 9999",
"10000 TO 14999",
"15000 TO 19999",
"20000 TO 24999",
"25000 TO 49999",
"50000 TO 99999999: 50000+"))
data$T4120300[10.0 <= data$T4120300 & data$T4120300 <= 999.0] <- 10.0
data$T4120300 <- factor(data$T4120300,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T4282800[10.0 <= data$T4282800 & data$T4282800 <= 430.0] <- 10.0
data$T4282800[500.0 <= data$T4282800 & data$T4282800 <= 950.0] <- 500.0
data$T4282800[1000.0 <= data$T4282800 & data$T4282800 <= 1240.0] <- 1000.0
data$T4282800[1300.0 <= data$T4282800 & data$T4282800 <= 1560.0] <- 1300.0
data$T4282800[1600.0 <= data$T4282800 & data$T4282800 <= 1760.0] <- 1600.0
data$T4282800[1800.0 <= data$T4282800 & data$T4282800 <= 1860.0] <- 1800.0
data$T4282800[1900.0 <= data$T4282800 & data$T4282800 <= 1960.0] <- 1900.0
data$T4282800[2000.0 <= data$T4282800 & data$T4282800 <= 2060.0] <- 2000.0
data$T4282800[2100.0 <= data$T4282800 & data$T4282800 <= 2150.0] <- 2100.0
data$T4282800[2200.0 <= data$T4282800 & data$T4282800 <= 2340.0] <- 2200.0
data$T4282800[2400.0 <= data$T4282800 & data$T4282800 <= 2550.0] <- 2400.0
data$T4282800[2600.0 <= data$T4282800 & data$T4282800 <= 2760.0] <- 2600.0
data$T4282800[2800.0 <= data$T4282800 & data$T4282800 <= 2960.0] <- 2800.0
data$T4282800[3000.0 <= data$T4282800 & data$T4282800 <= 3260.0] <- 3000.0
data$T4282800[3300.0 <= data$T4282800 & data$T4282800 <= 3650.0] <- 3300.0
data$T4282800[3700.0 <= data$T4282800 & data$T4282800 <= 3950.0] <- 3700.0
data$T4282800[4000.0 <= data$T4282800 & data$T4282800 <= 4160.0] <- 4000.0
data$T4282800[4200.0 <= data$T4282800 & data$T4282800 <= 4250.0] <- 4200.0
data$T4282800[4300.0 <= data$T4282800 & data$T4282800 <= 4430.0] <- 4300.0
data$T4282800[4500.0 <= data$T4282800 & data$T4282800 <= 4650.0] <- 4500.0
data$T4282800[4700.0 <= data$T4282800 & data$T4282800 <= 4960.0] <- 4700.0
data$T4282800[5000.0 <= data$T4282800 & data$T4282800 <= 5930.0] <- 5000.0
data$T4282800[6000.0 <= data$T4282800 & data$T4282800 <= 6130.0] <- 6000.0
data$T4282800[6200.0 <= data$T4282800 & data$T4282800 <= 6940.0] <- 6200.0
data$T4282800[7000.0 <= data$T4282800 & data$T4282800 <= 7620.0] <- 7000.0
data$T4282800[7700.0 <= data$T4282800 & data$T4282800 <= 7750.0] <- 7700.0
data$T4282800[7800.0 <= data$T4282800 & data$T4282800 <= 7850.0] <- 7800.0
data$T4282800[7900.0 <= data$T4282800 & data$T4282800 <= 8960.0] <- 7900.0
data$T4282800[9000.0 <= data$T4282800 & data$T4282800 <= 9750.0] <- 9000.0
data$T4282800[9800.0 <= data$T4282800 & data$T4282800 <= 9830.0] <- 9800.0
data$T4282800 <- factor(data$T4282800,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T4282900[10.0 <= data$T4282900 & data$T4282900 <= 430.0] <- 10.0
data$T4282900[500.0 <= data$T4282900 & data$T4282900 <= 950.0] <- 500.0
data$T4282900[1000.0 <= data$T4282900 & data$T4282900 <= 1240.0] <- 1000.0
data$T4282900[1300.0 <= data$T4282900 & data$T4282900 <= 1560.0] <- 1300.0
data$T4282900[1600.0 <= data$T4282900 & data$T4282900 <= 1760.0] <- 1600.0
data$T4282900[1800.0 <= data$T4282900 & data$T4282900 <= 1860.0] <- 1800.0
data$T4282900[1900.0 <= data$T4282900 & data$T4282900 <= 1960.0] <- 1900.0
data$T4282900[2000.0 <= data$T4282900 & data$T4282900 <= 2060.0] <- 2000.0
data$T4282900[2100.0 <= data$T4282900 & data$T4282900 <= 2150.0] <- 2100.0
data$T4282900[2200.0 <= data$T4282900 & data$T4282900 <= 2340.0] <- 2200.0
data$T4282900[2400.0 <= data$T4282900 & data$T4282900 <= 2550.0] <- 2400.0
data$T4282900[2600.0 <= data$T4282900 & data$T4282900 <= 2760.0] <- 2600.0
data$T4282900[2800.0 <= data$T4282900 & data$T4282900 <= 2960.0] <- 2800.0
data$T4282900[3000.0 <= data$T4282900 & data$T4282900 <= 3260.0] <- 3000.0
data$T4282900[3300.0 <= data$T4282900 & data$T4282900 <= 3650.0] <- 3300.0
data$T4282900[3700.0 <= data$T4282900 & data$T4282900 <= 3950.0] <- 3700.0
data$T4282900[4000.0 <= data$T4282900 & data$T4282900 <= 4160.0] <- 4000.0
data$T4282900[4200.0 <= data$T4282900 & data$T4282900 <= 4250.0] <- 4200.0
data$T4282900[4300.0 <= data$T4282900 & data$T4282900 <= 4430.0] <- 4300.0
data$T4282900[4500.0 <= data$T4282900 & data$T4282900 <= 4650.0] <- 4500.0
data$T4282900[4700.0 <= data$T4282900 & data$T4282900 <= 4960.0] <- 4700.0
data$T4282900[5000.0 <= data$T4282900 & data$T4282900 <= 5930.0] <- 5000.0
data$T4282900[6000.0 <= data$T4282900 & data$T4282900 <= 6130.0] <- 6000.0
data$T4282900[6200.0 <= data$T4282900 & data$T4282900 <= 6940.0] <- 6200.0
data$T4282900[7000.0 <= data$T4282900 & data$T4282900 <= 7620.0] <- 7000.0
data$T4282900[7700.0 <= data$T4282900 & data$T4282900 <= 7750.0] <- 7700.0
data$T4282900[7800.0 <= data$T4282900 & data$T4282900 <= 7850.0] <- 7800.0
data$T4282900[7900.0 <= data$T4282900 & data$T4282900 <= 8960.0] <- 7900.0
data$T4282900[9000.0 <= data$T4282900 & data$T4282900 <= 9750.0] <- 9000.0
data$T4282900[9800.0 <= data$T4282900 & data$T4282900 <= 9830.0] <- 9800.0
data$T4282900 <- factor(data$T4282900,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T4283000[10.0 <= data$T4283000 & data$T4283000 <= 430.0] <- 10.0
data$T4283000[500.0 <= data$T4283000 & data$T4283000 <= 950.0] <- 500.0
data$T4283000[1000.0 <= data$T4283000 & data$T4283000 <= 1240.0] <- 1000.0
data$T4283000[1300.0 <= data$T4283000 & data$T4283000 <= 1560.0] <- 1300.0
data$T4283000[1600.0 <= data$T4283000 & data$T4283000 <= 1760.0] <- 1600.0
data$T4283000[1800.0 <= data$T4283000 & data$T4283000 <= 1860.0] <- 1800.0
data$T4283000[1900.0 <= data$T4283000 & data$T4283000 <= 1960.0] <- 1900.0
data$T4283000[2000.0 <= data$T4283000 & data$T4283000 <= 2060.0] <- 2000.0
data$T4283000[2100.0 <= data$T4283000 & data$T4283000 <= 2150.0] <- 2100.0
data$T4283000[2200.0 <= data$T4283000 & data$T4283000 <= 2340.0] <- 2200.0
data$T4283000[2400.0 <= data$T4283000 & data$T4283000 <= 2550.0] <- 2400.0
data$T4283000[2600.0 <= data$T4283000 & data$T4283000 <= 2760.0] <- 2600.0
data$T4283000[2800.0 <= data$T4283000 & data$T4283000 <= 2960.0] <- 2800.0
data$T4283000[3000.0 <= data$T4283000 & data$T4283000 <= 3260.0] <- 3000.0
data$T4283000[3300.0 <= data$T4283000 & data$T4283000 <= 3650.0] <- 3300.0
data$T4283000[3700.0 <= data$T4283000 & data$T4283000 <= 3950.0] <- 3700.0
data$T4283000[4000.0 <= data$T4283000 & data$T4283000 <= 4160.0] <- 4000.0
data$T4283000[4200.0 <= data$T4283000 & data$T4283000 <= 4250.0] <- 4200.0
data$T4283000[4300.0 <= data$T4283000 & data$T4283000 <= 4430.0] <- 4300.0
data$T4283000[4500.0 <= data$T4283000 & data$T4283000 <= 4650.0] <- 4500.0
data$T4283000[4700.0 <= data$T4283000 & data$T4283000 <= 4960.0] <- 4700.0
data$T4283000[5000.0 <= data$T4283000 & data$T4283000 <= 5930.0] <- 5000.0
data$T4283000[6000.0 <= data$T4283000 & data$T4283000 <= 6130.0] <- 6000.0
data$T4283000[6200.0 <= data$T4283000 & data$T4283000 <= 6940.0] <- 6200.0
data$T4283000[7000.0 <= data$T4283000 & data$T4283000 <= 7620.0] <- 7000.0
data$T4283000[7700.0 <= data$T4283000 & data$T4283000 <= 7750.0] <- 7700.0
data$T4283000[7800.0 <= data$T4283000 & data$T4283000 <= 7850.0] <- 7800.0
data$T4283000[7900.0 <= data$T4283000 & data$T4283000 <= 8960.0] <- 7900.0
data$T4283000[9000.0 <= data$T4283000 & data$T4283000 <= 9750.0] <- 9000.0
data$T4283000[9800.0 <= data$T4283000 & data$T4283000 <= 9830.0] <- 9800.0
data$T4283000 <- factor(data$T4283000,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T4283100[10.0 <= data$T4283100 & data$T4283100 <= 430.0] <- 10.0
data$T4283100[500.0 <= data$T4283100 & data$T4283100 <= 950.0] <- 500.0
data$T4283100[1000.0 <= data$T4283100 & data$T4283100 <= 1240.0] <- 1000.0
data$T4283100[1300.0 <= data$T4283100 & data$T4283100 <= 1560.0] <- 1300.0
data$T4283100[1600.0 <= data$T4283100 & data$T4283100 <= 1760.0] <- 1600.0
data$T4283100[1800.0 <= data$T4283100 & data$T4283100 <= 1860.0] <- 1800.0
data$T4283100[1900.0 <= data$T4283100 & data$T4283100 <= 1960.0] <- 1900.0
data$T4283100[2000.0 <= data$T4283100 & data$T4283100 <= 2060.0] <- 2000.0
data$T4283100[2100.0 <= data$T4283100 & data$T4283100 <= 2150.0] <- 2100.0
data$T4283100[2200.0 <= data$T4283100 & data$T4283100 <= 2340.0] <- 2200.0
data$T4283100[2400.0 <= data$T4283100 & data$T4283100 <= 2550.0] <- 2400.0
data$T4283100[2600.0 <= data$T4283100 & data$T4283100 <= 2760.0] <- 2600.0
data$T4283100[2800.0 <= data$T4283100 & data$T4283100 <= 2960.0] <- 2800.0
data$T4283100[3000.0 <= data$T4283100 & data$T4283100 <= 3260.0] <- 3000.0
data$T4283100[3300.0 <= data$T4283100 & data$T4283100 <= 3650.0] <- 3300.0
data$T4283100[3700.0 <= data$T4283100 & data$T4283100 <= 3950.0] <- 3700.0
data$T4283100[4000.0 <= data$T4283100 & data$T4283100 <= 4160.0] <- 4000.0
data$T4283100[4200.0 <= data$T4283100 & data$T4283100 <= 4250.0] <- 4200.0
data$T4283100[4300.0 <= data$T4283100 & data$T4283100 <= 4430.0] <- 4300.0
data$T4283100[4500.0 <= data$T4283100 & data$T4283100 <= 4650.0] <- 4500.0
data$T4283100[4700.0 <= data$T4283100 & data$T4283100 <= 4960.0] <- 4700.0
data$T4283100[5000.0 <= data$T4283100 & data$T4283100 <= 5930.0] <- 5000.0
data$T4283100[6000.0 <= data$T4283100 & data$T4283100 <= 6130.0] <- 6000.0
data$T4283100[6200.0 <= data$T4283100 & data$T4283100 <= 6940.0] <- 6200.0
data$T4283100[7000.0 <= data$T4283100 & data$T4283100 <= 7620.0] <- 7000.0
data$T4283100[7700.0 <= data$T4283100 & data$T4283100 <= 7750.0] <- 7700.0
data$T4283100[7800.0 <= data$T4283100 & data$T4283100 <= 7850.0] <- 7800.0
data$T4283100[7900.0 <= data$T4283100 & data$T4283100 <= 8960.0] <- 7900.0
data$T4283100[9000.0 <= data$T4283100 & data$T4283100 <= 9750.0] <- 9000.0
data$T4283100[9800.0 <= data$T4283100 & data$T4283100 <= 9830.0] <- 9800.0
data$T4283100 <- factor(data$T4283100,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T4283200[10.0 <= data$T4283200 & data$T4283200 <= 430.0] <- 10.0
data$T4283200[500.0 <= data$T4283200 & data$T4283200 <= 950.0] <- 500.0
data$T4283200[1000.0 <= data$T4283200 & data$T4283200 <= 1240.0] <- 1000.0
data$T4283200[1300.0 <= data$T4283200 & data$T4283200 <= 1560.0] <- 1300.0
data$T4283200[1600.0 <= data$T4283200 & data$T4283200 <= 1760.0] <- 1600.0
data$T4283200[1800.0 <= data$T4283200 & data$T4283200 <= 1860.0] <- 1800.0
data$T4283200[1900.0 <= data$T4283200 & data$T4283200 <= 1960.0] <- 1900.0
data$T4283200[2000.0 <= data$T4283200 & data$T4283200 <= 2060.0] <- 2000.0
data$T4283200[2100.0 <= data$T4283200 & data$T4283200 <= 2150.0] <- 2100.0
data$T4283200[2200.0 <= data$T4283200 & data$T4283200 <= 2340.0] <- 2200.0
data$T4283200[2400.0 <= data$T4283200 & data$T4283200 <= 2550.0] <- 2400.0
data$T4283200[2600.0 <= data$T4283200 & data$T4283200 <= 2760.0] <- 2600.0
data$T4283200[2800.0 <= data$T4283200 & data$T4283200 <= 2960.0] <- 2800.0
data$T4283200[3000.0 <= data$T4283200 & data$T4283200 <= 3260.0] <- 3000.0
data$T4283200[3300.0 <= data$T4283200 & data$T4283200 <= 3650.0] <- 3300.0
data$T4283200[3700.0 <= data$T4283200 & data$T4283200 <= 3950.0] <- 3700.0
data$T4283200[4000.0 <= data$T4283200 & data$T4283200 <= 4160.0] <- 4000.0
data$T4283200[4200.0 <= data$T4283200 & data$T4283200 <= 4250.0] <- 4200.0
data$T4283200[4300.0 <= data$T4283200 & data$T4283200 <= 4430.0] <- 4300.0
data$T4283200[4500.0 <= data$T4283200 & data$T4283200 <= 4650.0] <- 4500.0
data$T4283200[4700.0 <= data$T4283200 & data$T4283200 <= 4960.0] <- 4700.0
data$T4283200[5000.0 <= data$T4283200 & data$T4283200 <= 5930.0] <- 5000.0
data$T4283200[6000.0 <= data$T4283200 & data$T4283200 <= 6130.0] <- 6000.0
data$T4283200[6200.0 <= data$T4283200 & data$T4283200 <= 6940.0] <- 6200.0
data$T4283200[7000.0 <= data$T4283200 & data$T4283200 <= 7620.0] <- 7000.0
data$T4283200[7700.0 <= data$T4283200 & data$T4283200 <= 7750.0] <- 7700.0
data$T4283200[7800.0 <= data$T4283200 & data$T4283200 <= 7850.0] <- 7800.0
data$T4283200[7900.0 <= data$T4283200 & data$T4283200 <= 8960.0] <- 7900.0
data$T4283200[9000.0 <= data$T4283200 & data$T4283200 <= 9750.0] <- 9000.0
data$T4283200[9800.0 <= data$T4283200 & data$T4283200 <= 9830.0] <- 9800.0
data$T4283200 <- factor(data$T4283200,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T4896600[15.0 <= data$T4896600 & data$T4896600 <= 999.0] <- 15.0
data$T4896600 <- factor(data$T4896600,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 999: 15+"))
data$T5022500[10.0 <= data$T5022500 & data$T5022500 <= 999.0] <- 10.0
data$T5022500 <- factor(data$T5022500,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T5022600[1.0 <= data$T5022600 & data$T5022600 <= 999.0] <- 1.0
data$T5022600[1000.0 <= data$T5022600 & data$T5022600 <= 1999.0] <- 1000.0
data$T5022600[2000.0 <= data$T5022600 & data$T5022600 <= 2999.0] <- 2000.0
data$T5022600[3000.0 <= data$T5022600 & data$T5022600 <= 3999.0] <- 3000.0
data$T5022600[4000.0 <= data$T5022600 & data$T5022600 <= 4999.0] <- 4000.0
data$T5022600[5000.0 <= data$T5022600 & data$T5022600 <= 5999.0] <- 5000.0
data$T5022600[6000.0 <= data$T5022600 & data$T5022600 <= 6999.0] <- 6000.0
data$T5022600[7000.0 <= data$T5022600 & data$T5022600 <= 7999.0] <- 7000.0
data$T5022600[8000.0 <= data$T5022600 & data$T5022600 <= 8999.0] <- 8000.0
data$T5022600[9000.0 <= data$T5022600 & data$T5022600 <= 9999.0] <- 9000.0
data$T5022600[10000.0 <= data$T5022600 & data$T5022600 <= 14999.0] <- 10000.0
data$T5022600[15000.0 <= data$T5022600 & data$T5022600 <= 19999.0] <- 15000.0
data$T5022600[20000.0 <= data$T5022600 & data$T5022600 <= 24999.0] <- 20000.0
data$T5022600[25000.0 <= data$T5022600 & data$T5022600 <= 49999.0] <- 25000.0
data$T5022600[50000.0 <= data$T5022600 & data$T5022600 <= 9.9999999E7] <- 50000.0
data$T5022600 <- factor(data$T5022600,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
labels=c("0",
"1 TO 999",
"1000 TO 1999",
"2000 TO 2999",
"3000 TO 3999",
"4000 TO 4999",
"5000 TO 5999",
"6000 TO 6999",
"7000 TO 7999",
"8000 TO 8999",
"9000 TO 9999",
"10000 TO 14999",
"15000 TO 19999",
"20000 TO 24999",
"25000 TO 49999",
"50000 TO 99999999: 50000+"))
data$T5031500[10.0 <= data$T5031500 & data$T5031500 <= 999.0] <- 10.0
data$T5031500 <- factor(data$T5031500,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T5256900[10.0 <= data$T5256900 & data$T5256900 <= 430.0] <- 10.0
data$T5256900[500.0 <= data$T5256900 & data$T5256900 <= 950.0] <- 500.0
data$T5256900[1000.0 <= data$T5256900 & data$T5256900 <= 1240.0] <- 1000.0
data$T5256900[1300.0 <= data$T5256900 & data$T5256900 <= 1560.0] <- 1300.0
data$T5256900[1600.0 <= data$T5256900 & data$T5256900 <= 1760.0] <- 1600.0
data$T5256900[1800.0 <= data$T5256900 & data$T5256900 <= 1860.0] <- 1800.0
data$T5256900[1900.0 <= data$T5256900 & data$T5256900 <= 1960.0] <- 1900.0
data$T5256900[2000.0 <= data$T5256900 & data$T5256900 <= 2060.0] <- 2000.0
data$T5256900[2100.0 <= data$T5256900 & data$T5256900 <= 2150.0] <- 2100.0
data$T5256900[2200.0 <= data$T5256900 & data$T5256900 <= 2340.0] <- 2200.0
data$T5256900[2400.0 <= data$T5256900 & data$T5256900 <= 2550.0] <- 2400.0
data$T5256900[2600.0 <= data$T5256900 & data$T5256900 <= 2760.0] <- 2600.0
data$T5256900[2800.0 <= data$T5256900 & data$T5256900 <= 2960.0] <- 2800.0
data$T5256900[3000.0 <= data$T5256900 & data$T5256900 <= 3260.0] <- 3000.0
data$T5256900[3300.0 <= data$T5256900 & data$T5256900 <= 3650.0] <- 3300.0
data$T5256900[3700.0 <= data$T5256900 & data$T5256900 <= 3950.0] <- 3700.0
data$T5256900[4000.0 <= data$T5256900 & data$T5256900 <= 4160.0] <- 4000.0
data$T5256900[4200.0 <= data$T5256900 & data$T5256900 <= 4250.0] <- 4200.0
data$T5256900[4300.0 <= data$T5256900 & data$T5256900 <= 4430.0] <- 4300.0
data$T5256900[4500.0 <= data$T5256900 & data$T5256900 <= 4650.0] <- 4500.0
data$T5256900[4700.0 <= data$T5256900 & data$T5256900 <= 4960.0] <- 4700.0
data$T5256900[5000.0 <= data$T5256900 & data$T5256900 <= 5930.0] <- 5000.0
data$T5256900[6000.0 <= data$T5256900 & data$T5256900 <= 6130.0] <- 6000.0
data$T5256900[6200.0 <= data$T5256900 & data$T5256900 <= 6940.0] <- 6200.0
data$T5256900[7000.0 <= data$T5256900 & data$T5256900 <= 7620.0] <- 7000.0
data$T5256900[7700.0 <= data$T5256900 & data$T5256900 <= 7750.0] <- 7700.0
data$T5256900[7800.0 <= data$T5256900 & data$T5256900 <= 7850.0] <- 7800.0
data$T5256900[7900.0 <= data$T5256900 & data$T5256900 <= 8960.0] <- 7900.0
data$T5256900[9000.0 <= data$T5256900 & data$T5256900 <= 9750.0] <- 9000.0
data$T5256900[9800.0 <= data$T5256900 & data$T5256900 <= 9830.0] <- 9800.0
data$T5256900 <- factor(data$T5256900,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T5257000[10.0 <= data$T5257000 & data$T5257000 <= 430.0] <- 10.0
data$T5257000[500.0 <= data$T5257000 & data$T5257000 <= 950.0] <- 500.0
data$T5257000[1000.0 <= data$T5257000 & data$T5257000 <= 1240.0] <- 1000.0
data$T5257000[1300.0 <= data$T5257000 & data$T5257000 <= 1560.0] <- 1300.0
data$T5257000[1600.0 <= data$T5257000 & data$T5257000 <= 1760.0] <- 1600.0
data$T5257000[1800.0 <= data$T5257000 & data$T5257000 <= 1860.0] <- 1800.0
data$T5257000[1900.0 <= data$T5257000 & data$T5257000 <= 1960.0] <- 1900.0
data$T5257000[2000.0 <= data$T5257000 & data$T5257000 <= 2060.0] <- 2000.0
data$T5257000[2100.0 <= data$T5257000 & data$T5257000 <= 2150.0] <- 2100.0
data$T5257000[2200.0 <= data$T5257000 & data$T5257000 <= 2340.0] <- 2200.0
data$T5257000[2400.0 <= data$T5257000 & data$T5257000 <= 2550.0] <- 2400.0
data$T5257000[2600.0 <= data$T5257000 & data$T5257000 <= 2760.0] <- 2600.0
data$T5257000[2800.0 <= data$T5257000 & data$T5257000 <= 2960.0] <- 2800.0
data$T5257000[3000.0 <= data$T5257000 & data$T5257000 <= 3260.0] <- 3000.0
data$T5257000[3300.0 <= data$T5257000 & data$T5257000 <= 3650.0] <- 3300.0
data$T5257000[3700.0 <= data$T5257000 & data$T5257000 <= 3950.0] <- 3700.0
data$T5257000[4000.0 <= data$T5257000 & data$T5257000 <= 4160.0] <- 4000.0
data$T5257000[4200.0 <= data$T5257000 & data$T5257000 <= 4250.0] <- 4200.0
data$T5257000[4300.0 <= data$T5257000 & data$T5257000 <= 4430.0] <- 4300.0
data$T5257000[4500.0 <= data$T5257000 & data$T5257000 <= 4650.0] <- 4500.0
data$T5257000[4700.0 <= data$T5257000 & data$T5257000 <= 4960.0] <- 4700.0
data$T5257000[5000.0 <= data$T5257000 & data$T5257000 <= 5930.0] <- 5000.0
data$T5257000[6000.0 <= data$T5257000 & data$T5257000 <= 6130.0] <- 6000.0
data$T5257000[6200.0 <= data$T5257000 & data$T5257000 <= 6940.0] <- 6200.0
data$T5257000[7000.0 <= data$T5257000 & data$T5257000 <= 7620.0] <- 7000.0
data$T5257000[7700.0 <= data$T5257000 & data$T5257000 <= 7750.0] <- 7700.0
data$T5257000[7800.0 <= data$T5257000 & data$T5257000 <= 7850.0] <- 7800.0
data$T5257000[7900.0 <= data$T5257000 & data$T5257000 <= 8960.0] <- 7900.0
data$T5257000[9000.0 <= data$T5257000 & data$T5257000 <= 9750.0] <- 9000.0
data$T5257000[9800.0 <= data$T5257000 & data$T5257000 <= 9830.0] <- 9800.0
data$T5257000 <- factor(data$T5257000,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T5257100[10.0 <= data$T5257100 & data$T5257100 <= 430.0] <- 10.0
data$T5257100[500.0 <= data$T5257100 & data$T5257100 <= 950.0] <- 500.0
data$T5257100[1000.0 <= data$T5257100 & data$T5257100 <= 1240.0] <- 1000.0
data$T5257100[1300.0 <= data$T5257100 & data$T5257100 <= 1560.0] <- 1300.0
data$T5257100[1600.0 <= data$T5257100 & data$T5257100 <= 1760.0] <- 1600.0
data$T5257100[1800.0 <= data$T5257100 & data$T5257100 <= 1860.0] <- 1800.0
data$T5257100[1900.0 <= data$T5257100 & data$T5257100 <= 1960.0] <- 1900.0
data$T5257100[2000.0 <= data$T5257100 & data$T5257100 <= 2060.0] <- 2000.0
data$T5257100[2100.0 <= data$T5257100 & data$T5257100 <= 2150.0] <- 2100.0
data$T5257100[2200.0 <= data$T5257100 & data$T5257100 <= 2340.0] <- 2200.0
data$T5257100[2400.0 <= data$T5257100 & data$T5257100 <= 2550.0] <- 2400.0
data$T5257100[2600.0 <= data$T5257100 & data$T5257100 <= 2760.0] <- 2600.0
data$T5257100[2800.0 <= data$T5257100 & data$T5257100 <= 2960.0] <- 2800.0
data$T5257100[3000.0 <= data$T5257100 & data$T5257100 <= 3260.0] <- 3000.0
data$T5257100[3300.0 <= data$T5257100 & data$T5257100 <= 3650.0] <- 3300.0
data$T5257100[3700.0 <= data$T5257100 & data$T5257100 <= 3950.0] <- 3700.0
data$T5257100[4000.0 <= data$T5257100 & data$T5257100 <= 4160.0] <- 4000.0
data$T5257100[4200.0 <= data$T5257100 & data$T5257100 <= 4250.0] <- 4200.0
data$T5257100[4300.0 <= data$T5257100 & data$T5257100 <= 4430.0] <- 4300.0
data$T5257100[4500.0 <= data$T5257100 & data$T5257100 <= 4650.0] <- 4500.0
data$T5257100[4700.0 <= data$T5257100 & data$T5257100 <= 4960.0] <- 4700.0
data$T5257100[5000.0 <= data$T5257100 & data$T5257100 <= 5930.0] <- 5000.0
data$T5257100[6000.0 <= data$T5257100 & data$T5257100 <= 6130.0] <- 6000.0
data$T5257100[6200.0 <= data$T5257100 & data$T5257100 <= 6940.0] <- 6200.0
data$T5257100[7000.0 <= data$T5257100 & data$T5257100 <= 7620.0] <- 7000.0
data$T5257100[7700.0 <= data$T5257100 & data$T5257100 <= 7750.0] <- 7700.0
data$T5257100[7800.0 <= data$T5257100 & data$T5257100 <= 7850.0] <- 7800.0
data$T5257100[7900.0 <= data$T5257100 & data$T5257100 <= 8960.0] <- 7900.0
data$T5257100[9000.0 <= data$T5257100 & data$T5257100 <= 9750.0] <- 9000.0
data$T5257100[9800.0 <= data$T5257100 & data$T5257100 <= 9830.0] <- 9800.0
data$T5257100 <- factor(data$T5257100,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T5257200[10.0 <= data$T5257200 & data$T5257200 <= 430.0] <- 10.0
data$T5257200[500.0 <= data$T5257200 & data$T5257200 <= 950.0] <- 500.0
data$T5257200[1000.0 <= data$T5257200 & data$T5257200 <= 1240.0] <- 1000.0
data$T5257200[1300.0 <= data$T5257200 & data$T5257200 <= 1560.0] <- 1300.0
data$T5257200[1600.0 <= data$T5257200 & data$T5257200 <= 1760.0] <- 1600.0
data$T5257200[1800.0 <= data$T5257200 & data$T5257200 <= 1860.0] <- 1800.0
data$T5257200[1900.0 <= data$T5257200 & data$T5257200 <= 1960.0] <- 1900.0
data$T5257200[2000.0 <= data$T5257200 & data$T5257200 <= 2060.0] <- 2000.0
data$T5257200[2100.0 <= data$T5257200 & data$T5257200 <= 2150.0] <- 2100.0
data$T5257200[2200.0 <= data$T5257200 & data$T5257200 <= 2340.0] <- 2200.0
data$T5257200[2400.0 <= data$T5257200 & data$T5257200 <= 2550.0] <- 2400.0
data$T5257200[2600.0 <= data$T5257200 & data$T5257200 <= 2760.0] <- 2600.0
data$T5257200[2800.0 <= data$T5257200 & data$T5257200 <= 2960.0] <- 2800.0
data$T5257200[3000.0 <= data$T5257200 & data$T5257200 <= 3260.0] <- 3000.0
data$T5257200[3300.0 <= data$T5257200 & data$T5257200 <= 3650.0] <- 3300.0
data$T5257200[3700.0 <= data$T5257200 & data$T5257200 <= 3950.0] <- 3700.0
data$T5257200[4000.0 <= data$T5257200 & data$T5257200 <= 4160.0] <- 4000.0
data$T5257200[4200.0 <= data$T5257200 & data$T5257200 <= 4250.0] <- 4200.0
data$T5257200[4300.0 <= data$T5257200 & data$T5257200 <= 4430.0] <- 4300.0
data$T5257200[4500.0 <= data$T5257200 & data$T5257200 <= 4650.0] <- 4500.0
data$T5257200[4700.0 <= data$T5257200 & data$T5257200 <= 4960.0] <- 4700.0
data$T5257200[5000.0 <= data$T5257200 & data$T5257200 <= 5930.0] <- 5000.0
data$T5257200[6000.0 <= data$T5257200 & data$T5257200 <= 6130.0] <- 6000.0
data$T5257200[6200.0 <= data$T5257200 & data$T5257200 <= 6940.0] <- 6200.0
data$T5257200[7000.0 <= data$T5257200 & data$T5257200 <= 7620.0] <- 7000.0
data$T5257200[7700.0 <= data$T5257200 & data$T5257200 <= 7750.0] <- 7700.0
data$T5257200[7800.0 <= data$T5257200 & data$T5257200 <= 7850.0] <- 7800.0
data$T5257200[7900.0 <= data$T5257200 & data$T5257200 <= 8960.0] <- 7900.0
data$T5257200[9000.0 <= data$T5257200 & data$T5257200 <= 9750.0] <- 9000.0
data$T5257200[9800.0 <= data$T5257200 & data$T5257200 <= 9830.0] <- 9800.0
data$T5257200 <- factor(data$T5257200,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T5257300[10.0 <= data$T5257300 & data$T5257300 <= 430.0] <- 10.0
data$T5257300[500.0 <= data$T5257300 & data$T5257300 <= 950.0] <- 500.0
data$T5257300[1000.0 <= data$T5257300 & data$T5257300 <= 1240.0] <- 1000.0
data$T5257300[1300.0 <= data$T5257300 & data$T5257300 <= 1560.0] <- 1300.0
data$T5257300[1600.0 <= data$T5257300 & data$T5257300 <= 1760.0] <- 1600.0
data$T5257300[1800.0 <= data$T5257300 & data$T5257300 <= 1860.0] <- 1800.0
data$T5257300[1900.0 <= data$T5257300 & data$T5257300 <= 1960.0] <- 1900.0
data$T5257300[2000.0 <= data$T5257300 & data$T5257300 <= 2060.0] <- 2000.0
data$T5257300[2100.0 <= data$T5257300 & data$T5257300 <= 2150.0] <- 2100.0
data$T5257300[2200.0 <= data$T5257300 & data$T5257300 <= 2340.0] <- 2200.0
data$T5257300[2400.0 <= data$T5257300 & data$T5257300 <= 2550.0] <- 2400.0
data$T5257300[2600.0 <= data$T5257300 & data$T5257300 <= 2760.0] <- 2600.0
data$T5257300[2800.0 <= data$T5257300 & data$T5257300 <= 2960.0] <- 2800.0
data$T5257300[3000.0 <= data$T5257300 & data$T5257300 <= 3260.0] <- 3000.0
data$T5257300[3300.0 <= data$T5257300 & data$T5257300 <= 3650.0] <- 3300.0
data$T5257300[3700.0 <= data$T5257300 & data$T5257300 <= 3950.0] <- 3700.0
data$T5257300[4000.0 <= data$T5257300 & data$T5257300 <= 4160.0] <- 4000.0
data$T5257300[4200.0 <= data$T5257300 & data$T5257300 <= 4250.0] <- 4200.0
data$T5257300[4300.0 <= data$T5257300 & data$T5257300 <= 4430.0] <- 4300.0
data$T5257300[4500.0 <= data$T5257300 & data$T5257300 <= 4650.0] <- 4500.0
data$T5257300[4700.0 <= data$T5257300 & data$T5257300 <= 4960.0] <- 4700.0
data$T5257300[5000.0 <= data$T5257300 & data$T5257300 <= 5930.0] <- 5000.0
data$T5257300[6000.0 <= data$T5257300 & data$T5257300 <= 6130.0] <- 6000.0
data$T5257300[6200.0 <= data$T5257300 & data$T5257300 <= 6940.0] <- 6200.0
data$T5257300[7000.0 <= data$T5257300 & data$T5257300 <= 7620.0] <- 7000.0
data$T5257300[7700.0 <= data$T5257300 & data$T5257300 <= 7750.0] <- 7700.0
data$T5257300[7800.0 <= data$T5257300 & data$T5257300 <= 7850.0] <- 7800.0
data$T5257300[7900.0 <= data$T5257300 & data$T5257300 <= 8960.0] <- 7900.0
data$T5257300[9000.0 <= data$T5257300 & data$T5257300 <= 9750.0] <- 9000.0
data$T5257300[9800.0 <= data$T5257300 & data$T5257300 <= 9830.0] <- 9800.0
data$T5257300 <- factor(data$T5257300,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T5600600[15.0 <= data$T5600600 & data$T5600600 <= 999.0] <- 15.0
data$T5600600 <- factor(data$T5600600,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 999: 15+"))
data$T5770700[10.0 <= data$T5770700 & data$T5770700 <= 999.0] <- 10.0
data$T5770700 <- factor(data$T5770700,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T5770800[1.0 <= data$T5770800 & data$T5770800 <= 999.0] <- 1.0
data$T5770800[1000.0 <= data$T5770800 & data$T5770800 <= 1999.0] <- 1000.0
data$T5770800[2000.0 <= data$T5770800 & data$T5770800 <= 2999.0] <- 2000.0
data$T5770800[3000.0 <= data$T5770800 & data$T5770800 <= 3999.0] <- 3000.0
data$T5770800[4000.0 <= data$T5770800 & data$T5770800 <= 4999.0] <- 4000.0
data$T5770800[5000.0 <= data$T5770800 & data$T5770800 <= 5999.0] <- 5000.0
data$T5770800[6000.0 <= data$T5770800 & data$T5770800 <= 6999.0] <- 6000.0
data$T5770800[7000.0 <= data$T5770800 & data$T5770800 <= 7999.0] <- 7000.0
data$T5770800[8000.0 <= data$T5770800 & data$T5770800 <= 8999.0] <- 8000.0
data$T5770800[9000.0 <= data$T5770800 & data$T5770800 <= 9999.0] <- 9000.0
data$T5770800[10000.0 <= data$T5770800 & data$T5770800 <= 14999.0] <- 10000.0
data$T5770800[15000.0 <= data$T5770800 & data$T5770800 <= 19999.0] <- 15000.0
data$T5770800[20000.0 <= data$T5770800 & data$T5770800 <= 24999.0] <- 20000.0
data$T5770800[25000.0 <= data$T5770800 & data$T5770800 <= 49999.0] <- 25000.0
data$T5770800[50000.0 <= data$T5770800 & data$T5770800 <= 9.9999999E7] <- 50000.0
data$T5770800 <- factor(data$T5770800,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
labels=c("0",
"1 TO 999",
"1000 TO 1999",
"2000 TO 2999",
"3000 TO 3999",
"4000 TO 4999",
"5000 TO 5999",
"6000 TO 6999",
"7000 TO 7999",
"8000 TO 8999",
"9000 TO 9999",
"10000 TO 14999",
"15000 TO 19999",
"20000 TO 24999",
"25000 TO 49999",
"50000 TO 99999999: 50000+"))
data$T5779700[10.0 <= data$T5779700 & data$T5779700 <= 999.0] <- 10.0
data$T5779700 <- factor(data$T5779700,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T8428300[10.0 <= data$T8428300 & data$T8428300 <= 430.0] <- 10.0
data$T8428300[500.0 <= data$T8428300 & data$T8428300 <= 950.0] <- 500.0
data$T8428300[1000.0 <= data$T8428300 & data$T8428300 <= 1240.0] <- 1000.0
data$T8428300[1300.0 <= data$T8428300 & data$T8428300 <= 1560.0] <- 1300.0
data$T8428300[1600.0 <= data$T8428300 & data$T8428300 <= 1760.0] <- 1600.0
data$T8428300[1800.0 <= data$T8428300 & data$T8428300 <= 1860.0] <- 1800.0
data$T8428300[1900.0 <= data$T8428300 & data$T8428300 <= 1960.0] <- 1900.0
data$T8428300[2000.0 <= data$T8428300 & data$T8428300 <= 2060.0] <- 2000.0
data$T8428300[2100.0 <= data$T8428300 & data$T8428300 <= 2150.0] <- 2100.0
data$T8428300[2200.0 <= data$T8428300 & data$T8428300 <= 2340.0] <- 2200.0
data$T8428300[2400.0 <= data$T8428300 & data$T8428300 <= 2550.0] <- 2400.0
data$T8428300[2600.0 <= data$T8428300 & data$T8428300 <= 2760.0] <- 2600.0
data$T8428300[2800.0 <= data$T8428300 & data$T8428300 <= 2960.0] <- 2800.0
data$T8428300[3000.0 <= data$T8428300 & data$T8428300 <= 3260.0] <- 3000.0
data$T8428300[3300.0 <= data$T8428300 & data$T8428300 <= 3650.0] <- 3300.0
data$T8428300[3700.0 <= data$T8428300 & data$T8428300 <= 3950.0] <- 3700.0
data$T8428300[4000.0 <= data$T8428300 & data$T8428300 <= 4160.0] <- 4000.0
data$T8428300[4200.0 <= data$T8428300 & data$T8428300 <= 4250.0] <- 4200.0
data$T8428300[4300.0 <= data$T8428300 & data$T8428300 <= 4430.0] <- 4300.0
data$T8428300[4500.0 <= data$T8428300 & data$T8428300 <= 4650.0] <- 4500.0
data$T8428300[4700.0 <= data$T8428300 & data$T8428300 <= 4960.0] <- 4700.0
data$T8428300[5000.0 <= data$T8428300 & data$T8428300 <= 5930.0] <- 5000.0
data$T8428300[6000.0 <= data$T8428300 & data$T8428300 <= 6130.0] <- 6000.0
data$T8428300[6200.0 <= data$T8428300 & data$T8428300 <= 6940.0] <- 6200.0
data$T8428300[7000.0 <= data$T8428300 & data$T8428300 <= 7620.0] <- 7000.0
data$T8428300[7700.0 <= data$T8428300 & data$T8428300 <= 7750.0] <- 7700.0
data$T8428300[7800.0 <= data$T8428300 & data$T8428300 <= 7850.0] <- 7800.0
data$T8428300[7900.0 <= data$T8428300 & data$T8428300 <= 8960.0] <- 7900.0
data$T8428300[9000.0 <= data$T8428300 & data$T8428300 <= 9750.0] <- 9000.0
data$T8428300[9800.0 <= data$T8428300 & data$T8428300 <= 9830.0] <- 9800.0
data$T8428300 <- factor(data$T8428300,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8428400[10.0 <= data$T8428400 & data$T8428400 <= 430.0] <- 10.0
data$T8428400[500.0 <= data$T8428400 & data$T8428400 <= 950.0] <- 500.0
data$T8428400[1000.0 <= data$T8428400 & data$T8428400 <= 1240.0] <- 1000.0
data$T8428400[1300.0 <= data$T8428400 & data$T8428400 <= 1560.0] <- 1300.0
data$T8428400[1600.0 <= data$T8428400 & data$T8428400 <= 1760.0] <- 1600.0
data$T8428400[1800.0 <= data$T8428400 & data$T8428400 <= 1860.0] <- 1800.0
data$T8428400[1900.0 <= data$T8428400 & data$T8428400 <= 1960.0] <- 1900.0
data$T8428400[2000.0 <= data$T8428400 & data$T8428400 <= 2060.0] <- 2000.0
data$T8428400[2100.0 <= data$T8428400 & data$T8428400 <= 2150.0] <- 2100.0
data$T8428400[2200.0 <= data$T8428400 & data$T8428400 <= 2340.0] <- 2200.0
data$T8428400[2400.0 <= data$T8428400 & data$T8428400 <= 2550.0] <- 2400.0
data$T8428400[2600.0 <= data$T8428400 & data$T8428400 <= 2760.0] <- 2600.0
data$T8428400[2800.0 <= data$T8428400 & data$T8428400 <= 2960.0] <- 2800.0
data$T8428400[3000.0 <= data$T8428400 & data$T8428400 <= 3260.0] <- 3000.0
data$T8428400[3300.0 <= data$T8428400 & data$T8428400 <= 3650.0] <- 3300.0
data$T8428400[3700.0 <= data$T8428400 & data$T8428400 <= 3950.0] <- 3700.0
data$T8428400[4000.0 <= data$T8428400 & data$T8428400 <= 4160.0] <- 4000.0
data$T8428400[4200.0 <= data$T8428400 & data$T8428400 <= 4250.0] <- 4200.0
data$T8428400[4300.0 <= data$T8428400 & data$T8428400 <= 4430.0] <- 4300.0
data$T8428400[4500.0 <= data$T8428400 & data$T8428400 <= 4650.0] <- 4500.0
data$T8428400[4700.0 <= data$T8428400 & data$T8428400 <= 4960.0] <- 4700.0
data$T8428400[5000.0 <= data$T8428400 & data$T8428400 <= 5930.0] <- 5000.0
data$T8428400[6000.0 <= data$T8428400 & data$T8428400 <= 6130.0] <- 6000.0
data$T8428400[6200.0 <= data$T8428400 & data$T8428400 <= 6940.0] <- 6200.0
data$T8428400[7000.0 <= data$T8428400 & data$T8428400 <= 7620.0] <- 7000.0
data$T8428400[7700.0 <= data$T8428400 & data$T8428400 <= 7750.0] <- 7700.0
data$T8428400[7800.0 <= data$T8428400 & data$T8428400 <= 7850.0] <- 7800.0
data$T8428400[7900.0 <= data$T8428400 & data$T8428400 <= 8960.0] <- 7900.0
data$T8428400[9000.0 <= data$T8428400 & data$T8428400 <= 9750.0] <- 9000.0
data$T8428400[9800.0 <= data$T8428400 & data$T8428400 <= 9830.0] <- 9800.0
data$T8428400 <- factor(data$T8428400,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8428500[10.0 <= data$T8428500 & data$T8428500 <= 430.0] <- 10.0
data$T8428500[500.0 <= data$T8428500 & data$T8428500 <= 950.0] <- 500.0
data$T8428500[1000.0 <= data$T8428500 & data$T8428500 <= 1240.0] <- 1000.0
data$T8428500[1300.0 <= data$T8428500 & data$T8428500 <= 1560.0] <- 1300.0
data$T8428500[1600.0 <= data$T8428500 & data$T8428500 <= 1760.0] <- 1600.0
data$T8428500[1800.0 <= data$T8428500 & data$T8428500 <= 1860.0] <- 1800.0
data$T8428500[1900.0 <= data$T8428500 & data$T8428500 <= 1960.0] <- 1900.0
data$T8428500[2000.0 <= data$T8428500 & data$T8428500 <= 2060.0] <- 2000.0
data$T8428500[2100.0 <= data$T8428500 & data$T8428500 <= 2150.0] <- 2100.0
data$T8428500[2200.0 <= data$T8428500 & data$T8428500 <= 2340.0] <- 2200.0
data$T8428500[2400.0 <= data$T8428500 & data$T8428500 <= 2550.0] <- 2400.0
data$T8428500[2600.0 <= data$T8428500 & data$T8428500 <= 2760.0] <- 2600.0
data$T8428500[2800.0 <= data$T8428500 & data$T8428500 <= 2960.0] <- 2800.0
data$T8428500[3000.0 <= data$T8428500 & data$T8428500 <= 3260.0] <- 3000.0
data$T8428500[3300.0 <= data$T8428500 & data$T8428500 <= 3650.0] <- 3300.0
data$T8428500[3700.0 <= data$T8428500 & data$T8428500 <= 3950.0] <- 3700.0
data$T8428500[4000.0 <= data$T8428500 & data$T8428500 <= 4160.0] <- 4000.0
data$T8428500[4200.0 <= data$T8428500 & data$T8428500 <= 4250.0] <- 4200.0
data$T8428500[4300.0 <= data$T8428500 & data$T8428500 <= 4430.0] <- 4300.0
data$T8428500[4500.0 <= data$T8428500 & data$T8428500 <= 4650.0] <- 4500.0
data$T8428500[4700.0 <= data$T8428500 & data$T8428500 <= 4960.0] <- 4700.0
data$T8428500[5000.0 <= data$T8428500 & data$T8428500 <= 5930.0] <- 5000.0
data$T8428500[6000.0 <= data$T8428500 & data$T8428500 <= 6130.0] <- 6000.0
data$T8428500[6200.0 <= data$T8428500 & data$T8428500 <= 6940.0] <- 6200.0
data$T8428500[7000.0 <= data$T8428500 & data$T8428500 <= 7620.0] <- 7000.0
data$T8428500[7700.0 <= data$T8428500 & data$T8428500 <= 7750.0] <- 7700.0
data$T8428500[7800.0 <= data$T8428500 & data$T8428500 <= 7850.0] <- 7800.0
data$T8428500[7900.0 <= data$T8428500 & data$T8428500 <= 8960.0] <- 7900.0
data$T8428500[9000.0 <= data$T8428500 & data$T8428500 <= 9750.0] <- 9000.0
data$T8428500[9800.0 <= data$T8428500 & data$T8428500 <= 9830.0] <- 9800.0
data$T8428500 <- factor(data$T8428500,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8428600[10.0 <= data$T8428600 & data$T8428600 <= 430.0] <- 10.0
data$T8428600[500.0 <= data$T8428600 & data$T8428600 <= 950.0] <- 500.0
data$T8428600[1000.0 <= data$T8428600 & data$T8428600 <= 1240.0] <- 1000.0
data$T8428600[1300.0 <= data$T8428600 & data$T8428600 <= 1560.0] <- 1300.0
data$T8428600[1600.0 <= data$T8428600 & data$T8428600 <= 1760.0] <- 1600.0
data$T8428600[1800.0 <= data$T8428600 & data$T8428600 <= 1860.0] <- 1800.0
data$T8428600[1900.0 <= data$T8428600 & data$T8428600 <= 1960.0] <- 1900.0
data$T8428600[2000.0 <= data$T8428600 & data$T8428600 <= 2060.0] <- 2000.0
data$T8428600[2100.0 <= data$T8428600 & data$T8428600 <= 2150.0] <- 2100.0
data$T8428600[2200.0 <= data$T8428600 & data$T8428600 <= 2340.0] <- 2200.0
data$T8428600[2400.0 <= data$T8428600 & data$T8428600 <= 2550.0] <- 2400.0
data$T8428600[2600.0 <= data$T8428600 & data$T8428600 <= 2760.0] <- 2600.0
data$T8428600[2800.0 <= data$T8428600 & data$T8428600 <= 2960.0] <- 2800.0
data$T8428600[3000.0 <= data$T8428600 & data$T8428600 <= 3260.0] <- 3000.0
data$T8428600[3300.0 <= data$T8428600 & data$T8428600 <= 3650.0] <- 3300.0
data$T8428600[3700.0 <= data$T8428600 & data$T8428600 <= 3950.0] <- 3700.0
data$T8428600[4000.0 <= data$T8428600 & data$T8428600 <= 4160.0] <- 4000.0
data$T8428600[4200.0 <= data$T8428600 & data$T8428600 <= 4250.0] <- 4200.0
data$T8428600[4300.0 <= data$T8428600 & data$T8428600 <= 4430.0] <- 4300.0
data$T8428600[4500.0 <= data$T8428600 & data$T8428600 <= 4650.0] <- 4500.0
data$T8428600[4700.0 <= data$T8428600 & data$T8428600 <= 4960.0] <- 4700.0
data$T8428600[5000.0 <= data$T8428600 & data$T8428600 <= 5930.0] <- 5000.0
data$T8428600[6000.0 <= data$T8428600 & data$T8428600 <= 6130.0] <- 6000.0
data$T8428600[6200.0 <= data$T8428600 & data$T8428600 <= 6940.0] <- 6200.0
data$T8428600[7000.0 <= data$T8428600 & data$T8428600 <= 7620.0] <- 7000.0
data$T8428600[7700.0 <= data$T8428600 & data$T8428600 <= 7750.0] <- 7700.0
data$T8428600[7800.0 <= data$T8428600 & data$T8428600 <= 7850.0] <- 7800.0
data$T8428600[7900.0 <= data$T8428600 & data$T8428600 <= 8960.0] <- 7900.0
data$T8428600[9000.0 <= data$T8428600 & data$T8428600 <= 9750.0] <- 9000.0
data$T8428600[9800.0 <= data$T8428600 & data$T8428600 <= 9830.0] <- 9800.0
data$T8428600 <- factor(data$T8428600,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8428700[10.0 <= data$T8428700 & data$T8428700 <= 430.0] <- 10.0
data$T8428700[500.0 <= data$T8428700 & data$T8428700 <= 950.0] <- 500.0
data$T8428700[1000.0 <= data$T8428700 & data$T8428700 <= 1240.0] <- 1000.0
data$T8428700[1300.0 <= data$T8428700 & data$T8428700 <= 1560.0] <- 1300.0
data$T8428700[1600.0 <= data$T8428700 & data$T8428700 <= 1760.0] <- 1600.0
data$T8428700[1800.0 <= data$T8428700 & data$T8428700 <= 1860.0] <- 1800.0
data$T8428700[1900.0 <= data$T8428700 & data$T8428700 <= 1960.0] <- 1900.0
data$T8428700[2000.0 <= data$T8428700 & data$T8428700 <= 2060.0] <- 2000.0
data$T8428700[2100.0 <= data$T8428700 & data$T8428700 <= 2150.0] <- 2100.0
data$T8428700[2200.0 <= data$T8428700 & data$T8428700 <= 2340.0] <- 2200.0
data$T8428700[2400.0 <= data$T8428700 & data$T8428700 <= 2550.0] <- 2400.0
data$T8428700[2600.0 <= data$T8428700 & data$T8428700 <= 2760.0] <- 2600.0
data$T8428700[2800.0 <= data$T8428700 & data$T8428700 <= 2960.0] <- 2800.0
data$T8428700[3000.0 <= data$T8428700 & data$T8428700 <= 3260.0] <- 3000.0
data$T8428700[3300.0 <= data$T8428700 & data$T8428700 <= 3650.0] <- 3300.0
data$T8428700[3700.0 <= data$T8428700 & data$T8428700 <= 3950.0] <- 3700.0
data$T8428700[4000.0 <= data$T8428700 & data$T8428700 <= 4160.0] <- 4000.0
data$T8428700[4200.0 <= data$T8428700 & data$T8428700 <= 4250.0] <- 4200.0
data$T8428700[4300.0 <= data$T8428700 & data$T8428700 <= 4430.0] <- 4300.0
data$T8428700[4500.0 <= data$T8428700 & data$T8428700 <= 4650.0] <- 4500.0
data$T8428700[4700.0 <= data$T8428700 & data$T8428700 <= 4960.0] <- 4700.0
data$T8428700[5000.0 <= data$T8428700 & data$T8428700 <= 5930.0] <- 5000.0
data$T8428700[6000.0 <= data$T8428700 & data$T8428700 <= 6130.0] <- 6000.0
data$T8428700[6200.0 <= data$T8428700 & data$T8428700 <= 6940.0] <- 6200.0
data$T8428700[7000.0 <= data$T8428700 & data$T8428700 <= 7620.0] <- 7000.0
data$T8428700[7700.0 <= data$T8428700 & data$T8428700 <= 7750.0] <- 7700.0
data$T8428700[7800.0 <= data$T8428700 & data$T8428700 <= 7850.0] <- 7800.0
data$T8428700[7900.0 <= data$T8428700 & data$T8428700 <= 8960.0] <- 7900.0
data$T8428700[9000.0 <= data$T8428700 & data$T8428700 <= 9750.0] <- 9000.0
data$T8428700[9800.0 <= data$T8428700 & data$T8428700 <= 9830.0] <- 9800.0
data$T8428700 <- factor(data$T8428700,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8625300[15.0 <= data$T8625300 & data$T8625300 <= 99.0] <- 15.0
data$T8625300 <- factor(data$T8625300,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 99: 15+"))
data$T8787800[10.0 <= data$T8787800 & data$T8787800 <= 999.0] <- 10.0
data$T8787800 <- factor(data$T8787800,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T8787900[1.0 <= data$T8787900 & data$T8787900 <= 999.0] <- 1.0
data$T8787900[1000.0 <= data$T8787900 & data$T8787900 <= 1999.0] <- 1000.0
data$T8787900[2000.0 <= data$T8787900 & data$T8787900 <= 2999.0] <- 2000.0
data$T8787900[3000.0 <= data$T8787900 & data$T8787900 <= 3999.0] <- 3000.0
data$T8787900[4000.0 <= data$T8787900 & data$T8787900 <= 4999.0] <- 4000.0
data$T8787900[5000.0 <= data$T8787900 & data$T8787900 <= 5999.0] <- 5000.0
data$T8787900[6000.0 <= data$T8787900 & data$T8787900 <= 6999.0] <- 6000.0
data$T8787900[7000.0 <= data$T8787900 & data$T8787900 <= 7999.0] <- 7000.0
data$T8787900[8000.0 <= data$T8787900 & data$T8787900 <= 8999.0] <- 8000.0
data$T8787900[9000.0 <= data$T8787900 & data$T8787900 <= 9999.0] <- 9000.0
data$T8787900[10000.0 <= data$T8787900 & data$T8787900 <= 14999.0] <- 10000.0
data$T8787900[15000.0 <= data$T8787900 & data$T8787900 <= 19999.0] <- 15000.0
data$T8787900[20000.0 <= data$T8787900 & data$T8787900 <= 24999.0] <- 20000.0
data$T8787900[25000.0 <= data$T8787900 & data$T8787900 <= 49999.0] <- 25000.0
data$T8787900[50000.0 <= data$T8787900 & data$T8787900 <= 9.9999999E7] <- 50000.0
data$T8787900 <- factor(data$T8787900,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
labels=c("0",
"1 TO 999",
"1000 TO 1999",
"2000 TO 2999",
"3000 TO 3999",
"4000 TO 4999",
"5000 TO 5999",
"6000 TO 6999",
"7000 TO 7999",
"8000 TO 8999",
"9000 TO 9999",
"10000 TO 14999",
"15000 TO 19999",
"20000 TO 24999",
"25000 TO 49999",
"50000 TO 99999999: 50000+"))
data$T8796100[10.0 <= data$T8796100 & data$T8796100 <= 999.0] <- 10.0
data$T8796100 <- factor(data$T8796100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T8982400[10.0 <= data$T8982400 & data$T8982400 <= 430.0] <- 10.0
data$T8982400[500.0 <= data$T8982400 & data$T8982400 <= 950.0] <- 500.0
data$T8982400[1000.0 <= data$T8982400 & data$T8982400 <= 1240.0] <- 1000.0
data$T8982400[1300.0 <= data$T8982400 & data$T8982400 <= 1560.0] <- 1300.0
data$T8982400[1600.0 <= data$T8982400 & data$T8982400 <= 1760.0] <- 1600.0
data$T8982400[1800.0 <= data$T8982400 & data$T8982400 <= 1860.0] <- 1800.0
data$T8982400[1900.0 <= data$T8982400 & data$T8982400 <= 1960.0] <- 1900.0
data$T8982400[2000.0 <= data$T8982400 & data$T8982400 <= 2060.0] <- 2000.0
data$T8982400[2100.0 <= data$T8982400 & data$T8982400 <= 2150.0] <- 2100.0
data$T8982400[2200.0 <= data$T8982400 & data$T8982400 <= 2340.0] <- 2200.0
data$T8982400[2400.0 <= data$T8982400 & data$T8982400 <= 2550.0] <- 2400.0
data$T8982400[2600.0 <= data$T8982400 & data$T8982400 <= 2760.0] <- 2600.0
data$T8982400[2800.0 <= data$T8982400 & data$T8982400 <= 2960.0] <- 2800.0
data$T8982400[3000.0 <= data$T8982400 & data$T8982400 <= 3260.0] <- 3000.0
data$T8982400[3300.0 <= data$T8982400 & data$T8982400 <= 3650.0] <- 3300.0
data$T8982400[3700.0 <= data$T8982400 & data$T8982400 <= 3950.0] <- 3700.0
data$T8982400[4000.0 <= data$T8982400 & data$T8982400 <= 4160.0] <- 4000.0
data$T8982400[4200.0 <= data$T8982400 & data$T8982400 <= 4250.0] <- 4200.0
data$T8982400[4300.0 <= data$T8982400 & data$T8982400 <= 4430.0] <- 4300.0
data$T8982400[4500.0 <= data$T8982400 & data$T8982400 <= 4650.0] <- 4500.0
data$T8982400[4700.0 <= data$T8982400 & data$T8982400 <= 4960.0] <- 4700.0
data$T8982400[5000.0 <= data$T8982400 & data$T8982400 <= 5930.0] <- 5000.0
data$T8982400[6000.0 <= data$T8982400 & data$T8982400 <= 6130.0] <- 6000.0
data$T8982400[6200.0 <= data$T8982400 & data$T8982400 <= 6940.0] <- 6200.0
data$T8982400[7000.0 <= data$T8982400 & data$T8982400 <= 7620.0] <- 7000.0
data$T8982400[7700.0 <= data$T8982400 & data$T8982400 <= 7750.0] <- 7700.0
data$T8982400[7800.0 <= data$T8982400 & data$T8982400 <= 7850.0] <- 7800.0
data$T8982400[7900.0 <= data$T8982400 & data$T8982400 <= 8960.0] <- 7900.0
data$T8982400[9000.0 <= data$T8982400 & data$T8982400 <= 9750.0] <- 9000.0
data$T8982400[9800.0 <= data$T8982400 & data$T8982400 <= 9830.0] <- 9800.0
data$T8982400 <- factor(data$T8982400,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8982500[10.0 <= data$T8982500 & data$T8982500 <= 430.0] <- 10.0
data$T8982500[500.0 <= data$T8982500 & data$T8982500 <= 950.0] <- 500.0
data$T8982500[1000.0 <= data$T8982500 & data$T8982500 <= 1240.0] <- 1000.0
data$T8982500[1300.0 <= data$T8982500 & data$T8982500 <= 1560.0] <- 1300.0
data$T8982500[1600.0 <= data$T8982500 & data$T8982500 <= 1760.0] <- 1600.0
data$T8982500[1800.0 <= data$T8982500 & data$T8982500 <= 1860.0] <- 1800.0
data$T8982500[1900.0 <= data$T8982500 & data$T8982500 <= 1960.0] <- 1900.0
data$T8982500[2000.0 <= data$T8982500 & data$T8982500 <= 2060.0] <- 2000.0
data$T8982500[2100.0 <= data$T8982500 & data$T8982500 <= 2150.0] <- 2100.0
data$T8982500[2200.0 <= data$T8982500 & data$T8982500 <= 2340.0] <- 2200.0
data$T8982500[2400.0 <= data$T8982500 & data$T8982500 <= 2550.0] <- 2400.0
data$T8982500[2600.0 <= data$T8982500 & data$T8982500 <= 2760.0] <- 2600.0
data$T8982500[2800.0 <= data$T8982500 & data$T8982500 <= 2960.0] <- 2800.0
data$T8982500[3000.0 <= data$T8982500 & data$T8982500 <= 3260.0] <- 3000.0
data$T8982500[3300.0 <= data$T8982500 & data$T8982500 <= 3650.0] <- 3300.0
data$T8982500[3700.0 <= data$T8982500 & data$T8982500 <= 3950.0] <- 3700.0
data$T8982500[4000.0 <= data$T8982500 & data$T8982500 <= 4160.0] <- 4000.0
data$T8982500[4200.0 <= data$T8982500 & data$T8982500 <= 4250.0] <- 4200.0
data$T8982500[4300.0 <= data$T8982500 & data$T8982500 <= 4430.0] <- 4300.0
data$T8982500[4500.0 <= data$T8982500 & data$T8982500 <= 4650.0] <- 4500.0
data$T8982500[4700.0 <= data$T8982500 & data$T8982500 <= 4960.0] <- 4700.0
data$T8982500[5000.0 <= data$T8982500 & data$T8982500 <= 5930.0] <- 5000.0
data$T8982500[6000.0 <= data$T8982500 & data$T8982500 <= 6130.0] <- 6000.0
data$T8982500[6200.0 <= data$T8982500 & data$T8982500 <= 6940.0] <- 6200.0
data$T8982500[7000.0 <= data$T8982500 & data$T8982500 <= 7620.0] <- 7000.0
data$T8982500[7700.0 <= data$T8982500 & data$T8982500 <= 7750.0] <- 7700.0
data$T8982500[7800.0 <= data$T8982500 & data$T8982500 <= 7850.0] <- 7800.0
data$T8982500[7900.0 <= data$T8982500 & data$T8982500 <= 8960.0] <- 7900.0
data$T8982500[9000.0 <= data$T8982500 & data$T8982500 <= 9750.0] <- 9000.0
data$T8982500[9800.0 <= data$T8982500 & data$T8982500 <= 9830.0] <- 9800.0
data$T8982500 <- factor(data$T8982500,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8982600[10.0 <= data$T8982600 & data$T8982600 <= 430.0] <- 10.0
data$T8982600[500.0 <= data$T8982600 & data$T8982600 <= 950.0] <- 500.0
data$T8982600[1000.0 <= data$T8982600 & data$T8982600 <= 1240.0] <- 1000.0
data$T8982600[1300.0 <= data$T8982600 & data$T8982600 <= 1560.0] <- 1300.0
data$T8982600[1600.0 <= data$T8982600 & data$T8982600 <= 1760.0] <- 1600.0
data$T8982600[1800.0 <= data$T8982600 & data$T8982600 <= 1860.0] <- 1800.0
data$T8982600[1900.0 <= data$T8982600 & data$T8982600 <= 1960.0] <- 1900.0
data$T8982600[2000.0 <= data$T8982600 & data$T8982600 <= 2060.0] <- 2000.0
data$T8982600[2100.0 <= data$T8982600 & data$T8982600 <= 2150.0] <- 2100.0
data$T8982600[2200.0 <= data$T8982600 & data$T8982600 <= 2340.0] <- 2200.0
data$T8982600[2400.0 <= data$T8982600 & data$T8982600 <= 2550.0] <- 2400.0
data$T8982600[2600.0 <= data$T8982600 & data$T8982600 <= 2760.0] <- 2600.0
data$T8982600[2800.0 <= data$T8982600 & data$T8982600 <= 2960.0] <- 2800.0
data$T8982600[3000.0 <= data$T8982600 & data$T8982600 <= 3260.0] <- 3000.0
data$T8982600[3300.0 <= data$T8982600 & data$T8982600 <= 3650.0] <- 3300.0
data$T8982600[3700.0 <= data$T8982600 & data$T8982600 <= 3950.0] <- 3700.0
data$T8982600[4000.0 <= data$T8982600 & data$T8982600 <= 4160.0] <- 4000.0
data$T8982600[4200.0 <= data$T8982600 & data$T8982600 <= 4250.0] <- 4200.0
data$T8982600[4300.0 <= data$T8982600 & data$T8982600 <= 4430.0] <- 4300.0
data$T8982600[4500.0 <= data$T8982600 & data$T8982600 <= 4650.0] <- 4500.0
data$T8982600[4700.0 <= data$T8982600 & data$T8982600 <= 4960.0] <- 4700.0
data$T8982600[5000.0 <= data$T8982600 & data$T8982600 <= 5930.0] <- 5000.0
data$T8982600[6000.0 <= data$T8982600 & data$T8982600 <= 6130.0] <- 6000.0
data$T8982600[6200.0 <= data$T8982600 & data$T8982600 <= 6940.0] <- 6200.0
data$T8982600[7000.0 <= data$T8982600 & data$T8982600 <= 7620.0] <- 7000.0
data$T8982600[7700.0 <= data$T8982600 & data$T8982600 <= 7750.0] <- 7700.0
data$T8982600[7800.0 <= data$T8982600 & data$T8982600 <= 7850.0] <- 7800.0
data$T8982600[7900.0 <= data$T8982600 & data$T8982600 <= 8960.0] <- 7900.0
data$T8982600[9000.0 <= data$T8982600 & data$T8982600 <= 9750.0] <- 9000.0
data$T8982600[9800.0 <= data$T8982600 & data$T8982600 <= 9830.0] <- 9800.0
data$T8982600 <- factor(data$T8982600,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8982700[10.0 <= data$T8982700 & data$T8982700 <= 430.0] <- 10.0
data$T8982700[500.0 <= data$T8982700 & data$T8982700 <= 950.0] <- 500.0
data$T8982700[1000.0 <= data$T8982700 & data$T8982700 <= 1240.0] <- 1000.0
data$T8982700[1300.0 <= data$T8982700 & data$T8982700 <= 1560.0] <- 1300.0
data$T8982700[1600.0 <= data$T8982700 & data$T8982700 <= 1760.0] <- 1600.0
data$T8982700[1800.0 <= data$T8982700 & data$T8982700 <= 1860.0] <- 1800.0
data$T8982700[1900.0 <= data$T8982700 & data$T8982700 <= 1960.0] <- 1900.0
data$T8982700[2000.0 <= data$T8982700 & data$T8982700 <= 2060.0] <- 2000.0
data$T8982700[2100.0 <= data$T8982700 & data$T8982700 <= 2150.0] <- 2100.0
data$T8982700[2200.0 <= data$T8982700 & data$T8982700 <= 2340.0] <- 2200.0
data$T8982700[2400.0 <= data$T8982700 & data$T8982700 <= 2550.0] <- 2400.0
data$T8982700[2600.0 <= data$T8982700 & data$T8982700 <= 2760.0] <- 2600.0
data$T8982700[2800.0 <= data$T8982700 & data$T8982700 <= 2960.0] <- 2800.0
data$T8982700[3000.0 <= data$T8982700 & data$T8982700 <= 3260.0] <- 3000.0
data$T8982700[3300.0 <= data$T8982700 & data$T8982700 <= 3650.0] <- 3300.0
data$T8982700[3700.0 <= data$T8982700 & data$T8982700 <= 3950.0] <- 3700.0
data$T8982700[4000.0 <= data$T8982700 & data$T8982700 <= 4160.0] <- 4000.0
data$T8982700[4200.0 <= data$T8982700 & data$T8982700 <= 4250.0] <- 4200.0
data$T8982700[4300.0 <= data$T8982700 & data$T8982700 <= 4430.0] <- 4300.0
data$T8982700[4500.0 <= data$T8982700 & data$T8982700 <= 4650.0] <- 4500.0
data$T8982700[4700.0 <= data$T8982700 & data$T8982700 <= 4960.0] <- 4700.0
data$T8982700[5000.0 <= data$T8982700 & data$T8982700 <= 5930.0] <- 5000.0
data$T8982700[6000.0 <= data$T8982700 & data$T8982700 <= 6130.0] <- 6000.0
data$T8982700[6200.0 <= data$T8982700 & data$T8982700 <= 6940.0] <- 6200.0
data$T8982700[7000.0 <= data$T8982700 & data$T8982700 <= 7620.0] <- 7000.0
data$T8982700[7700.0 <= data$T8982700 & data$T8982700 <= 7750.0] <- 7700.0
data$T8982700[7800.0 <= data$T8982700 & data$T8982700 <= 7850.0] <- 7800.0
data$T8982700[7900.0 <= data$T8982700 & data$T8982700 <= 8960.0] <- 7900.0
data$T8982700[9000.0 <= data$T8982700 & data$T8982700 <= 9750.0] <- 9000.0
data$T8982700[9800.0 <= data$T8982700 & data$T8982700 <= 9830.0] <- 9800.0
data$T8982700 <- factor(data$T8982700,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T8982800[10.0 <= data$T8982800 & data$T8982800 <= 430.0] <- 10.0
data$T8982800[500.0 <= data$T8982800 & data$T8982800 <= 950.0] <- 500.0
data$T8982800[1000.0 <= data$T8982800 & data$T8982800 <= 1240.0] <- 1000.0
data$T8982800[1300.0 <= data$T8982800 & data$T8982800 <= 1560.0] <- 1300.0
data$T8982800[1600.0 <= data$T8982800 & data$T8982800 <= 1760.0] <- 1600.0
data$T8982800[1800.0 <= data$T8982800 & data$T8982800 <= 1860.0] <- 1800.0
data$T8982800[1900.0 <= data$T8982800 & data$T8982800 <= 1960.0] <- 1900.0
data$T8982800[2000.0 <= data$T8982800 & data$T8982800 <= 2060.0] <- 2000.0
data$T8982800[2100.0 <= data$T8982800 & data$T8982800 <= 2150.0] <- 2100.0
data$T8982800[2200.0 <= data$T8982800 & data$T8982800 <= 2340.0] <- 2200.0
data$T8982800[2400.0 <= data$T8982800 & data$T8982800 <= 2550.0] <- 2400.0
data$T8982800[2600.0 <= data$T8982800 & data$T8982800 <= 2760.0] <- 2600.0
data$T8982800[2800.0 <= data$T8982800 & data$T8982800 <= 2960.0] <- 2800.0
data$T8982800[3000.0 <= data$T8982800 & data$T8982800 <= 3260.0] <- 3000.0
data$T8982800[3300.0 <= data$T8982800 & data$T8982800 <= 3650.0] <- 3300.0
data$T8982800[3700.0 <= data$T8982800 & data$T8982800 <= 3950.0] <- 3700.0
data$T8982800[4000.0 <= data$T8982800 & data$T8982800 <= 4160.0] <- 4000.0
data$T8982800[4200.0 <= data$T8982800 & data$T8982800 <= 4250.0] <- 4200.0
data$T8982800[4300.0 <= data$T8982800 & data$T8982800 <= 4430.0] <- 4300.0
data$T8982800[4500.0 <= data$T8982800 & data$T8982800 <= 4650.0] <- 4500.0
data$T8982800[4700.0 <= data$T8982800 & data$T8982800 <= 4960.0] <- 4700.0
data$T8982800[5000.0 <= data$T8982800 & data$T8982800 <= 5930.0] <- 5000.0
data$T8982800[6000.0 <= data$T8982800 & data$T8982800 <= 6130.0] <- 6000.0
data$T8982800[6200.0 <= data$T8982800 & data$T8982800 <= 6940.0] <- 6200.0
data$T8982800[7000.0 <= data$T8982800 & data$T8982800 <= 7620.0] <- 7000.0
data$T8982800[7700.0 <= data$T8982800 & data$T8982800 <= 7750.0] <- 7700.0
data$T8982800[7800.0 <= data$T8982800 & data$T8982800 <= 7850.0] <- 7800.0
data$T8982800[7900.0 <= data$T8982800 & data$T8982800 <= 8960.0] <- 7900.0
data$T8982800[9000.0 <= data$T8982800 & data$T8982800 <= 9750.0] <- 9000.0
data$T8982800[9800.0 <= data$T8982800 & data$T8982800 <= 9830.0] <- 9800.0
data$T8982800 <- factor(data$T8982800,
levels=c(10.0,500.0,1000.0,1300.0,1600.0,1800.0,1900.0,2000.0,2100.0,2200.0,2400.0,2600.0,2800.0,3000.0,3300.0,3700.0,4000.0,4200.0,4300.0,4460.0,4500.0,4700.0,5000.0,6000.0,6200.0,7000.0,7700.0,7800.0,7900.0,9000.0,9800.0,9840.0,9950.0,9990.0),
labels=c("10 TO 430: Executive, Administrative and Managerial Occupations",
"500 TO 950: Management Related Occupations",
"1000 TO 1240: Mathematical and Computer Scientists",
"1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians",
"1600 TO 1760: Physical Scientists",
"1800 TO 1860: Social Scientists and Related Workers",
"1900 TO 1960: Life, Physical and Social Science Technicians",
"2000 TO 2060: Counselors, Sociala and Religious Workers",
"2100 TO 2150: Lawyers, Judges and Legal Support Workers",
"2200 TO 2340: Teachers",
"2400 TO 2550: Education, Training and Library Workers",
"2600 TO 2760: Entertainers and Performers, Sports and Related Workers",
"2800 TO 2960: Media and Communications Workers",
"3000 TO 3260: Health Diagnosing and Treating Practitioners",
"3300 TO 3650: Health Care Technical and Support Occupations",
"3700 TO 3950: Protective Service Occupations",
"4000 TO 4160: Food Preparation and Serving Related Occupations",
"4200 TO 4250: Cleaning and Building Service Occupations",
"4300 TO 4430: Entertainment Attendants and Related Workers",
"4460: Funeral Related Occupations",
"4500 TO 4650: Personal Care and Service Workers",
"4700 TO 4960: Sales and Related Workers",
"5000 TO 5930: Office and Administrative Support Workers",
"6000 TO 6130: Farming, Fishing and Forestry Occupations",
"6200 TO 6940: Construction Trade and Extraction Workers",
"7000 TO 7620: Installation, Maintenance and Repairs Workers",
"7700 TO 7750: Production and Operating Workers",
"7800 TO 7850: Food Preparation Occupations",
"7900 TO 8960: Setters, Operators and Tenders",
"9000 TO 9750: Transportation and Material Moving Workers",
"9800 TO 9830: Military Specific Occupations",
"9840: Armed Forces",
"9950: Not in Labor Force (ACS Code)",
"9990: Uncodeable"))
data$T9183800[15.0 <= data$T9183800 & data$T9183800 <= 100.0] <- 15.0
data$T9183800 <- factor(data$T9183800,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 100: 15+"))
data$T9299600[10.0 <= data$T9299600 & data$T9299600 <= 999.0] <- 10.0
data$T9299600 <- factor(data$T9299600,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T9299700[1.0 <= data$T9299700 & data$T9299700 <= 999.0] <- 1.0
data$T9299700[1000.0 <= data$T9299700 & data$T9299700 <= 1999.0] <- 1000.0
data$T9299700[2000.0 <= data$T9299700 & data$T9299700 <= 2999.0] <- 2000.0
data$T9299700[3000.0 <= data$T9299700 & data$T9299700 <= 3999.0] <- 3000.0
data$T9299700[4000.0 <= data$T9299700 & data$T9299700 <= 4999.0] <- 4000.0
data$T9299700[5000.0 <= data$T9299700 & data$T9299700 <= 5999.0] <- 5000.0
data$T9299700[6000.0 <= data$T9299700 & data$T9299700 <= 6999.0] <- 6000.0
data$T9299700[7000.0 <= data$T9299700 & data$T9299700 <= 7999.0] <- 7000.0
data$T9299700[8000.0 <= data$T9299700 & data$T9299700 <= 8999.0] <- 8000.0
data$T9299700[9000.0 <= data$T9299700 & data$T9299700 <= 9999.0] <- 9000.0
data$T9299700[10000.0 <= data$T9299700 & data$T9299700 <= 14999.0] <- 10000.0
data$T9299700[15000.0 <= data$T9299700 & data$T9299700 <= 19999.0] <- 15000.0
data$T9299700[20000.0 <= data$T9299700 & data$T9299700 <= 24999.0] <- 20000.0
data$T9299700[25000.0 <= data$T9299700 & data$T9299700 <= 49999.0] <- 25000.0
data$T9299700[50000.0 <= data$T9299700 & data$T9299700 <= 9.9999999E7] <- 50000.0
data$T9299700 <- factor(data$T9299700,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
labels=c("0",
"1 TO 999",
"1000 TO 1999",
"2000 TO 2999",
"3000 TO 3999",
"4000 TO 4999",
"5000 TO 5999",
"6000 TO 6999",
"7000 TO 7999",
"8000 TO 8999",
"9000 TO 9999",
"10000 TO 14999",
"15000 TO 19999",
"20000 TO 24999",
"25000 TO 49999",
"50000 TO 99999999: 50000+"))
data$T9307900[10.0 <= data$T9307900 & data$T9307900 <= 999.0] <- 10.0
data$T9307900 <- factor(data$T9307900,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
return(data)
}

varlabels <- c("CCR-DR DIAGNOSED DIABETES? XRND",
"CCR-DATE DIABETES DIAGNOSED XRND",
"ID# (1-12686) 79",
"RACL/ETHNIC COHORT /SCRNR 79",
"SEX OF R 79",
"DATE OF BIRTH OF 1ST CHILD - YEAR XRND",
"OCCUPATION (2000 CODES) ALL JOB L1 2008",
"OCCUPATION (2000 CODES) ALL JOB L2 2008",
"OCCUPATION (2000 CODES) ALL JOB L3 2008",
"OCCUPATION (2000 CODES) ALL JOB L4 2008",
"OCCUPATION (2000 CODES) ALL JOB L5 2008",
"R TRYING TO LOSE OR GAIN WEIGHT 2008",
"TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2008",
"TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2008",
"FAMILY SIZE 2008",
"TOTAL NET FAMILY INCOME 2008",
"AGE AT INTERVIEW DATE 2008",
"RS RESIDENCE IN SMSA 2008",
"NUM BIO/STEP/ADPT CHILDREN IN HH 2008",
"OCCUPATION (2000 CODES) ALL JOB L1 2010",
"OCCUPATION (2000 CODES) ALL JOB L2 2010",
"OCCUPATION (2000 CODES) ALL JOB L3 2010",
"OCCUPATION (2000 CODES) ALL JOB L4 2010",
"OCCUPATION (2000 CODES) ALL JOB L5 2010",
"R TRYING TO LOSE OR GAIN WEIGHT 2010",
"TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2010",
"TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2010",
"FAMILY SIZE 2010",
"TOTAL NET FAMILY INCOME 2010",
"AGE AT INTERVIEW DATE 2010",
"RS RESIDENCE IN SMSA 2010",
"NUM BIO/STEP/ADPT CHILDREN IN HH 2010",
"OCCUPATION (2000 CODES) ALL JOB L1 2012",
"OCCUPATION (2000 CODES) ALL JOB L2 2012",
"OCCUPATION (2000 CODES) ALL JOB L3 2012",
"OCCUPATION (2000 CODES) ALL JOB L4 2012",
"OCCUPATION (2000 CODES) ALL JOB L5 2012",
"R TRYING TO LOSE OR GAIN WEIGHT 2012",
"TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2012",
"TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2012",
"FAMILY SIZE 2012",
"TOTAL NET FAMILY INCOME 2012",
"AGE AT INTERVIEW DATE 2012",
"RS RESIDENCE IN SMSA 2012",
"NUM BIO/STEP/ADPT CHILDREN IN HH 2012",
"OCCUPATION (2000 CODES) ALL JOB L1 2014",
"OCCUPATION (2000 CODES) ALL JOB L2 2014",
"OCCUPATION (2000 CODES) ALL JOB L3 2014",
"OCCUPATION (2000 CODES) ALL JOB L4 2014",
"OCCUPATION (2000 CODES) ALL JOB L5 2014",
"R TRYING TO LOSE OR GAIN WEIGHT 2014",
"TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2014",
"TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2014",
"FAMILY SIZE 2014",
"TOTAL NET FAMILY INCOME 2014",
"AGE AT INTERVIEW 2014",
"RS RESIDENCE IN SMSA 2014",
"NUM BIO/STEP/ADPT CHILDREN IN HH 2014",
"OCCUPATION (2000 CODES) ALL JOB L1 2016",
"OCCUPATION (2000 CODES) ALL JOB L2 2016",
"OCCUPATION (2000 CODES) ALL JOB L3 2016",
"OCCUPATION (2000 CODES) ALL JOB L4 2016",
"OCCUPATION (2000 CODES) ALL JOB L5 2016",
"R TRYING TO LOSE OR GAIN WEIGHT 2016",
"TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2016",
"TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2016",
"FAMILY SIZE 2016",
"TOTAL NET FAMILY INCOME 2016",
"AGE AT INTERVIEW 2016",
"RS RESIDENCE IN SMSA 2016",
"NUM BIO/STEP/ADPT CHILDREN IN HH 2016",
"OCCUPATION (2000 CODES) ALL JOB L1 2020",
"OCCUPATION (2000 CODES) ALL JOB L2 2020",
"OCCUPATION (2000 CODES) ALL JOB L3 2020",
"OCCUPATION (2000 CODES) ALL JOB L4 2020",
"OCCUPATION (2000 CODES) ALL JOB L5 2020",
"R TRYING TO LOSE OR GAIN WEIGHT 2020",
"TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2020",
"TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2020",
"FAMILY SIZE 2020",
"TOTAL NET FAMILY INCOME 2020",
"AGE AT INTERVIEW 2020",
"RS RESIDENCE IN SMSA 2020",
"NUM BIO/STEP/ADPT CHILDREN IN HH 2020",
"OCCUPATION (2000 CODES) ALL JOB L1 2022",
"OCCUPATION (2000 CODES) ALL JOB L2 2022",
"OCCUPATION (2000 CODES) ALL JOB L3 2022",
"OCCUPATION (2000 CODES) ALL JOB L4 2022",
"OCCUPATION (2000 CODES) ALL JOB L5 2022",
"R TRYING TO LOSE OR GAIN WEIGHT 2022",
"TIMES HAVING SOFT DRK OR SODA PAST 7 DAYS 2022",
"TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS 2022",
"FAMILY SIZE 2022",
"TOTAL NET FAMILY INCOME 2022",
"AGE AT INTERVIEW 2022",
"RS RESIDENCE IN SMSA 2022",
"NUM BIO/STEP/ADPT CHILDREN IN HH 2022"
)


# Use qnames rather than rnums

qnames = function(data) {
names(data) <- c("H40-CHRC-2_XRND",
"H40-CHRC-2A~Y_XRND",
"CASEID_1979",
"SAMPLE_RACE_78SCRN",
"SAMPLE_SEX_1979",
"C1DOB~Y_XRND",
"OCCALL-EMP.01_2008",
"OCCALL-EMP.02_2008",
"OCCALL-EMP.03_2008",
"OCCALL-EMP.04_2008",
"OCCALL-EMP.05_2008",
"Q11-GENHLTH_6A_2008",
"Q11-GENHLTH_7F_1_2008",
"Q11-GENHLTH_7F_2_2008",
"FAMSIZE_2008",
"TNFI_TRUNC_2008",
"AGEATINT_2008",
"SMSARES_2008",
"NUMCH08_2008",
"OCCALL-EMP.01_2010",
"OCCALL-EMP.02_2010",
"OCCALL-EMP.03_2010",
"OCCALL-EMP.04_2010",
"OCCALL-EMP.05_2010",
"Q11-GENHLTH_6A_2010",
"Q11-GENHLTH_7F_1_2010",
"Q11-GENHLTH_7F_2_2010",
"FAMSIZE_2010",
"TNFI_TRUNC_2010",
"AGEATINT_2010",
"SMSARES_2010",
"NUMCH10_2010",
"OCCALL-EMP.01_2012",
"OCCALL-EMP.02_2012",
"OCCALL-EMP.03_2012",
"OCCALL-EMP.04_2012",
"OCCALL-EMP.05_2012",
"Q11-GENHLTH_6A_2012",
"Q11-GENHLTH_7F_1_2012",
"Q11-GENHLTH_7F_2_2012",
"FAMSIZE_2012",
"TNFI_TRUNC_2012",
"AGEATINT_2012",
"SMSARES_2012",
"NUMCH12_2012",
"OCCALL-EMP.01_2014",
"OCCALL-EMP.02_2014",
"OCCALL-EMP.03_2014",
"OCCALL-EMP.04_2014",
"OCCALL-EMP.05_2014",
"Q11-GENHLTH_6A_2014",
"Q11-GENHLTH_7F_1_2014",
"Q11-GENHLTH_7F_2_2014",
"FAMSIZE_2014",
"TNFI_TRUNC_2014",
"AGEATINT_2014",
"SMSARES_2014",
"NUMCH14_2014",
"OCCALL-EMP.01_2016",
"OCCALL-EMP.02_2016",
"OCCALL-EMP.03_2016",
"OCCALL-EMP.04_2016",
"OCCALL-EMP.05_2016",
"Q11-GENHLTH_6A_2016",
"Q11-GENHLTH_7F_1_2016",
"Q11-GENHLTH_7F_2_2016",
"FAMSIZE_2016",
"TNFI_TRUNC_2016",
"AGEATINT_2016",
"SMSARES_2016",
"NUMCH16_2016",
"OCCALL-EMP.01_2020",
"OCCALL-EMP.02_2020",
"OCCALL-EMP.03_2020",
"OCCALL-EMP.04_2020",
"OCCALL-EMP.05_2020",
"Q11-GENHLTH_6A_2020",
"Q11-GENHLTH_7F_1_2020",
"Q11-GENHLTH_7F_2_2020",
"FAMSIZE_2020",
"TNFI_TRUNC_2020",
"AGEATINT_2020",
"SMSARES_2020",
"NUMCH20_2020",
"OCCALL-EMP.01_2022",
"OCCALL-EMP.02_2022",
"OCCALL-EMP.03_2022",
"OCCALL-EMP.04_2022",
"OCCALL-EMP.05_2022",
"Q11-GENHLTH_6A_2022",
"Q11-GENHLTH_7F_1_2022",
"Q11-GENHLTH_7F_2_2022",
"FAMSIZE_2022",
"TNFI_TRUNC_2022",
"AGEATINT_2022",
"SMSARES_2022",
"NUMCH22_2022")
return(data)
}


#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels.
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
#new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#categories <- vallabels_continuous(new_data)
#summary(categories)

#************************************************************************************************************

