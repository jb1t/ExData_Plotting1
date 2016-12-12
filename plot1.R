source('./LoadHouseholdPowerConsumptionData.R') #loads data into tibble variable hpc

# Open Png device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off() # Close the Png file device