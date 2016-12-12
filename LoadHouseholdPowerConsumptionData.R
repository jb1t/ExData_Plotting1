library(readr)

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataFolder <- "./data"
datasetName <- "household_power_consumption"
zipFile <- paste0(datasetName, ".zip")
zipFilePath <- paste(dataFolder, zipFile, sep = "/")

#######################################################
# Create data folder if one does not exist
#######################################################
if(!file.exists(dataFolder)){
    dir.create(dataFolder)
}

#######################################################
# Download Data file if one does not already exist
#######################################################
if(!file.exists(zipFilePath))
{
    download.file(fileUrl, destfile = zipFilePath, method = "curl")
}

#######################################################
# Unzip the data file
#######################################################
unzip(zipFilePath, exdir = dataFolder)

sourceFile <- paste0(datasetName, ".txt")
sourceFilePath <- paste(dataFolder, sourceFile, sep = "/")

#######################################################
# Read in ONLY Data necessary for project 
# (between dates Feb. 1, 2007 - Feb. 2, 2007)
#######################################################
startDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y")
hpc <- read_delim_chunked(sourceFilePath, 
                          callback = DataFrameCallback$new(function(x, pos) subset(x, Date >= startDate & Date <= endDate)), 
                          col_types = cols(Date = col_date("%d/%m/%Y"), Time = col_time("%H:%M:%S")), 
                          progress = F, 
                          na = "?",
                          delim = ";",
                          chunk_size = 10000)