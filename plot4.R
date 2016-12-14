source('./LoadHouseholdPowerConsumptionData.R') #loads data into tibble variable hpc

plot4 <- function(data = NULL)
{
  if(is.null(data)) {
    data <- load_data()
  }
  
  # Open Png device
  png(filename = "plot4.png",
      width = 480, 
      height = 480, 
      units = "px")
  
  par(mfcol = c(2,2))
  
  #plot - top left
  with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
  
  #plot - bottom left
  with(data, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
  with(data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
  with(data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
  legendLabels <- names(data)[(length(data)-3):(length(data)-1)]
  legend("topright", legend=legendLabels, col=c("black", "red", "blue"), lwd=1)
  
  #plot - top right
  with(data, plot(DateTime, Voltage, type = "l", ylab = "Voltage"))
  
  #plot - bottom right
  with(data, plot(DateTime, Global_reactive_power, type = "l", ylab = "Global reactive power"))
  
  dev.off() # Close the Png file device
}