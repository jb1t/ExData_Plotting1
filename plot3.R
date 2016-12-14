#loads data into tibble variable hpc
source('./LoadHouseholdPowerConsumptionData.R')

plot3 <- function(data = NULL)
{
  if(is.null(data)) {
    data <- load_data()
  }
  
  # Open Png device
  png(filename = "plot3.png",
      width = 480,
      height = 480, 
      units = "px")
  
  with(data, plot(DateTime, 
                  Sub_metering_1, 
                  type = "l", 
                  ylab = "Energy sub metering"))
  
  with(data, lines(DateTime, 
                   Sub_metering_2, 
                   type = "l", 
                   col = "red"))
  
  with(data, lines(DateTime, 
                   Sub_metering_3, 
                   type = "l", 
                   col = "blue"))
  
  legendLabels <- names(data)[(length(data)-3):(length(data)-1)]
  legend("topright", legend=legendLabels, col=c("black", "red", "blue"), lwd=1)
  
  dev.off() # Close the Png file device
}