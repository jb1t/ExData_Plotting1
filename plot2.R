source('./LoadHouseholdPowerConsumptionData.R') #loads data into tibble variable hpc

plot2 <- function(data = NULL)
{
    if(is.null(data)) {
        data <- load_data()
    }
    
    # Open Png device
    png(filename = "plot2.png",
        width = 480, 
        height = 480)
    
    plot(data$DateTime, 
         data$Global_active_power, 
         type = "l", 
         ylab = "Global Active Power (kilowatts)", 
         xlab = "")
    
    dev.off() # Close the Png file device
}