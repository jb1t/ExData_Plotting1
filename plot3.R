source('./LoadHouseholdPowerConsumptionData.R') #loads data into tibble variable hpc

# Open Png device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

xAxisCenterPoint <- length(hpc$Sub_metering_1)/2
legendLabels <- names(hpc)[(length(hpc)-2):length(hpc)]

plot(hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt="n")
lines(hpc$Sub_metering_2, type = "l", col = "red", xlab = "", xaxt="n")
lines(hpc$Sub_metering_3, type = "l", col = "blue", xlab = "", xaxt="n")
axis(1, at=c(1, xAxisCenterPoint, xAxisCenterPoint*2), labels = c("Thu","Fri", "Sat"))
legend("topright", legend = legendLabels, col = c("black", "red", "blue"), lwd =1)

dev.off() # Close the Png file device