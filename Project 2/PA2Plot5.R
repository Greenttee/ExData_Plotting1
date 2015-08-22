#
# Project Assignment 2 - Plot 5
#
# Emission Trend for Motor Vehicles in Baltimore between 1999-2008
#
library(ggplot2)

setwd("C:/Users/Tony Truong/Desktop/Coursera R/Exploratory Data Analysis/Project Assignment 2")

# Read in data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out Baltimore Data only

NEIBaltimore<-NEI[NEI$fips == "24510",]

# Through much trials and errors subsetting on various permutations of "motor" "vehicles" "auto" etc.
# I found that just using "vehicle" captures 99.9% of what we need to capture.
# All the subsetted data are of the on.road category so that could have been used too....
#
VehicleSCC<-SCC[grep("vehicle", SCC$EI.Sector, ignore.case=T),]

# subset out  Data for Vehicles in Baltimore

VSCC<-as.character(VehicleSCC$SCC) # actually this step is not needed... it works fine without this conversion...

VBaltimore<-NEIBaltimore[NEIBaltimore$SCC %in% VSCC,]

VBaltimoreTab<- data.frame(xtabs(Emissions~year, data=VBaltimore))
                     
colnames(VBaltimoreTab)[2]<-"TotalEmissions"
VBaltimoreTab$year<-as.Date(VBaltimoreTab$year, "%Y")

png(filename="PA2plot5.png")

g5<-ggplot(VBaltimoreTab, aes(year, TotalEmissions))

g5 + geom_point() + geom_line()+ggtitle("Total Vehicle Emission in Baltimore 1999-2008")

dev.off()