# Course: Exploratory Data Analysis
# Course Project 1
# objective: Construct the plot1.png plot

#Load data.table package
library(data.table)

# Read File for Specific Date Range
dataFile <- "household_power_consumption.txt"
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
rowsToRead <- as.numeric(dtime)
DT <- fread(dataFile, skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))		#use fread() to read data for specific rows
setnames(DT, colnames(fread(dataFile, nrows=0)))	#set names for each columns from original file

#Plot a Histogram into a PNG file
png(filename="plot1.png")
hist(DT$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatt)")  #Plot a Histogram in Red with Title and X Label
dev.off()	# Close the PNG device