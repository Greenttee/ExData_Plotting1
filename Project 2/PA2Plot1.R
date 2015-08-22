# Project Assignment 2 - Plot 1
# Total Annual Emssion Trend 


setwd("C:/Users/Tony Truong/Desktop/Coursera R/Exploratory Data Analysis/Project Assignment 2")

# Read in data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out PM25 data by year to calculate total annual PM25 emission.

PM1999<-NEI[NEI$year == 1999,]
PM2002<-NEI[NEI$year == 2002,]
PM2005<-NEI[NEI$year == 2005,]
PM2008<-NEI[NEI$year == 2008,]

# Calculate annual emission

Sum1999<-sum(PM1999$Emissions,na.rm=T)
Sum2002<-sum(PM2002$Emissions,na.rm=T)
Sum2005<-sum(PM2005$Emissions,na.rm=T)
Sum2008<-sum(PM2008$Emissions,na.rm=T)

# Create a table for plotting

SumTable<-data.frame(Year = c(1999, 2002, 2005, 2008), SumPM25=c(Sum1999, Sum2002, Sum2005, Sum2008))

modelAll<-lm(SumPM25~Year, SumTable)

#Open png file to outplut plot result.   Emission decreased significantly from 1999 through 2005.

png(filename="PA2plot1.png")

plot(SumTable, type = "p", ylab="Annual Total Emission", main="Total Annual Emission Declined 1999-2008")
abline(modelAll, lwd=2)
dev.off()