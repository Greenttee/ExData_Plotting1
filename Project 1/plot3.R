# R code for generating plot3.png file.
# Assumes plot1.R has been run so that input file is read and cleaned.



png(filename="plot3.png")
with(PlotData,plot(PlotData$DateTime, PlotData$Sub_metering_1, type = "l",ylab="Energy sub metering",xlab=""))
lines(PlotData$DateTime, PlotData$Sub_metering_2, type = "l", col="red")
lines(PlotData$DateTime, PlotData$Sub_metering_3, type = "l", col="blue")
legend("topright",lty= 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
