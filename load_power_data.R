load_power_data <- function() {
                                        # Dataset URL
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                                        # Name of zipfile
    zipfile <- "hpc.zip"
                                        # Name of the raw datafile
    raw_datafile <- "household_power_consumption.txt"
                                        # Name of the processed raw_datafile
    datafile <- "feb_date.csv"

                                        # Prepare the datafiles, doing as little work as possible
    if (!file.exists(datafile)) {
        if (!file.exists(raw_datafile)) {
            if (!file.exists(zipfile)) {
                ## zip file must be downloaded
                download.file(url, destfile=zipfile)
            }
            ## zip file exists, process it
            unzip(zipfile=zipfile) 
        }
        ## raw file exists - process it
        raw_data <- read.table(file = raw_datafile, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",6)), na.strings="?")
        raw_data$DateTime <- as.POSIXct(strptime(paste(raw_data$Date, raw_data$Time), format="%d/%m/%Y %H:%M:%S"))
        feb <- raw_data[year(raw_data$DateTime) == 2007 & month(raw_data$DateTime) == 2 & mday(raw_data$DateTime) %in% c(1,2),]
        write.csv(feb,datafile, row.names=FALSE)
    }
    ## processed file exists, read it and return it
    feb <- read.csv(datafile,stringsAsFactors=FALSE, header=TRUE)
    feb$DateTime <- as.POSIXct(strptime(feb$DateTime, format="%Y-%m-%d %H:%M:%S"))
    feb

}
