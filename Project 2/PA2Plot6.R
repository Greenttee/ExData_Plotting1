#
# Project Assignment 2 - Plot 6
#
# Compare Emission Trend for Motor Vehicles in Baltimore and Los Angeles County between 1999-2008
#


library(ggplot2)

setwd("C:/Users/Tony Truong/Desktop/Coursera R/Exploratory Data Analysis/Project Assignment 2")

# Read in data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out Baltimore & Los Angeles Data only

BltLAfips<-c("24510","06037")

NEIBltLA<-NEI[NEI$fips %in% BltLAfips,]

# The next few steps are the same as in plot4.

# Through much trials and errors subsetting on various permutations of "motor" "vehicles" "auto" etc.
# I found that just using "vehicle" captures 99.9% of what we need to capture.
# All the subsetted data are of the on.road category so that could have been used too....
#

VehicleSCC<-SCC[grep("vehicle", SCC$EI.Sector, ignore.case=T),]

# subset out  Data for Vehicles in Baltimore & Los Angeles

VBltLA<-NEIBltLA[NEIBltLA$SCC %in% VehicleSCC$SCC,]

VBltLATab<- data.frame(xtabs(Emissions~year + fips, data=VBltLA))

colnames(VBltLATab)[3]<-"TotalEmissions"

VBltLATab$year<-as.Date(VBltLATab$year, "%Y")

# To identify which city has increasing or decreasing pollution, I plotted a line.
# Los Angeles shows increasing trend (I guess from population growth)
# as compared to Baltimore (everything else being equal)
png(filename="PA2plot6.png")

g6<-ggplot(VBltLATab, aes(year, TotalEmissions))

g6 +facet_grid(.~fips) + geom_point() + geom_smooth(method = "lm")+ geom_line()+ggtitle("Total Vehicle Emission in Baltimore & Los Angeles 1999-2008")


dev.off()