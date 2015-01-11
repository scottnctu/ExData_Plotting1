# Course: Exploratory Data Analysis
# Course Project 1
# objective: Construct the plot1.png plot

#Load data.table package
library(data.table)

# Read File with Specific Date Range
dataFile <- "household_power_consumption.txt"
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
rowsToRead <- as.numeric(dtime)
DT <- fread(dataFile, skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))
setnames(DT, colnames(fread(dataFile, nrows=0)))

#Convert the Date and Time variables to Date/Time classes to a new Column
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")

#Change the locale of R in RStudio
Sys.setlocale(category = "LC_TIME", locale = "C")

#Plot a Line Plot into a PNG file
png(filename="plot2.png")
plot(DT$DateTime,DT$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()	# Close the PNG device