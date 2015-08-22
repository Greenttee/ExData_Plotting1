#
# Project Assignment 2 - Plot 4
#
# Emission Trend for Coal Combustion Sources in US between 1999-2008
#

setwd("C:/Users/Tony Truong/Desktop/Coursera R/Exploratory Data Analysis/Project Assignment 2")

# Read in data from files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# I looked up "comb" for combustion and "coal" entries in SCC$EI.Sector, and SCC$Short.Name
# 
# There are more "coal" entries but some of these entries are not of the combustion type
# (it's a logical & function).
# Ultimately just subsetting for "coal" on EI.Sector yeilds 99 coal combustion SCC codes.
# 
CoalComb<-SCC[grep("coal", SCC$EI.Sector, ignore.case=T),]

# Now create a vector of Coal Combustion SCC codes for subsetting NEI data.



# subset out CoalComb Data

CoalCombNEI<-NEI[NEI$SCC %in% CoalComb$SCC,]

# Calculate sum of Coal Combustion Emission by year

CoalCombTab<-data.frame(xtabs(Emissions~year, data=CoalCombNEI))

# Change column heading from "Freq" to "TotalEmissions"

colnames(CoalCombTab)[2]<-"TotalEmissions"

CoalCombTab$year<-as.Date(CoalCombTab$year, "%Y")

# Open file to save png plot

png(filename="PA2plot4.png")

g4<-ggplot(CoalCombTab, aes(year, TotalEmissions))

g4 + geom_point() + geom_line()+ggtitle("Total Coal Combustion Emission in US 1999-2008")

dev.off()