# Project Assignment 2 - Plot 3

# Total Annual Emssion Trend by Source in Baltimore

library(ggplot2)

setwd("C:/Users/Tony Truong/Desktop/Coursera R/Exploratory Data Analysis/Project Assignment 2")

# Read in data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out Baltimore Data only

NEIBaltimore<-NEI[NEI$fips == "24510",]

# Run a crosstab to get Total Emissions by source type and year.  Results are shown below
 
Tabs<-xtabs(Emissions~type + year, data=NEIBaltimore)
# >Tabs
#year
 #type             1999       2002       2005       2008
 #NON-ROAD  522.94000  240.84692  248.93369   55.82356
 #NONPOINT 2107.62500 1509.50000 1509.50000 1373.20731
 #ON-ROAD   346.82000  134.30882  130.43038   88.27546
 #POINT     296.79500  569.26000 1202.49000  344.97518
     
# Convert Tabs into data.frame
 
Tabs<-data.frame(Tabs)

# Relabel column "Freq" in Tabs to TotalEmissions
 
colnames(Tabs)[3]<-"TotalEmissions"
#
# Convert year from factor to date for plotting
# 
Tabs$year<-as.Date(Tabs$year, "%Y")
 
# Open file to save png plot

png(filename="PA2plot3.png")
 
g<-ggplot(Tabs, aes(year, TotalEmissions, color=type))
 
print(g+geom_line() + geom_point() + ggtitle("Total Emissions declined for all source types except POINT"))
 g
dev.off()