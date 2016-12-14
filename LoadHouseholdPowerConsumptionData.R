library(readr)

load_data <- function()
{
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
    sourceFile <- paste0(datasetName, ".txt")
    sourceFilePath <- paste(dataFolder, sourceFile, sep = "/")
    
    if(!file.exists(sourceFilePath)){
        unzip(zipFilePath, exdir = dataFolder)
    }
    
    #######################################################
    # Read in ONLY Data necessary for project 
    # (between dates Feb. 1, 2007 - Feb. 2, 2007)
    #######################################################
    obvsDates <- c("1/2/2007","2/2/2007")
    hpc <- read_delim_chunked(sourceFilePath, 
                              callback = DataFrameCallback$new(function(x, pos) subset(x, Date %in% obvsDates)), 
                              col_types = cols(Date = col_character(), Time = col_character()), 
                              progress = F, 
                              na = "?",
                              delim = ";",
                              chunk_size = 10000)
    
    hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
    hpc$Date <- strptime(hpc$Date, "%d/%m/%Y")
    hpc$Time <- strptime(hpc$Time, "%H:%M:%S")
    
    return(hpc)
}