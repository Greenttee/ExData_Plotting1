# R code for generating plot2.png.
# Assumes plot1.R has been run so that input data has been read, subsetted and DateTime column added...

png(filename="plot2.png")
with( PlotData,plot(PlotData$DateTime, PlotData$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab ="")
device.off()
