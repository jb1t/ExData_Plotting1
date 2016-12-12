source('./LoadHouseholdPowerConsumptionData.R') #loads data into tibble variable hpc

# Open Png device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

#plot - top left
xAxisCenterPoint <- length(hpc$Global_active_power)/2
plot(hpc$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt="n")
axis(1, at=c(1, xAxisCenterPoint, xAxisCenterPoint*2), labels = c("Thu","Fri", "Sat"))

#plot - bottom left
xAxisCenterPoint <- length(hpc$Sub_metering_1)/2
legendLabels <- names(hpc)[(length(hpc)-2):length(hpc)]

plot(hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt="n")
lines(hpc$Sub_metering_2, type = "l", col = "red", xlab = "", xaxt="n")
lines(hpc$Sub_metering_3, type = "l", col = "blue", xlab = "", xaxt="n")
axis(1, at=c(1, xAxisCenterPoint, xAxisCenterPoint*2), labels = c("Thu","Fri", "Sat"))
legend("topright", legend = legendLabels, col = c("black", "red", "blue"), lwd =1)

#plot - top right
xAxisCenterPoint <- length(hpc$Voltage)/2
plot(hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt="n")
axis(1, at=c(1, xAxisCenterPoint, xAxisCenterPoint*2), labels = c("Thu","Fri", "Sat"))

#plot - bottom right
xAxisCenterPoint <- length(hpc$Global_reactive_power)/2
plot(hpc$Global_reactive_power, type = "l", ylab = "Global reactive power", xlab = "datetime", xaxt="n")
axis(1, at=c(1, xAxisCenterPoint, xAxisCenterPoint*2), labels = c("Thu","Fri", "Sat"))

dev.off() # Close the Png file device