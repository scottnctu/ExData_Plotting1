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

#Convert the Date and Time variables to Date/Time classes to a new Column
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")

#Change the locale of R in RStudio
Sys.setlocale(category = "LC_TIME", locale = "C")

# === Create 4-in-1 Plots into a PNG file ===
png(filename="plot4.png")
par(mfrow=c(2,2))

#Plot Panel 1
plot(DT$DateTime,DT$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#Plot Panel 2
plot(DT$DateTime,DT$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Plot Panel 3
plot(DT$DateTime,DT$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(DT$DateTime,DT$Sub_metering_2,type="l",col="red")		#use lines() to add another variable into the plot
lines(DT$DateTime,DT$Sub_metering_3,type="l",col="blue")	#use lines() to add another variable into the plot
legend("topright", pch = "",lwd = 2, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))	#add legend to the plot

#Plot Panel 4
plot(DT$DateTime,DT$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()	# Close the PNG device