#loads data into tibble variable hpc
source('./LoadHouseholdPowerConsumptionData.R')
source('./plot1.R')
source('./plot2.R')
source('./plot3.R')
source('./plot4.R')

data <- load_data()

plot1(data)
plot2(data)
plot3(data)
plot4(data)