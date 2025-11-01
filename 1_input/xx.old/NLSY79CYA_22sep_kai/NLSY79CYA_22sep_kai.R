
# Set working directory
# setwd()


new_data <- read.table('NLSY79CYA_22sep_kai.dat', sep=' ')
names(new_data) <- c('C0000100',
'C0000200',
'C0005300',
'C0005400',
'C0005700',
'Y2267000',
'Y2395200',
'Y2395300',
'Y2395400',
'Y2395500',
'Y2395600',
'Y2537300',
'Y2582200',
'Y2725700',
'Y2725800',
'Y2725900',
'Y2726000',
'Y2726100',
'Y2885000',
'Y2885100',
'Y2885400',
'Y2929900',
'Y2967400',
'Y3079400',
'Y3079500',
'Y3079600',
'Y3079700',
'Y3079800',
'Y3254700',
'Y3254900',
'Y3255000',
'Y3281500',
'Y3299900',
'Y3332900',
'Y3595100',
'Y3595200',
'Y3621600',
'Y3676700',
'Y4229800',
'Y4550700')


# Handle missing values

new_data[new_data == -1] = NA  # Refused
new_data[new_data == -2] = NA  # Dont know
new_data[new_data == -3] = NA  # Invalid missing
new_data[new_data == -7] = NA  # Missing


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$C0005300 <- factor(data$C0005300,
levels=c(1.0,2.0,3.0),
labels=c("HISPANIC",
"BLACK",
"NON-BLACK, NON-HISPANIC"))
  data$C0005400 <- factor(data$C0005400,
levels=c(1.0,2.0),
labels=c("MALE",
"FEMALE"))
  data$Y2267000 <- factor(data$Y2267000,
levels=c(532.0),
labels=c("532"))
  data$Y2582200 <- factor(data$Y2582200,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0),
labels=c("$1-$5,000",
"$5,001-$10,000",
"$10,001 - $25,000",
"$25,001 - $50,000",
"$50,001 - $100,000",
"$100,001 $250,000",
"More than $250,000"))
  data$Y2885000 <- factor(data$Y2885000,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("Don't buy food",
"Always",
"Often",
"Sometimes",
"Rarely",
"Never"))
  data$Y2885100 <- factor(data$Y2885100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("Don't buy food",
"Always",
"Often",
"Sometimes",
"Rarely",
"Never"))
  data$Y2929900 <- factor(data$Y2929900,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0),
labels=c("$1-$5,000",
"$5,001-$10,000",
"$10,001 - $25,000",
"$25,001 - $50,000",
"$50,001 - $100,000",
"$100,001 $250,000",
"More than $250,000"))
  data$Y2967400 <- factor(data$Y2967400,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN MSA",
"2: IN MSA, NOT IN CENTRAL CITY",
"3: IN MSA, IN CENTRAL CITY",
"4: IN MSA, CENTRAL CITY NOT KNOWN"))
  data$Y3254700 <- factor(data$Y3254700,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0),
labels=c("I do not typically drink soft drinks containing sugar",
"1 to 3 times per week",
"4 to 6 times per week",
"1 time per day",
"2 times per day",
"3 times per day",
"4 or more times per day"))
  data$Y3254900 <- factor(data$Y3254900,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("DON'T BUY FOOD",
"ALWAYS",
"OFTEN",
"SOMETIMES",
"RARELY",
"NEVER"))
  data$Y3255000 <- factor(data$Y3255000,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("DON'T BUY FOOD",
"ALWAYS",
"OFTEN",
"SOMETIMES",
"RARELY",
"NEVER"))
  data$Y3281500 <- factor(data$Y3281500,
levels=c(0.0,1.0),
labels=c("NO",
"YES"))
  data$Y3299900 <- factor(data$Y3299900,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0),
labels=c("$1-$5,000",
"$5,001-$10,000",
"$10,001 - $25,000",
"$25,001 - $50,000",
"$50,001 - $100,000",
"$100,001 $250,000",
"More than $250,000"))
  data$Y3332900 <- factor(data$Y3332900,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN MSA",
"2: IN MSA, NOT IN CENTRAL CITY",
"3: IN MSA, IN CENTRAL CITY",
"4: IN MSA, CENTRAL CITY NOT KNOWN"))
  data$Y3595100 <- factor(data$Y3595100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("DON'T BUY FOOD",
"ALWAYS",
"OFTEN",
"SOMETIMES",
"RARELY",
"NEVER"))
  data$Y3595200 <- factor(data$Y3595200,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("DON'T BUY FOOD",
"ALWAYS",
"OFTEN",
"SOMETIMES",
"RARELY",
"NEVER"))
  data$Y3621600 <- factor(data$Y3621600,
levels=c(0.0,1.0),
labels=c("NO",
"YES"))
  data$Y3676700 <- factor(data$Y3676700,
levels=c(1.0,2.0,3.0,4.0),
labels=c("1: NOT IN MSA",
"2: IN MSA, NOT IN CENTRAL CITY",
"3: IN MSA, IN CENTRAL CITY",
"4: IN MSA, CENTRAL CITY NOT KNOWN"))
  data$Y4229800 <- factor(data$Y4229800,
levels=c(0.0,1.0),
labels=c("NO",
"YES"))
  data$Y4550700 <- factor(data$Y4550700,
levels=c(0.0,1.0),
labels=c("NO",
"YES"))
return(data)
}


# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {
data$C0000100[1.0 <= data$C0000100 & data$C0000100 <= 9999999.0] <- 1.0
data$C0000100 <- factor(data$C0000100,
levels=c(1.0),
labels=c("1 TO 9999999: See Min & Max values below for range as of this release"))
data$C0000200[1.0 <= data$C0000200 & data$C0000200 <= 12686.0] <- 1.0
data$C0000200 <- factor(data$C0000200,
levels=c(1.0),
labels=c("1 TO 12686: NLSY79 Public ID"))
data$C0005700[1970.0 <= data$C0005700 & data$C0005700 <= 1978.0] <- 1970.0
data$C0005700 <- factor(data$C0005700,
levels=c(1970.0,1979.0,1980.0,1981.0,1982.0,1983.0,1984.0,1985.0,1986.0,1987.0,1988.0,1989.0,1990.0,1991.0,1992.0,1993.0,1994.0,1995.0,1996.0,1997.0,1998.0,1999.0,2000.0,2001.0,2002.0,2003.0,2004.0,2005.0,2006.0,2007.0,2008.0,2009.0,2010.0,2011.0,2012.0,2013.0,2014.0,2015.0,2016.0,2017.0,2018.0,2019.0,2020.0,2021.0),
labels=c("1970 TO 1978: < before 1979",
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
"2021"))
data$Y2395200[10.0 <= data$Y2395200 & data$Y2395200 <= 430.0] <- 10.0
data$Y2395200[500.0 <= data$Y2395200 & data$Y2395200 <= 950.0] <- 500.0
data$Y2395200[1000.0 <= data$Y2395200 & data$Y2395200 <= 1240.0] <- 1000.0
data$Y2395200[1300.0 <= data$Y2395200 & data$Y2395200 <= 1560.0] <- 1300.0
data$Y2395200[1600.0 <= data$Y2395200 & data$Y2395200 <= 1760.0] <- 1600.0
data$Y2395200[1800.0 <= data$Y2395200 & data$Y2395200 <= 1860.0] <- 1800.0
data$Y2395200[1900.0 <= data$Y2395200 & data$Y2395200 <= 1960.0] <- 1900.0
data$Y2395200[2000.0 <= data$Y2395200 & data$Y2395200 <= 2060.0] <- 2000.0
data$Y2395200[2100.0 <= data$Y2395200 & data$Y2395200 <= 2150.0] <- 2100.0
data$Y2395200[2200.0 <= data$Y2395200 & data$Y2395200 <= 2340.0] <- 2200.0
data$Y2395200[2400.0 <= data$Y2395200 & data$Y2395200 <= 2550.0] <- 2400.0
data$Y2395200[2600.0 <= data$Y2395200 & data$Y2395200 <= 2760.0] <- 2600.0
data$Y2395200[2800.0 <= data$Y2395200 & data$Y2395200 <= 2960.0] <- 2800.0
data$Y2395200[3000.0 <= data$Y2395200 & data$Y2395200 <= 3260.0] <- 3000.0
data$Y2395200[3300.0 <= data$Y2395200 & data$Y2395200 <= 3650.0] <- 3300.0
data$Y2395200[3700.0 <= data$Y2395200 & data$Y2395200 <= 3950.0] <- 3700.0
data$Y2395200[4000.0 <= data$Y2395200 & data$Y2395200 <= 4160.0] <- 4000.0
data$Y2395200[4200.0 <= data$Y2395200 & data$Y2395200 <= 4250.0] <- 4200.0
data$Y2395200[4300.0 <= data$Y2395200 & data$Y2395200 <= 4430.0] <- 4300.0
data$Y2395200[4500.0 <= data$Y2395200 & data$Y2395200 <= 4650.0] <- 4500.0
data$Y2395200[4700.0 <= data$Y2395200 & data$Y2395200 <= 4960.0] <- 4700.0
data$Y2395200[5000.0 <= data$Y2395200 & data$Y2395200 <= 5930.0] <- 5000.0
data$Y2395200[6000.0 <= data$Y2395200 & data$Y2395200 <= 6130.0] <- 6000.0
data$Y2395200[6200.0 <= data$Y2395200 & data$Y2395200 <= 6940.0] <- 6200.0
data$Y2395200[7000.0 <= data$Y2395200 & data$Y2395200 <= 7620.0] <- 7000.0
data$Y2395200[7700.0 <= data$Y2395200 & data$Y2395200 <= 7750.0] <- 7700.0
data$Y2395200[7800.0 <= data$Y2395200 & data$Y2395200 <= 7850.0] <- 7800.0
data$Y2395200[7900.0 <= data$Y2395200 & data$Y2395200 <= 8960.0] <- 7900.0
data$Y2395200[9000.0 <= data$Y2395200 & data$Y2395200 <= 9750.0] <- 9000.0
data$Y2395200[9800.0 <= data$Y2395200 & data$Y2395200 <= 9830.0] <- 9800.0
data$Y2395200 <- factor(data$Y2395200,
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
data$Y2395300[10.0 <= data$Y2395300 & data$Y2395300 <= 430.0] <- 10.0
data$Y2395300[500.0 <= data$Y2395300 & data$Y2395300 <= 950.0] <- 500.0
data$Y2395300[1000.0 <= data$Y2395300 & data$Y2395300 <= 1240.0] <- 1000.0
data$Y2395300[1300.0 <= data$Y2395300 & data$Y2395300 <= 1560.0] <- 1300.0
data$Y2395300[1600.0 <= data$Y2395300 & data$Y2395300 <= 1760.0] <- 1600.0
data$Y2395300[1800.0 <= data$Y2395300 & data$Y2395300 <= 1860.0] <- 1800.0
data$Y2395300[1900.0 <= data$Y2395300 & data$Y2395300 <= 1960.0] <- 1900.0
data$Y2395300[2000.0 <= data$Y2395300 & data$Y2395300 <= 2060.0] <- 2000.0
data$Y2395300[2100.0 <= data$Y2395300 & data$Y2395300 <= 2150.0] <- 2100.0
data$Y2395300[2200.0 <= data$Y2395300 & data$Y2395300 <= 2340.0] <- 2200.0
data$Y2395300[2400.0 <= data$Y2395300 & data$Y2395300 <= 2550.0] <- 2400.0
data$Y2395300[2600.0 <= data$Y2395300 & data$Y2395300 <= 2760.0] <- 2600.0
data$Y2395300[2800.0 <= data$Y2395300 & data$Y2395300 <= 2960.0] <- 2800.0
data$Y2395300[3000.0 <= data$Y2395300 & data$Y2395300 <= 3260.0] <- 3000.0
data$Y2395300[3300.0 <= data$Y2395300 & data$Y2395300 <= 3650.0] <- 3300.0
data$Y2395300[3700.0 <= data$Y2395300 & data$Y2395300 <= 3950.0] <- 3700.0
data$Y2395300[4000.0 <= data$Y2395300 & data$Y2395300 <= 4160.0] <- 4000.0
data$Y2395300[4200.0 <= data$Y2395300 & data$Y2395300 <= 4250.0] <- 4200.0
data$Y2395300[4300.0 <= data$Y2395300 & data$Y2395300 <= 4430.0] <- 4300.0
data$Y2395300[4500.0 <= data$Y2395300 & data$Y2395300 <= 4650.0] <- 4500.0
data$Y2395300[4700.0 <= data$Y2395300 & data$Y2395300 <= 4960.0] <- 4700.0
data$Y2395300[5000.0 <= data$Y2395300 & data$Y2395300 <= 5930.0] <- 5000.0
data$Y2395300[6000.0 <= data$Y2395300 & data$Y2395300 <= 6130.0] <- 6000.0
data$Y2395300[6200.0 <= data$Y2395300 & data$Y2395300 <= 6940.0] <- 6200.0
data$Y2395300[7000.0 <= data$Y2395300 & data$Y2395300 <= 7620.0] <- 7000.0
data$Y2395300[7700.0 <= data$Y2395300 & data$Y2395300 <= 7750.0] <- 7700.0
data$Y2395300[7800.0 <= data$Y2395300 & data$Y2395300 <= 7850.0] <- 7800.0
data$Y2395300[7900.0 <= data$Y2395300 & data$Y2395300 <= 8960.0] <- 7900.0
data$Y2395300[9000.0 <= data$Y2395300 & data$Y2395300 <= 9750.0] <- 9000.0
data$Y2395300[9800.0 <= data$Y2395300 & data$Y2395300 <= 9830.0] <- 9800.0
data$Y2395300 <- factor(data$Y2395300,
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
data$Y2395400[10.0 <= data$Y2395400 & data$Y2395400 <= 430.0] <- 10.0
data$Y2395400[500.0 <= data$Y2395400 & data$Y2395400 <= 950.0] <- 500.0
data$Y2395400[1000.0 <= data$Y2395400 & data$Y2395400 <= 1240.0] <- 1000.0
data$Y2395400[1300.0 <= data$Y2395400 & data$Y2395400 <= 1560.0] <- 1300.0
data$Y2395400[1600.0 <= data$Y2395400 & data$Y2395400 <= 1760.0] <- 1600.0
data$Y2395400[1800.0 <= data$Y2395400 & data$Y2395400 <= 1860.0] <- 1800.0
data$Y2395400[1900.0 <= data$Y2395400 & data$Y2395400 <= 1960.0] <- 1900.0
data$Y2395400[2000.0 <= data$Y2395400 & data$Y2395400 <= 2060.0] <- 2000.0
data$Y2395400[2100.0 <= data$Y2395400 & data$Y2395400 <= 2150.0] <- 2100.0
data$Y2395400[2200.0 <= data$Y2395400 & data$Y2395400 <= 2340.0] <- 2200.0
data$Y2395400[2400.0 <= data$Y2395400 & data$Y2395400 <= 2550.0] <- 2400.0
data$Y2395400[2600.0 <= data$Y2395400 & data$Y2395400 <= 2760.0] <- 2600.0
data$Y2395400[2800.0 <= data$Y2395400 & data$Y2395400 <= 2960.0] <- 2800.0
data$Y2395400[3000.0 <= data$Y2395400 & data$Y2395400 <= 3260.0] <- 3000.0
data$Y2395400[3300.0 <= data$Y2395400 & data$Y2395400 <= 3650.0] <- 3300.0
data$Y2395400[3700.0 <= data$Y2395400 & data$Y2395400 <= 3950.0] <- 3700.0
data$Y2395400[4000.0 <= data$Y2395400 & data$Y2395400 <= 4160.0] <- 4000.0
data$Y2395400[4200.0 <= data$Y2395400 & data$Y2395400 <= 4250.0] <- 4200.0
data$Y2395400[4300.0 <= data$Y2395400 & data$Y2395400 <= 4430.0] <- 4300.0
data$Y2395400[4500.0 <= data$Y2395400 & data$Y2395400 <= 4650.0] <- 4500.0
data$Y2395400[4700.0 <= data$Y2395400 & data$Y2395400 <= 4960.0] <- 4700.0
data$Y2395400[5000.0 <= data$Y2395400 & data$Y2395400 <= 5930.0] <- 5000.0
data$Y2395400[6000.0 <= data$Y2395400 & data$Y2395400 <= 6130.0] <- 6000.0
data$Y2395400[6200.0 <= data$Y2395400 & data$Y2395400 <= 6940.0] <- 6200.0
data$Y2395400[7000.0 <= data$Y2395400 & data$Y2395400 <= 7620.0] <- 7000.0
data$Y2395400[7700.0 <= data$Y2395400 & data$Y2395400 <= 7750.0] <- 7700.0
data$Y2395400[7800.0 <= data$Y2395400 & data$Y2395400 <= 7850.0] <- 7800.0
data$Y2395400[7900.0 <= data$Y2395400 & data$Y2395400 <= 8960.0] <- 7900.0
data$Y2395400[9000.0 <= data$Y2395400 & data$Y2395400 <= 9750.0] <- 9000.0
data$Y2395400[9800.0 <= data$Y2395400 & data$Y2395400 <= 9830.0] <- 9800.0
data$Y2395400 <- factor(data$Y2395400,
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
data$Y2395500[10.0 <= data$Y2395500 & data$Y2395500 <= 430.0] <- 10.0
data$Y2395500[500.0 <= data$Y2395500 & data$Y2395500 <= 950.0] <- 500.0
data$Y2395500[1000.0 <= data$Y2395500 & data$Y2395500 <= 1240.0] <- 1000.0
data$Y2395500[1300.0 <= data$Y2395500 & data$Y2395500 <= 1560.0] <- 1300.0
data$Y2395500[1600.0 <= data$Y2395500 & data$Y2395500 <= 1760.0] <- 1600.0
data$Y2395500[1800.0 <= data$Y2395500 & data$Y2395500 <= 1860.0] <- 1800.0
data$Y2395500[1900.0 <= data$Y2395500 & data$Y2395500 <= 1960.0] <- 1900.0
data$Y2395500[2000.0 <= data$Y2395500 & data$Y2395500 <= 2060.0] <- 2000.0
data$Y2395500[2100.0 <= data$Y2395500 & data$Y2395500 <= 2150.0] <- 2100.0
data$Y2395500[2200.0 <= data$Y2395500 & data$Y2395500 <= 2340.0] <- 2200.0
data$Y2395500[2400.0 <= data$Y2395500 & data$Y2395500 <= 2550.0] <- 2400.0
data$Y2395500[2600.0 <= data$Y2395500 & data$Y2395500 <= 2760.0] <- 2600.0
data$Y2395500[2800.0 <= data$Y2395500 & data$Y2395500 <= 2960.0] <- 2800.0
data$Y2395500[3000.0 <= data$Y2395500 & data$Y2395500 <= 3260.0] <- 3000.0
data$Y2395500[3300.0 <= data$Y2395500 & data$Y2395500 <= 3650.0] <- 3300.0
data$Y2395500[3700.0 <= data$Y2395500 & data$Y2395500 <= 3950.0] <- 3700.0
data$Y2395500[4000.0 <= data$Y2395500 & data$Y2395500 <= 4160.0] <- 4000.0
data$Y2395500[4200.0 <= data$Y2395500 & data$Y2395500 <= 4250.0] <- 4200.0
data$Y2395500[4300.0 <= data$Y2395500 & data$Y2395500 <= 4430.0] <- 4300.0
data$Y2395500[4500.0 <= data$Y2395500 & data$Y2395500 <= 4650.0] <- 4500.0
data$Y2395500[4700.0 <= data$Y2395500 & data$Y2395500 <= 4960.0] <- 4700.0
data$Y2395500[5000.0 <= data$Y2395500 & data$Y2395500 <= 5930.0] <- 5000.0
data$Y2395500[6000.0 <= data$Y2395500 & data$Y2395500 <= 6130.0] <- 6000.0
data$Y2395500[6200.0 <= data$Y2395500 & data$Y2395500 <= 6940.0] <- 6200.0
data$Y2395500[7000.0 <= data$Y2395500 & data$Y2395500 <= 7620.0] <- 7000.0
data$Y2395500[7700.0 <= data$Y2395500 & data$Y2395500 <= 7750.0] <- 7700.0
data$Y2395500[7800.0 <= data$Y2395500 & data$Y2395500 <= 7850.0] <- 7800.0
data$Y2395500[7900.0 <= data$Y2395500 & data$Y2395500 <= 8960.0] <- 7900.0
data$Y2395500[9000.0 <= data$Y2395500 & data$Y2395500 <= 9750.0] <- 9000.0
data$Y2395500[9800.0 <= data$Y2395500 & data$Y2395500 <= 9830.0] <- 9800.0
data$Y2395500 <- factor(data$Y2395500,
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
data$Y2395600[10.0 <= data$Y2395600 & data$Y2395600 <= 430.0] <- 10.0
data$Y2395600[500.0 <= data$Y2395600 & data$Y2395600 <= 950.0] <- 500.0
data$Y2395600[1000.0 <= data$Y2395600 & data$Y2395600 <= 1240.0] <- 1000.0
data$Y2395600[1300.0 <= data$Y2395600 & data$Y2395600 <= 1560.0] <- 1300.0
data$Y2395600[1600.0 <= data$Y2395600 & data$Y2395600 <= 1760.0] <- 1600.0
data$Y2395600[1800.0 <= data$Y2395600 & data$Y2395600 <= 1860.0] <- 1800.0
data$Y2395600[1900.0 <= data$Y2395600 & data$Y2395600 <= 1960.0] <- 1900.0
data$Y2395600[2000.0 <= data$Y2395600 & data$Y2395600 <= 2060.0] <- 2000.0
data$Y2395600[2100.0 <= data$Y2395600 & data$Y2395600 <= 2150.0] <- 2100.0
data$Y2395600[2200.0 <= data$Y2395600 & data$Y2395600 <= 2340.0] <- 2200.0
data$Y2395600[2400.0 <= data$Y2395600 & data$Y2395600 <= 2550.0] <- 2400.0
data$Y2395600[2600.0 <= data$Y2395600 & data$Y2395600 <= 2760.0] <- 2600.0
data$Y2395600[2800.0 <= data$Y2395600 & data$Y2395600 <= 2960.0] <- 2800.0
data$Y2395600[3000.0 <= data$Y2395600 & data$Y2395600 <= 3260.0] <- 3000.0
data$Y2395600[3300.0 <= data$Y2395600 & data$Y2395600 <= 3650.0] <- 3300.0
data$Y2395600[3700.0 <= data$Y2395600 & data$Y2395600 <= 3950.0] <- 3700.0
data$Y2395600[4000.0 <= data$Y2395600 & data$Y2395600 <= 4160.0] <- 4000.0
data$Y2395600[4200.0 <= data$Y2395600 & data$Y2395600 <= 4250.0] <- 4200.0
data$Y2395600[4300.0 <= data$Y2395600 & data$Y2395600 <= 4430.0] <- 4300.0
data$Y2395600[4500.0 <= data$Y2395600 & data$Y2395600 <= 4650.0] <- 4500.0
data$Y2395600[4700.0 <= data$Y2395600 & data$Y2395600 <= 4960.0] <- 4700.0
data$Y2395600[5000.0 <= data$Y2395600 & data$Y2395600 <= 5930.0] <- 5000.0
data$Y2395600[6000.0 <= data$Y2395600 & data$Y2395600 <= 6130.0] <- 6000.0
data$Y2395600[6200.0 <= data$Y2395600 & data$Y2395600 <= 6940.0] <- 6200.0
data$Y2395600[7000.0 <= data$Y2395600 & data$Y2395600 <= 7620.0] <- 7000.0
data$Y2395600[7700.0 <= data$Y2395600 & data$Y2395600 <= 7750.0] <- 7700.0
data$Y2395600[7800.0 <= data$Y2395600 & data$Y2395600 <= 7850.0] <- 7800.0
data$Y2395600[7900.0 <= data$Y2395600 & data$Y2395600 <= 8960.0] <- 7900.0
data$Y2395600[9000.0 <= data$Y2395600 & data$Y2395600 <= 9750.0] <- 9000.0
data$Y2395600[9800.0 <= data$Y2395600 & data$Y2395600 <= 9830.0] <- 9800.0
data$Y2395600 <- factor(data$Y2395600,
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
data$Y2537300[10.0 <= data$Y2537300 & data$Y2537300 <= 999.0] <- 10.0
data$Y2537300 <- factor(data$Y2537300,
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
data$Y2725700[10.0 <= data$Y2725700 & data$Y2725700 <= 430.0] <- 10.0
data$Y2725700[500.0 <= data$Y2725700 & data$Y2725700 <= 950.0] <- 500.0
data$Y2725700[1000.0 <= data$Y2725700 & data$Y2725700 <= 1240.0] <- 1000.0
data$Y2725700[1300.0 <= data$Y2725700 & data$Y2725700 <= 1560.0] <- 1300.0
data$Y2725700[1600.0 <= data$Y2725700 & data$Y2725700 <= 1760.0] <- 1600.0
data$Y2725700[1800.0 <= data$Y2725700 & data$Y2725700 <= 1860.0] <- 1800.0
data$Y2725700[1900.0 <= data$Y2725700 & data$Y2725700 <= 1960.0] <- 1900.0
data$Y2725700[2000.0 <= data$Y2725700 & data$Y2725700 <= 2060.0] <- 2000.0
data$Y2725700[2100.0 <= data$Y2725700 & data$Y2725700 <= 2150.0] <- 2100.0
data$Y2725700[2200.0 <= data$Y2725700 & data$Y2725700 <= 2340.0] <- 2200.0
data$Y2725700[2400.0 <= data$Y2725700 & data$Y2725700 <= 2550.0] <- 2400.0
data$Y2725700[2600.0 <= data$Y2725700 & data$Y2725700 <= 2760.0] <- 2600.0
data$Y2725700[2800.0 <= data$Y2725700 & data$Y2725700 <= 2960.0] <- 2800.0
data$Y2725700[3000.0 <= data$Y2725700 & data$Y2725700 <= 3260.0] <- 3000.0
data$Y2725700[3300.0 <= data$Y2725700 & data$Y2725700 <= 3650.0] <- 3300.0
data$Y2725700[3700.0 <= data$Y2725700 & data$Y2725700 <= 3950.0] <- 3700.0
data$Y2725700[4000.0 <= data$Y2725700 & data$Y2725700 <= 4160.0] <- 4000.0
data$Y2725700[4200.0 <= data$Y2725700 & data$Y2725700 <= 4250.0] <- 4200.0
data$Y2725700[4300.0 <= data$Y2725700 & data$Y2725700 <= 4430.0] <- 4300.0
data$Y2725700[4500.0 <= data$Y2725700 & data$Y2725700 <= 4650.0] <- 4500.0
data$Y2725700[4700.0 <= data$Y2725700 & data$Y2725700 <= 4960.0] <- 4700.0
data$Y2725700[5000.0 <= data$Y2725700 & data$Y2725700 <= 5930.0] <- 5000.0
data$Y2725700[6000.0 <= data$Y2725700 & data$Y2725700 <= 6130.0] <- 6000.0
data$Y2725700[6200.0 <= data$Y2725700 & data$Y2725700 <= 6940.0] <- 6200.0
data$Y2725700[7000.0 <= data$Y2725700 & data$Y2725700 <= 7620.0] <- 7000.0
data$Y2725700[7700.0 <= data$Y2725700 & data$Y2725700 <= 7750.0] <- 7700.0
data$Y2725700[7800.0 <= data$Y2725700 & data$Y2725700 <= 7850.0] <- 7800.0
data$Y2725700[7900.0 <= data$Y2725700 & data$Y2725700 <= 8960.0] <- 7900.0
data$Y2725700[9000.0 <= data$Y2725700 & data$Y2725700 <= 9750.0] <- 9000.0
data$Y2725700[9800.0 <= data$Y2725700 & data$Y2725700 <= 9830.0] <- 9800.0
data$Y2725700 <- factor(data$Y2725700,
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
data$Y2725800[10.0 <= data$Y2725800 & data$Y2725800 <= 430.0] <- 10.0
data$Y2725800[500.0 <= data$Y2725800 & data$Y2725800 <= 950.0] <- 500.0
data$Y2725800[1000.0 <= data$Y2725800 & data$Y2725800 <= 1240.0] <- 1000.0
data$Y2725800[1300.0 <= data$Y2725800 & data$Y2725800 <= 1560.0] <- 1300.0
data$Y2725800[1600.0 <= data$Y2725800 & data$Y2725800 <= 1760.0] <- 1600.0
data$Y2725800[1800.0 <= data$Y2725800 & data$Y2725800 <= 1860.0] <- 1800.0
data$Y2725800[1900.0 <= data$Y2725800 & data$Y2725800 <= 1960.0] <- 1900.0
data$Y2725800[2000.0 <= data$Y2725800 & data$Y2725800 <= 2060.0] <- 2000.0
data$Y2725800[2100.0 <= data$Y2725800 & data$Y2725800 <= 2150.0] <- 2100.0
data$Y2725800[2200.0 <= data$Y2725800 & data$Y2725800 <= 2340.0] <- 2200.0
data$Y2725800[2400.0 <= data$Y2725800 & data$Y2725800 <= 2550.0] <- 2400.0
data$Y2725800[2600.0 <= data$Y2725800 & data$Y2725800 <= 2760.0] <- 2600.0
data$Y2725800[2800.0 <= data$Y2725800 & data$Y2725800 <= 2960.0] <- 2800.0
data$Y2725800[3000.0 <= data$Y2725800 & data$Y2725800 <= 3260.0] <- 3000.0
data$Y2725800[3300.0 <= data$Y2725800 & data$Y2725800 <= 3650.0] <- 3300.0
data$Y2725800[3700.0 <= data$Y2725800 & data$Y2725800 <= 3950.0] <- 3700.0
data$Y2725800[4000.0 <= data$Y2725800 & data$Y2725800 <= 4160.0] <- 4000.0
data$Y2725800[4200.0 <= data$Y2725800 & data$Y2725800 <= 4250.0] <- 4200.0
data$Y2725800[4300.0 <= data$Y2725800 & data$Y2725800 <= 4430.0] <- 4300.0
data$Y2725800[4500.0 <= data$Y2725800 & data$Y2725800 <= 4650.0] <- 4500.0
data$Y2725800[4700.0 <= data$Y2725800 & data$Y2725800 <= 4960.0] <- 4700.0
data$Y2725800[5000.0 <= data$Y2725800 & data$Y2725800 <= 5930.0] <- 5000.0
data$Y2725800[6000.0 <= data$Y2725800 & data$Y2725800 <= 6130.0] <- 6000.0
data$Y2725800[6200.0 <= data$Y2725800 & data$Y2725800 <= 6940.0] <- 6200.0
data$Y2725800[7000.0 <= data$Y2725800 & data$Y2725800 <= 7620.0] <- 7000.0
data$Y2725800[7700.0 <= data$Y2725800 & data$Y2725800 <= 7750.0] <- 7700.0
data$Y2725800[7800.0 <= data$Y2725800 & data$Y2725800 <= 7850.0] <- 7800.0
data$Y2725800[7900.0 <= data$Y2725800 & data$Y2725800 <= 8960.0] <- 7900.0
data$Y2725800[9000.0 <= data$Y2725800 & data$Y2725800 <= 9750.0] <- 9000.0
data$Y2725800[9800.0 <= data$Y2725800 & data$Y2725800 <= 9830.0] <- 9800.0
data$Y2725800 <- factor(data$Y2725800,
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
data$Y2725900[10.0 <= data$Y2725900 & data$Y2725900 <= 430.0] <- 10.0
data$Y2725900[500.0 <= data$Y2725900 & data$Y2725900 <= 950.0] <- 500.0
data$Y2725900[1000.0 <= data$Y2725900 & data$Y2725900 <= 1240.0] <- 1000.0
data$Y2725900[1300.0 <= data$Y2725900 & data$Y2725900 <= 1560.0] <- 1300.0
data$Y2725900[1600.0 <= data$Y2725900 & data$Y2725900 <= 1760.0] <- 1600.0
data$Y2725900[1800.0 <= data$Y2725900 & data$Y2725900 <= 1860.0] <- 1800.0
data$Y2725900[1900.0 <= data$Y2725900 & data$Y2725900 <= 1960.0] <- 1900.0
data$Y2725900[2000.0 <= data$Y2725900 & data$Y2725900 <= 2060.0] <- 2000.0
data$Y2725900[2100.0 <= data$Y2725900 & data$Y2725900 <= 2150.0] <- 2100.0
data$Y2725900[2200.0 <= data$Y2725900 & data$Y2725900 <= 2340.0] <- 2200.0
data$Y2725900[2400.0 <= data$Y2725900 & data$Y2725900 <= 2550.0] <- 2400.0
data$Y2725900[2600.0 <= data$Y2725900 & data$Y2725900 <= 2760.0] <- 2600.0
data$Y2725900[2800.0 <= data$Y2725900 & data$Y2725900 <= 2960.0] <- 2800.0
data$Y2725900[3000.0 <= data$Y2725900 & data$Y2725900 <= 3260.0] <- 3000.0
data$Y2725900[3300.0 <= data$Y2725900 & data$Y2725900 <= 3650.0] <- 3300.0
data$Y2725900[3700.0 <= data$Y2725900 & data$Y2725900 <= 3950.0] <- 3700.0
data$Y2725900[4000.0 <= data$Y2725900 & data$Y2725900 <= 4160.0] <- 4000.0
data$Y2725900[4200.0 <= data$Y2725900 & data$Y2725900 <= 4250.0] <- 4200.0
data$Y2725900[4300.0 <= data$Y2725900 & data$Y2725900 <= 4430.0] <- 4300.0
data$Y2725900[4500.0 <= data$Y2725900 & data$Y2725900 <= 4650.0] <- 4500.0
data$Y2725900[4700.0 <= data$Y2725900 & data$Y2725900 <= 4960.0] <- 4700.0
data$Y2725900[5000.0 <= data$Y2725900 & data$Y2725900 <= 5930.0] <- 5000.0
data$Y2725900[6000.0 <= data$Y2725900 & data$Y2725900 <= 6130.0] <- 6000.0
data$Y2725900[6200.0 <= data$Y2725900 & data$Y2725900 <= 6940.0] <- 6200.0
data$Y2725900[7000.0 <= data$Y2725900 & data$Y2725900 <= 7620.0] <- 7000.0
data$Y2725900[7700.0 <= data$Y2725900 & data$Y2725900 <= 7750.0] <- 7700.0
data$Y2725900[7800.0 <= data$Y2725900 & data$Y2725900 <= 7850.0] <- 7800.0
data$Y2725900[7900.0 <= data$Y2725900 & data$Y2725900 <= 8960.0] <- 7900.0
data$Y2725900[9000.0 <= data$Y2725900 & data$Y2725900 <= 9750.0] <- 9000.0
data$Y2725900[9800.0 <= data$Y2725900 & data$Y2725900 <= 9830.0] <- 9800.0
data$Y2725900 <- factor(data$Y2725900,
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
data$Y2726000[10.0 <= data$Y2726000 & data$Y2726000 <= 430.0] <- 10.0
data$Y2726000[500.0 <= data$Y2726000 & data$Y2726000 <= 950.0] <- 500.0
data$Y2726000[1000.0 <= data$Y2726000 & data$Y2726000 <= 1240.0] <- 1000.0
data$Y2726000[1300.0 <= data$Y2726000 & data$Y2726000 <= 1560.0] <- 1300.0
data$Y2726000[1600.0 <= data$Y2726000 & data$Y2726000 <= 1760.0] <- 1600.0
data$Y2726000[1800.0 <= data$Y2726000 & data$Y2726000 <= 1860.0] <- 1800.0
data$Y2726000[1900.0 <= data$Y2726000 & data$Y2726000 <= 1960.0] <- 1900.0
data$Y2726000[2000.0 <= data$Y2726000 & data$Y2726000 <= 2060.0] <- 2000.0
data$Y2726000[2100.0 <= data$Y2726000 & data$Y2726000 <= 2150.0] <- 2100.0
data$Y2726000[2200.0 <= data$Y2726000 & data$Y2726000 <= 2340.0] <- 2200.0
data$Y2726000[2400.0 <= data$Y2726000 & data$Y2726000 <= 2550.0] <- 2400.0
data$Y2726000[2600.0 <= data$Y2726000 & data$Y2726000 <= 2760.0] <- 2600.0
data$Y2726000[2800.0 <= data$Y2726000 & data$Y2726000 <= 2960.0] <- 2800.0
data$Y2726000[3000.0 <= data$Y2726000 & data$Y2726000 <= 3260.0] <- 3000.0
data$Y2726000[3300.0 <= data$Y2726000 & data$Y2726000 <= 3650.0] <- 3300.0
data$Y2726000[3700.0 <= data$Y2726000 & data$Y2726000 <= 3950.0] <- 3700.0
data$Y2726000[4000.0 <= data$Y2726000 & data$Y2726000 <= 4160.0] <- 4000.0
data$Y2726000[4200.0 <= data$Y2726000 & data$Y2726000 <= 4250.0] <- 4200.0
data$Y2726000[4300.0 <= data$Y2726000 & data$Y2726000 <= 4430.0] <- 4300.0
data$Y2726000[4500.0 <= data$Y2726000 & data$Y2726000 <= 4650.0] <- 4500.0
data$Y2726000[4700.0 <= data$Y2726000 & data$Y2726000 <= 4960.0] <- 4700.0
data$Y2726000[5000.0 <= data$Y2726000 & data$Y2726000 <= 5930.0] <- 5000.0
data$Y2726000[6000.0 <= data$Y2726000 & data$Y2726000 <= 6130.0] <- 6000.0
data$Y2726000[6200.0 <= data$Y2726000 & data$Y2726000 <= 6940.0] <- 6200.0
data$Y2726000[7000.0 <= data$Y2726000 & data$Y2726000 <= 7620.0] <- 7000.0
data$Y2726000[7700.0 <= data$Y2726000 & data$Y2726000 <= 7750.0] <- 7700.0
data$Y2726000[7800.0 <= data$Y2726000 & data$Y2726000 <= 7850.0] <- 7800.0
data$Y2726000[7900.0 <= data$Y2726000 & data$Y2726000 <= 8960.0] <- 7900.0
data$Y2726000[9000.0 <= data$Y2726000 & data$Y2726000 <= 9750.0] <- 9000.0
data$Y2726000[9800.0 <= data$Y2726000 & data$Y2726000 <= 9830.0] <- 9800.0
data$Y2726000 <- factor(data$Y2726000,
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
data$Y2726100[10.0 <= data$Y2726100 & data$Y2726100 <= 430.0] <- 10.0
data$Y2726100[500.0 <= data$Y2726100 & data$Y2726100 <= 950.0] <- 500.0
data$Y2726100[1000.0 <= data$Y2726100 & data$Y2726100 <= 1240.0] <- 1000.0
data$Y2726100[1300.0 <= data$Y2726100 & data$Y2726100 <= 1560.0] <- 1300.0
data$Y2726100[1600.0 <= data$Y2726100 & data$Y2726100 <= 1760.0] <- 1600.0
data$Y2726100[1800.0 <= data$Y2726100 & data$Y2726100 <= 1860.0] <- 1800.0
data$Y2726100[1900.0 <= data$Y2726100 & data$Y2726100 <= 1960.0] <- 1900.0
data$Y2726100[2000.0 <= data$Y2726100 & data$Y2726100 <= 2060.0] <- 2000.0
data$Y2726100[2100.0 <= data$Y2726100 & data$Y2726100 <= 2150.0] <- 2100.0
data$Y2726100[2200.0 <= data$Y2726100 & data$Y2726100 <= 2340.0] <- 2200.0
data$Y2726100[2400.0 <= data$Y2726100 & data$Y2726100 <= 2550.0] <- 2400.0
data$Y2726100[2600.0 <= data$Y2726100 & data$Y2726100 <= 2760.0] <- 2600.0
data$Y2726100[2800.0 <= data$Y2726100 & data$Y2726100 <= 2960.0] <- 2800.0
data$Y2726100[3000.0 <= data$Y2726100 & data$Y2726100 <= 3260.0] <- 3000.0
data$Y2726100[3300.0 <= data$Y2726100 & data$Y2726100 <= 3650.0] <- 3300.0
data$Y2726100[3700.0 <= data$Y2726100 & data$Y2726100 <= 3950.0] <- 3700.0
data$Y2726100[4000.0 <= data$Y2726100 & data$Y2726100 <= 4160.0] <- 4000.0
data$Y2726100[4200.0 <= data$Y2726100 & data$Y2726100 <= 4250.0] <- 4200.0
data$Y2726100[4300.0 <= data$Y2726100 & data$Y2726100 <= 4430.0] <- 4300.0
data$Y2726100[4500.0 <= data$Y2726100 & data$Y2726100 <= 4650.0] <- 4500.0
data$Y2726100[4700.0 <= data$Y2726100 & data$Y2726100 <= 4960.0] <- 4700.0
data$Y2726100[5000.0 <= data$Y2726100 & data$Y2726100 <= 5930.0] <- 5000.0
data$Y2726100[6000.0 <= data$Y2726100 & data$Y2726100 <= 6130.0] <- 6000.0
data$Y2726100[6200.0 <= data$Y2726100 & data$Y2726100 <= 6940.0] <- 6200.0
data$Y2726100[7000.0 <= data$Y2726100 & data$Y2726100 <= 7620.0] <- 7000.0
data$Y2726100[7700.0 <= data$Y2726100 & data$Y2726100 <= 7750.0] <- 7700.0
data$Y2726100[7800.0 <= data$Y2726100 & data$Y2726100 <= 7850.0] <- 7800.0
data$Y2726100[7900.0 <= data$Y2726100 & data$Y2726100 <= 8960.0] <- 7900.0
data$Y2726100[9000.0 <= data$Y2726100 & data$Y2726100 <= 9750.0] <- 9000.0
data$Y2726100[9800.0 <= data$Y2726100 & data$Y2726100 <= 9830.0] <- 9800.0
data$Y2726100 <- factor(data$Y2726100,
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
data$Y2885400[10.0 <= data$Y2885400 & data$Y2885400 <= 999.0] <- 10.0
data$Y2885400 <- factor(data$Y2885400,
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
data$Y3079400[10.0 <= data$Y3079400 & data$Y3079400 <= 430.0] <- 10.0
data$Y3079400[500.0 <= data$Y3079400 & data$Y3079400 <= 950.0] <- 500.0
data$Y3079400[1000.0 <= data$Y3079400 & data$Y3079400 <= 1240.0] <- 1000.0
data$Y3079400[1300.0 <= data$Y3079400 & data$Y3079400 <= 1560.0] <- 1300.0
data$Y3079400[1600.0 <= data$Y3079400 & data$Y3079400 <= 1760.0] <- 1600.0
data$Y3079400[1800.0 <= data$Y3079400 & data$Y3079400 <= 1860.0] <- 1800.0
data$Y3079400[1900.0 <= data$Y3079400 & data$Y3079400 <= 1960.0] <- 1900.0
data$Y3079400[2000.0 <= data$Y3079400 & data$Y3079400 <= 2060.0] <- 2000.0
data$Y3079400[2100.0 <= data$Y3079400 & data$Y3079400 <= 2150.0] <- 2100.0
data$Y3079400[2200.0 <= data$Y3079400 & data$Y3079400 <= 2340.0] <- 2200.0
data$Y3079400[2400.0 <= data$Y3079400 & data$Y3079400 <= 2550.0] <- 2400.0
data$Y3079400[2600.0 <= data$Y3079400 & data$Y3079400 <= 2760.0] <- 2600.0
data$Y3079400[2800.0 <= data$Y3079400 & data$Y3079400 <= 2960.0] <- 2800.0
data$Y3079400[3000.0 <= data$Y3079400 & data$Y3079400 <= 3260.0] <- 3000.0
data$Y3079400[3300.0 <= data$Y3079400 & data$Y3079400 <= 3650.0] <- 3300.0
data$Y3079400[3700.0 <= data$Y3079400 & data$Y3079400 <= 3950.0] <- 3700.0
data$Y3079400[4000.0 <= data$Y3079400 & data$Y3079400 <= 4160.0] <- 4000.0
data$Y3079400[4200.0 <= data$Y3079400 & data$Y3079400 <= 4250.0] <- 4200.0
data$Y3079400[4300.0 <= data$Y3079400 & data$Y3079400 <= 4430.0] <- 4300.0
data$Y3079400[4500.0 <= data$Y3079400 & data$Y3079400 <= 4650.0] <- 4500.0
data$Y3079400[4700.0 <= data$Y3079400 & data$Y3079400 <= 4960.0] <- 4700.0
data$Y3079400[5000.0 <= data$Y3079400 & data$Y3079400 <= 5930.0] <- 5000.0
data$Y3079400[6000.0 <= data$Y3079400 & data$Y3079400 <= 6130.0] <- 6000.0
data$Y3079400[6200.0 <= data$Y3079400 & data$Y3079400 <= 6940.0] <- 6200.0
data$Y3079400[7000.0 <= data$Y3079400 & data$Y3079400 <= 7620.0] <- 7000.0
data$Y3079400[7700.0 <= data$Y3079400 & data$Y3079400 <= 7750.0] <- 7700.0
data$Y3079400[7800.0 <= data$Y3079400 & data$Y3079400 <= 7850.0] <- 7800.0
data$Y3079400[7900.0 <= data$Y3079400 & data$Y3079400 <= 8960.0] <- 7900.0
data$Y3079400[9000.0 <= data$Y3079400 & data$Y3079400 <= 9750.0] <- 9000.0
data$Y3079400[9800.0 <= data$Y3079400 & data$Y3079400 <= 9830.0] <- 9800.0
data$Y3079400 <- factor(data$Y3079400,
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
data$Y3079500[10.0 <= data$Y3079500 & data$Y3079500 <= 430.0] <- 10.0
data$Y3079500[500.0 <= data$Y3079500 & data$Y3079500 <= 950.0] <- 500.0
data$Y3079500[1000.0 <= data$Y3079500 & data$Y3079500 <= 1240.0] <- 1000.0
data$Y3079500[1300.0 <= data$Y3079500 & data$Y3079500 <= 1560.0] <- 1300.0
data$Y3079500[1600.0 <= data$Y3079500 & data$Y3079500 <= 1760.0] <- 1600.0
data$Y3079500[1800.0 <= data$Y3079500 & data$Y3079500 <= 1860.0] <- 1800.0
data$Y3079500[1900.0 <= data$Y3079500 & data$Y3079500 <= 1960.0] <- 1900.0
data$Y3079500[2000.0 <= data$Y3079500 & data$Y3079500 <= 2060.0] <- 2000.0
data$Y3079500[2100.0 <= data$Y3079500 & data$Y3079500 <= 2150.0] <- 2100.0
data$Y3079500[2200.0 <= data$Y3079500 & data$Y3079500 <= 2340.0] <- 2200.0
data$Y3079500[2400.0 <= data$Y3079500 & data$Y3079500 <= 2550.0] <- 2400.0
data$Y3079500[2600.0 <= data$Y3079500 & data$Y3079500 <= 2760.0] <- 2600.0
data$Y3079500[2800.0 <= data$Y3079500 & data$Y3079500 <= 2960.0] <- 2800.0
data$Y3079500[3000.0 <= data$Y3079500 & data$Y3079500 <= 3260.0] <- 3000.0
data$Y3079500[3300.0 <= data$Y3079500 & data$Y3079500 <= 3650.0] <- 3300.0
data$Y3079500[3700.0 <= data$Y3079500 & data$Y3079500 <= 3950.0] <- 3700.0
data$Y3079500[4000.0 <= data$Y3079500 & data$Y3079500 <= 4160.0] <- 4000.0
data$Y3079500[4200.0 <= data$Y3079500 & data$Y3079500 <= 4250.0] <- 4200.0
data$Y3079500[4300.0 <= data$Y3079500 & data$Y3079500 <= 4430.0] <- 4300.0
data$Y3079500[4500.0 <= data$Y3079500 & data$Y3079500 <= 4650.0] <- 4500.0
data$Y3079500[4700.0 <= data$Y3079500 & data$Y3079500 <= 4960.0] <- 4700.0
data$Y3079500[5000.0 <= data$Y3079500 & data$Y3079500 <= 5930.0] <- 5000.0
data$Y3079500[6000.0 <= data$Y3079500 & data$Y3079500 <= 6130.0] <- 6000.0
data$Y3079500[6200.0 <= data$Y3079500 & data$Y3079500 <= 6940.0] <- 6200.0
data$Y3079500[7000.0 <= data$Y3079500 & data$Y3079500 <= 7620.0] <- 7000.0
data$Y3079500[7700.0 <= data$Y3079500 & data$Y3079500 <= 7750.0] <- 7700.0
data$Y3079500[7800.0 <= data$Y3079500 & data$Y3079500 <= 7850.0] <- 7800.0
data$Y3079500[7900.0 <= data$Y3079500 & data$Y3079500 <= 8960.0] <- 7900.0
data$Y3079500[9000.0 <= data$Y3079500 & data$Y3079500 <= 9750.0] <- 9000.0
data$Y3079500[9800.0 <= data$Y3079500 & data$Y3079500 <= 9830.0] <- 9800.0
data$Y3079500 <- factor(data$Y3079500,
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
data$Y3079600[10.0 <= data$Y3079600 & data$Y3079600 <= 430.0] <- 10.0
data$Y3079600[500.0 <= data$Y3079600 & data$Y3079600 <= 950.0] <- 500.0
data$Y3079600[1000.0 <= data$Y3079600 & data$Y3079600 <= 1240.0] <- 1000.0
data$Y3079600[1300.0 <= data$Y3079600 & data$Y3079600 <= 1560.0] <- 1300.0
data$Y3079600[1600.0 <= data$Y3079600 & data$Y3079600 <= 1760.0] <- 1600.0
data$Y3079600[1800.0 <= data$Y3079600 & data$Y3079600 <= 1860.0] <- 1800.0
data$Y3079600[1900.0 <= data$Y3079600 & data$Y3079600 <= 1960.0] <- 1900.0
data$Y3079600[2000.0 <= data$Y3079600 & data$Y3079600 <= 2060.0] <- 2000.0
data$Y3079600[2100.0 <= data$Y3079600 & data$Y3079600 <= 2150.0] <- 2100.0
data$Y3079600[2200.0 <= data$Y3079600 & data$Y3079600 <= 2340.0] <- 2200.0
data$Y3079600[2400.0 <= data$Y3079600 & data$Y3079600 <= 2550.0] <- 2400.0
data$Y3079600[2600.0 <= data$Y3079600 & data$Y3079600 <= 2760.0] <- 2600.0
data$Y3079600[2800.0 <= data$Y3079600 & data$Y3079600 <= 2960.0] <- 2800.0
data$Y3079600[3000.0 <= data$Y3079600 & data$Y3079600 <= 3260.0] <- 3000.0
data$Y3079600[3300.0 <= data$Y3079600 & data$Y3079600 <= 3650.0] <- 3300.0
data$Y3079600[3700.0 <= data$Y3079600 & data$Y3079600 <= 3950.0] <- 3700.0
data$Y3079600[4000.0 <= data$Y3079600 & data$Y3079600 <= 4160.0] <- 4000.0
data$Y3079600[4200.0 <= data$Y3079600 & data$Y3079600 <= 4250.0] <- 4200.0
data$Y3079600[4300.0 <= data$Y3079600 & data$Y3079600 <= 4430.0] <- 4300.0
data$Y3079600[4500.0 <= data$Y3079600 & data$Y3079600 <= 4650.0] <- 4500.0
data$Y3079600[4700.0 <= data$Y3079600 & data$Y3079600 <= 4960.0] <- 4700.0
data$Y3079600[5000.0 <= data$Y3079600 & data$Y3079600 <= 5930.0] <- 5000.0
data$Y3079600[6000.0 <= data$Y3079600 & data$Y3079600 <= 6130.0] <- 6000.0
data$Y3079600[6200.0 <= data$Y3079600 & data$Y3079600 <= 6940.0] <- 6200.0
data$Y3079600[7000.0 <= data$Y3079600 & data$Y3079600 <= 7620.0] <- 7000.0
data$Y3079600[7700.0 <= data$Y3079600 & data$Y3079600 <= 7750.0] <- 7700.0
data$Y3079600[7800.0 <= data$Y3079600 & data$Y3079600 <= 7850.0] <- 7800.0
data$Y3079600[7900.0 <= data$Y3079600 & data$Y3079600 <= 8960.0] <- 7900.0
data$Y3079600[9000.0 <= data$Y3079600 & data$Y3079600 <= 9750.0] <- 9000.0
data$Y3079600[9800.0 <= data$Y3079600 & data$Y3079600 <= 9830.0] <- 9800.0
data$Y3079600 <- factor(data$Y3079600,
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
data$Y3079700[10.0 <= data$Y3079700 & data$Y3079700 <= 430.0] <- 10.0
data$Y3079700[500.0 <= data$Y3079700 & data$Y3079700 <= 950.0] <- 500.0
data$Y3079700[1000.0 <= data$Y3079700 & data$Y3079700 <= 1240.0] <- 1000.0
data$Y3079700[1300.0 <= data$Y3079700 & data$Y3079700 <= 1560.0] <- 1300.0
data$Y3079700[1600.0 <= data$Y3079700 & data$Y3079700 <= 1760.0] <- 1600.0
data$Y3079700[1800.0 <= data$Y3079700 & data$Y3079700 <= 1860.0] <- 1800.0
data$Y3079700[1900.0 <= data$Y3079700 & data$Y3079700 <= 1960.0] <- 1900.0
data$Y3079700[2000.0 <= data$Y3079700 & data$Y3079700 <= 2060.0] <- 2000.0
data$Y3079700[2100.0 <= data$Y3079700 & data$Y3079700 <= 2150.0] <- 2100.0
data$Y3079700[2200.0 <= data$Y3079700 & data$Y3079700 <= 2340.0] <- 2200.0
data$Y3079700[2400.0 <= data$Y3079700 & data$Y3079700 <= 2550.0] <- 2400.0
data$Y3079700[2600.0 <= data$Y3079700 & data$Y3079700 <= 2760.0] <- 2600.0
data$Y3079700[2800.0 <= data$Y3079700 & data$Y3079700 <= 2960.0] <- 2800.0
data$Y3079700[3000.0 <= data$Y3079700 & data$Y3079700 <= 3260.0] <- 3000.0
data$Y3079700[3300.0 <= data$Y3079700 & data$Y3079700 <= 3650.0] <- 3300.0
data$Y3079700[3700.0 <= data$Y3079700 & data$Y3079700 <= 3950.0] <- 3700.0
data$Y3079700[4000.0 <= data$Y3079700 & data$Y3079700 <= 4160.0] <- 4000.0
data$Y3079700[4200.0 <= data$Y3079700 & data$Y3079700 <= 4250.0] <- 4200.0
data$Y3079700[4300.0 <= data$Y3079700 & data$Y3079700 <= 4430.0] <- 4300.0
data$Y3079700[4500.0 <= data$Y3079700 & data$Y3079700 <= 4650.0] <- 4500.0
data$Y3079700[4700.0 <= data$Y3079700 & data$Y3079700 <= 4960.0] <- 4700.0
data$Y3079700[5000.0 <= data$Y3079700 & data$Y3079700 <= 5930.0] <- 5000.0
data$Y3079700[6000.0 <= data$Y3079700 & data$Y3079700 <= 6130.0] <- 6000.0
data$Y3079700[6200.0 <= data$Y3079700 & data$Y3079700 <= 6940.0] <- 6200.0
data$Y3079700[7000.0 <= data$Y3079700 & data$Y3079700 <= 7620.0] <- 7000.0
data$Y3079700[7700.0 <= data$Y3079700 & data$Y3079700 <= 7750.0] <- 7700.0
data$Y3079700[7800.0 <= data$Y3079700 & data$Y3079700 <= 7850.0] <- 7800.0
data$Y3079700[7900.0 <= data$Y3079700 & data$Y3079700 <= 8960.0] <- 7900.0
data$Y3079700[9000.0 <= data$Y3079700 & data$Y3079700 <= 9750.0] <- 9000.0
data$Y3079700[9800.0 <= data$Y3079700 & data$Y3079700 <= 9830.0] <- 9800.0
data$Y3079700 <- factor(data$Y3079700,
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
data$Y3079800[10.0 <= data$Y3079800 & data$Y3079800 <= 430.0] <- 10.0
data$Y3079800[500.0 <= data$Y3079800 & data$Y3079800 <= 950.0] <- 500.0
data$Y3079800[1000.0 <= data$Y3079800 & data$Y3079800 <= 1240.0] <- 1000.0
data$Y3079800[1300.0 <= data$Y3079800 & data$Y3079800 <= 1560.0] <- 1300.0
data$Y3079800[1600.0 <= data$Y3079800 & data$Y3079800 <= 1760.0] <- 1600.0
data$Y3079800[1800.0 <= data$Y3079800 & data$Y3079800 <= 1860.0] <- 1800.0
data$Y3079800[1900.0 <= data$Y3079800 & data$Y3079800 <= 1960.0] <- 1900.0
data$Y3079800[2000.0 <= data$Y3079800 & data$Y3079800 <= 2060.0] <- 2000.0
data$Y3079800[2100.0 <= data$Y3079800 & data$Y3079800 <= 2150.0] <- 2100.0
data$Y3079800[2200.0 <= data$Y3079800 & data$Y3079800 <= 2340.0] <- 2200.0
data$Y3079800[2400.0 <= data$Y3079800 & data$Y3079800 <= 2550.0] <- 2400.0
data$Y3079800[2600.0 <= data$Y3079800 & data$Y3079800 <= 2760.0] <- 2600.0
data$Y3079800[2800.0 <= data$Y3079800 & data$Y3079800 <= 2960.0] <- 2800.0
data$Y3079800[3000.0 <= data$Y3079800 & data$Y3079800 <= 3260.0] <- 3000.0
data$Y3079800[3300.0 <= data$Y3079800 & data$Y3079800 <= 3650.0] <- 3300.0
data$Y3079800[3700.0 <= data$Y3079800 & data$Y3079800 <= 3950.0] <- 3700.0
data$Y3079800[4000.0 <= data$Y3079800 & data$Y3079800 <= 4160.0] <- 4000.0
data$Y3079800[4200.0 <= data$Y3079800 & data$Y3079800 <= 4250.0] <- 4200.0
data$Y3079800[4300.0 <= data$Y3079800 & data$Y3079800 <= 4430.0] <- 4300.0
data$Y3079800[4500.0 <= data$Y3079800 & data$Y3079800 <= 4650.0] <- 4500.0
data$Y3079800[4700.0 <= data$Y3079800 & data$Y3079800 <= 4960.0] <- 4700.0
data$Y3079800[5000.0 <= data$Y3079800 & data$Y3079800 <= 5930.0] <- 5000.0
data$Y3079800[6000.0 <= data$Y3079800 & data$Y3079800 <= 6130.0] <- 6000.0
data$Y3079800[6200.0 <= data$Y3079800 & data$Y3079800 <= 6940.0] <- 6200.0
data$Y3079800[7000.0 <= data$Y3079800 & data$Y3079800 <= 7620.0] <- 7000.0
data$Y3079800[7700.0 <= data$Y3079800 & data$Y3079800 <= 7750.0] <- 7700.0
data$Y3079800[7800.0 <= data$Y3079800 & data$Y3079800 <= 7850.0] <- 7800.0
data$Y3079800[7900.0 <= data$Y3079800 & data$Y3079800 <= 8960.0] <- 7900.0
data$Y3079800[9000.0 <= data$Y3079800 & data$Y3079800 <= 9750.0] <- 9000.0
data$Y3079800[9800.0 <= data$Y3079800 & data$Y3079800 <= 9830.0] <- 9800.0
data$Y3079800 <- factor(data$Y3079800,
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
return(data)
}

varlabels <- c("ID CODE OF CHILD",
"ID CODE OF MOTHER OF CHILD",
"RACE OF CHILD (FROM MOTHERS SCREENER 79)",
"SEX OF CHILD",
"DATE OF BIRTH OF CHILD - YEAR",
"VERSION_R29 CHILD/YOUNG ADULT XRND",
"OCCUPATION (2000 CENSUS 4 DGT) L1 2010",
"OCCUPATION (2000 CENSUS 4 DGT) L2 2010",
"OCCUPATION (2000 CENSUS 4 DGT) L3 2010",
"OCCUPATION (2000 CENSUS 4 DGT) L4 2010",
"OCCUPATION (2000 CENSUS 4 DGT) L5 2010",
"# TIMES PAST 7 DAYS R HAD SOFT DRINK/SODA W/SUGAR 2010",
"TOTAL FAMILY INCOME FROM ALL SOURCES (BEST EST) 09 2010",
"OCCUPATION (2000 CENSUS 4 DGT) L1 2012",
"OCCUPATION (2000 CENSUS 4 DGT) L2 2012",
"OCCUPATION (2000 CENSUS 4 DGT) L3 2012",
"OCCUPATION (2000 CENSUS 4 DGT) L4 2012",
"OCCUPATION (2000 CENSUS 4 DGT) L5 2012",
"HOW OFT READ NUTR INFO 1ST TM BUY FOOD ITEM (CAT) 2012",
"HOW OFT READ INGRED LIST 1ST BUY FOOD ITEM (CAT) 2012",
"# TIMES PAST 7 DAYS R HAD SOFT DRINK/SODA W/SUGAR 2012",
"TOTAL FAMILY INCOME FROM ALL SOURCES (BEST EST) 11 2012",
"IS RESIDENCE IN SMSA? 2012",
"OCCUPATION (2000 CENSUS 4 DGT) L1 2014",
"OCCUPATION (2000 CENSUS 4 DGT) L2 2014",
"OCCUPATION (2000 CENSUS 4 DGT) L3 2014",
"OCCUPATION (2000 CENSUS 4 DGT) L4 2014",
"OCCUPATION (2000 CENSUS 4 DGT) L5 2014",
"TIMES IN TYP WEEK R DRINKS SOFT DRINK/SODA W/SUGAR 2014",
"HOW OFT READ NUTR INFO 1ST TM BUY FOOD ITEM (CAT) 2014",
"HOW OFT READ INGRED LIST 1ST BUY FOOD ITEM (CAT) 2014",
"DR TOLD R THAT R HAS DIABETES/HIGH BLD SUGAR EVER 2014",
"TOTAL FAMILY INCOME FROM ALL SOURCES (BEST EST) 2014",
"IS RESIDENCE IN SMSA? 2014",
"HOW OFT READ NUTR INFO 1ST TM BUY FOOD ITEM (CAT) 2016",
"HOW OFT READ INGRED LIST 1ST BUY FOOD ITEM (CAT) 2016",
"DR TOLD R THAT R HAS DIABETES/HIGH BLD SUGAR EVER 2016",
"IS RESIDENCE IN SMSA? 2016",
"DR TOLD R THAT R HAS DIABETES/HIGH BLD SUGAR EVER 2018",
"DR TOLD R THAT R HAS DIABETES/HIGH BLD SUGAR EVER 2020"
)


# Use qnames rather than rnums

qnames = function(data) {
names(data) <- c("CPUBID_XRND",
"MPUBID_XRND",
"CRACE_XRND",
"CSEX_XRND",
"CYRB_XRND",
"VERSION_R29_XRND",
"OCC2000.01_2010",
"OCC2000.02_2010",
"OCC2000.03_2010",
"OCC2000.04_2010",
"OCC2000.05_2010",
"Q14-10QA_2010",
"Q15-142_2010",
"OCC2000.01_2012",
"OCC2000.02_2012",
"OCC2000.03_2012",
"OCC2000.04_2012",
"OCC2000.05_2012",
"Q14-10M_2012",
"Q14-10N_2012",
"Q14-10QA_2012",
"Q15-142_2012",
"SMSARES_2012",
"OCC2000.01_2014",
"OCC2000.02_2014",
"OCC2000.03_2014",
"OCC2000.04_2014",
"OCC2000.05_2014",
"Q14-10QA_2014",
"Q14-10M_2014",
"Q14-10N_2014",
"Q14-45H_2014",
"Q15-142_2014",
"SMSARES_2014",
"Q14-10M_2016",
"Q14-10N_2016",
"Q14-45H_2016",
"SMSARES_2016",
"Q14-45H_2018",
"Q14-45H_2020")
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

