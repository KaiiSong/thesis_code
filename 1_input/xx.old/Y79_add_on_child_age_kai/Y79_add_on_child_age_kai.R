
# Set working directory
# setwd()


new_data <- read.table('Y79_add_on_child_age_kai.dat', sep=' ')
names(new_data) <- c('R0000100',
'R9900002')


# Handle missing values

new_data[new_data == -1] = NA  # Refused
new_data[new_data == -2] = NA  # Dont know
new_data[new_data == -3] = NA  # Invalid missing
new_data[new_data == -4] = NA  # Valid missing
new_data[new_data == -5] = NA  # Non-interview


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
return(data)
}


# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {
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
return(data)
}

varlabels <- c("ID# (1-12686) 79",
"DATE OF BIRTH OF 1ST CHILD - YEAR XRND"
)


# Use qnames rather than rnums

qnames = function(data) {
names(data) <- c("CASEID_1979",
"C1DOB~Y_XRND")
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

