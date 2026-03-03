
# Set working directory
# setwd()


new_data <- read.table('Y97_2909_child_count.dat', sep=' ')
names(new_data) <- c('R0000100',
'R1211100',
'R2570100',
'R3892100',
'R5474100',
'R7237800',
'S1553100',
'S2022700',
'S3823600',
'S5423600',
'S7525700',
'T0026000',
'T2020900',
'T3611600',
'T5211700',
'T6663100',
'T8134300',
'U0014800')


# Handle missing values

new_data[new_data == -1] = NA  # Refused
new_data[new_data == -2] = NA  # Dont know
new_data[new_data == -3] = NA  # Invalid missing
new_data[new_data == -4] = NA  # Valid missing
new_data[new_data == -5] = NA  # Non-interview


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$R1211100 <- factor(data$R1211100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5"))
  data$R2570100 <- factor(data$R2570100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5"))
  data$R3892100 <- factor(data$R3892100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5"))
  data$R5474100 <- factor(data$R5474100,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5"))
  data$R7237800 <- factor(data$R7237800,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5"))
return(data)
}


# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {
data$R0000100[1.0 <= data$R0000100 & data$R0000100 <= 999.0] <- 1.0
data$R0000100[1000.0 <= data$R0000100 & data$R0000100 <= 1999.0] <- 1000.0
data$R0000100[2000.0 <= data$R0000100 & data$R0000100 <= 2999.0] <- 2000.0
data$R0000100[3000.0 <= data$R0000100 & data$R0000100 <= 3999.0] <- 3000.0
data$R0000100[4000.0 <= data$R0000100 & data$R0000100 <= 4999.0] <- 4000.0
data$R0000100[5000.0 <= data$R0000100 & data$R0000100 <= 5999.0] <- 5000.0
data$R0000100[6000.0 <= data$R0000100 & data$R0000100 <= 6999.0] <- 6000.0
data$R0000100[7000.0 <= data$R0000100 & data$R0000100 <= 7999.0] <- 7000.0
data$R0000100[8000.0 <= data$R0000100 & data$R0000100 <= 8999.0] <- 8000.0
data$R0000100[9000.0 <= data$R0000100 & data$R0000100 <= 9999.0] <- 9000.0
data$R0000100 <- factor(data$R0000100,
levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0),
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
"9000 TO 9999"))
data$S1553100[10.0 <= data$S1553100 & data$S1553100 <= 999.0] <- 10.0
data$S1553100 <- factor(data$S1553100,
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
data$S2022700[10.0 <= data$S2022700 & data$S2022700 <= 999.0] <- 10.0
data$S2022700 <- factor(data$S2022700,
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
data$S3823600[10.0 <= data$S3823600 & data$S3823600 <= 999.0] <- 10.0
data$S3823600 <- factor(data$S3823600,
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
data$S5423600[10.0 <= data$S5423600 & data$S5423600 <= 999.0] <- 10.0
data$S5423600 <- factor(data$S5423600,
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
data$S7525700[10.0 <= data$S7525700 & data$S7525700 <= 999.0] <- 10.0
data$S7525700 <- factor(data$S7525700,
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
data$T0026000[10.0 <= data$T0026000 & data$T0026000 <= 999.0] <- 10.0
data$T0026000 <- factor(data$T0026000,
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
data$T2020900[10.0 <= data$T2020900 & data$T2020900 <= 999.0] <- 10.0
data$T2020900 <- factor(data$T2020900,
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
data$T3611600[10.0 <= data$T3611600 & data$T3611600 <= 999.0] <- 10.0
data$T3611600 <- factor(data$T3611600,
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
data$T5211700[10.0 <= data$T5211700 & data$T5211700 <= 999.0] <- 10.0
data$T5211700 <- factor(data$T5211700,
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
data$T6663100[10.0 <= data$T6663100 & data$T6663100 <= 999.0] <- 10.0
data$T6663100 <- factor(data$T6663100,
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
data$T8134300[10.0 <= data$T8134300 & data$T8134300 <= 999.0] <- 10.0
data$T8134300 <- factor(data$T8134300,
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
data$U0014800[10.0 <= data$U0014800 & data$U0014800 <= 999.0] <- 10.0
data$U0014800 <- factor(data$U0014800,
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

varlabels <- c("PUBID - YTH ID CODE 1997",
"CV_BIO_CHILD_HH 1997",
"CV_BIO_CHILD_HH 1998",
"CV_BIO_CHILD_HH 1999",
"CV_BIO_CHILD_HH 2000",
"CV_BIO_CHILD_HH 2001",
"CV_BIO_CHILD_HH 2002",
"CV_BIO_CHILD_HH 2003",
"CV_BIO_CHILD_HH 2004",
"CV_BIO_CHILD_HH 2005",
"CV_BIO_CHILD_HH 2006",
"CV_BIO_CHILD_HH 2007",
"CV_BIO_CHILD_HH 2008",
"CV_BIO_CHILD_HH 2009",
"CV_BIO_CHILD_HH 2010",
"CV_BIO_CHILD_HH 2011",
"CV_BIO_CHILD_HH 2013",
"CV_BIO_CHILD_HH 2015"
)


# Use qnames rather than rnums

qnames = function(data) {
names(data) <- c("PUBID_1997",
"CV_BIO_CHILD_HH_1997",
"CV_BIO_CHILD_HH_1998",
"CV_BIO_CHILD_HH_1999",
"CV_BIO_CHILD_HH_2000",
"CV_BIO_CHILD_HH_2001",
"CV_BIO_CHILD_HH_2002",
"CV_BIO_CHILD_HH_2003",
"CV_BIO_CHILD_HH_2004",
"CV_BIO_CHILD_HH_2005",
"CV_BIO_CHILD_HH_2006",
"CV_BIO_CHILD_HH_2007",
"CV_BIO_CHILD_HH_2008",
"CV_BIO_CHILD_HH_2009",
"CV_BIO_CHILD_HH_2010",
"CV_BIO_CHILD_HH_2011",
"CV_BIO_CHILD_HH_2013",
"CV_BIO_CHILD_HH_2015")
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

