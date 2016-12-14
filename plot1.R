#loads data into tibble variable hpc
source('./LoadHouseholdPowerConsumptionData.R')

plot1 <- function(data = NULL)
{
    if(is.null(data)) {
        data <- load_data()
    }
    
    # Open Png device
    png(filename = "plot1.png",
        width = 480, 
        height = 480, 
        units = "px")
    
    with(data, hist(Global_active_power, 
                    col = "red", 
                    main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)"))
    
    dev.off() # Close the Png file device
}
