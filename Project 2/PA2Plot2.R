# Project Assignment 2 - Plot 2

# Total Annual Emssion Trend - Baltimore - fips == 24510


setwd("C:/Users/Tony Truong/Desktop/Coursera R/Exploratory Data Analysis/Project Assignment 2")

# Read in data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out Baltimore Data only

NEIBaltimore<-NEI[NEI$fips %in% "24510",]

#Subset out PM25 data by year to calculate total annual PM25 emission.

PM1999B<-NEIBaltimore[NEIBaltimore$year == 1999,]
PM2002B<-NEIBaltimore[NEIBaltimore$year == 2002,]
PM2005B<-NEIBaltimore[NEIBaltimore$year == 2005,]
PM2008B<-NEIBaltimore[NEIBaltimore$year == 2008,]

# Calculate annual emission

Sum1999B<-sum(PM1999B$Emissions,na.rm=T)
Sum2002B<-sum(PM2002B$Emissions,na.rm=T)
Sum2005B<-sum(PM2005B$Emissions,na.rm=T)
Sum2008B<-sum(PM2008B$Emissions,na.rm=T)

# Create a table for plotting

SumTableB<-data.frame(Year = c(1999, 2002, 2005, 2008), SumPM25B=c(Sum1999B, Sum2002B, Sum2005B, Sum2008B))

modelB<-lm(SumPM25B ~ Year, SumTableB)


#Open png file to outplut plot result.   Emission decreased significantly from 1999 through 2005.

png(filename="PA2plot2.png")

plot(SumTableB, type = "p", ylab="Annual Total Emission", main="Total Annual Emission in Baltimore Declined 1999-2008")
abline(modelB, lwd =2)
dev.off()