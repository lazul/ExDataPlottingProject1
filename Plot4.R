
Plot4 <- function(){
  
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
  png(filename = "Plot4.png")
  par(mar = c(4,4,4,4), mfcol = c(2,2))
  
  with(hpcFiltered, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
  
  with(hpcFiltered, plot(DT, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
  with(hpcFiltered, lines(DT, Sub_metering_1))
  with(hpcFiltered, lines(DT, Sub_metering_2, col = "red"))
  with(hpcFiltered, lines(DT, Sub_metering_3, col = "blue"))
  legend("topright", lty = 1, col = c("black","red","blue"), bty = "n", cex = .84, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  with(hpcFiltered, plot(DT, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
  with(hpcFiltered, plot(DT, Global_reactive_power, type = "l", xlab = "datetime"))
  
  dev.off()
  
}

