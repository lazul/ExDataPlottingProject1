
Plot1 <- function(){
  
	## Load dplyr for filtering function
	library(dplyr)
	
  ## Load project data (as long as its in "Working Directory")
	hpc <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
  
  ## Change Date column to a 'Date' Class-type
	hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  
  ## Filter relevant columns for assignment Feb. 1 & 2, 2007 and create a new data Table with result
	hpcFiltered <- filter(hpc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
  
	## use Date Column from filtered Data Table to graph Histogram
  png(filename = "Plot1.png")
	par(cex = .7)
	hist(hpcFiltered$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
  dev.off()
}
