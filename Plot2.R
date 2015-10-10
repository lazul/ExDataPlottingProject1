
Plot2 <- function(){
  
  ## Load dplyr for filtering function
  library(dplyr)
  
  ## Load project data (as long as its in "Working Directory")
  hpc <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
  
  ## Merge Date field with Time field
  hpc$DT <- paste(hpc$Date, hpc$Time)
  
  ## Change Date column to a 'Date' Class-type
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  
  ## Filter relevant columns for assignment Feb. 1 & 2, 2007 and create a new data Table with result
  hpcFiltered <- filter(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
  
  ## Convert DT (Date/Time) Column to Type class(Date)
  hpcFiltered$DT <- strptime(hpcFiltered$DT, "%d/%m/%Y %H:%M:%S")
  
  ## Plot Graph
  par(cex = .7)
  with(hpcFiltered, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
  
}