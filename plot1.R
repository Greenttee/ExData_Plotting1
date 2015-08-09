# Project 1 Exploratory Data Analysis
# Github account: Greenttee
#

# Read in raw data.  
 
PowerData<-read.table("./Power.txt", header = TRUE, sep = ";", na.strings="?")

# Convert Date column from factor to date

PowerData$Date<-as.Date(PowerData$Date, "%d/%m/%Y")

# Subsetting data to the date range of interest 2007-02-01 to 2007-02-02

PlotData<-subset(PowerData, Date>="2007-02-01" & Date<="2007-02-02")

# Create a new vector combining Date and Time

DateTime<-paste(PlotData$Date, PlotData$Time)

# Insert DateTime as new column in PlotData and convert to POSIXct format

PlotData$DateTime<-as.POSIXct(DateTime, format="%Y-%m-%d %H:%M:%S")


#Plot the Global Active Power with main title, color and x label modified to match requirements

# This plot is on screen so I can see what I am doing and making sure everything is right!)

hist(PlotData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Open a png file (png graphics device)

png(filename="plot1.png")

# Now plot out to png device.  Then close off the png device.

with(PlotData,hist(PlotData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

device.off()
