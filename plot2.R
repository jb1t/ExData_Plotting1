source('./LoadHouseholdPowerConsumptionData.R') #loads data into tibble variable hpc

# Open Png device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

xAxisCenterPoint <- length(hpc$Global_active_power)/2

plot(hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt="n")
axis(1, at=c(1, xAxisCenterPoint, xAxisCenterPoint*2), labels = c("Thu","Fri", "Sat"))

dev.off() # Close the Png file device