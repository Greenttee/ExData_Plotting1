# R code for generating plot4.png file
# Assumes plot1.R has been run so that data file has been read and cleaned.

png(filename="plot4.png")

par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0,0,0,0))
plot(PlotData$DateTime, PlotData$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab ="")
plot(PlotData$DateTime, PlotData$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(PlotData$DateTime, PlotData$Sub_metering_1, type = "l",ylab="Energy sub metering",xlab="")
lines(PlotData$DateTime, PlotData$Sub_metering_2, type = "l", col="red")
lines(PlotData$DateTime, PlotData$Sub_metering_3, type = "l", col="blue")
legend("topright",lty= 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(PlotData$DateTime, PlotData$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
