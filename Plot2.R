setwd("C:/Users/NaveenJ/datasciencecoursera/RProgramming/Data Exploration")

FileData <- read.csv("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?"
  , colClasses = c("character", "character", rep("double", 6), "numeric"))
FileData$Time <- strptime(paste(FileData$Date, FileData$Time, sep=" "), format("%d/%m/%Y %H:%M:%S"))
FileData$Date <- strptime(FileData$Date, format("%d/%m/%Y"))
FebData <- subset(FileData, FileData$Date == as.POSIXct("2007-02-01") | FileData$Date == as.POSIXct("2007-02-02"))
#Plot 2
png(filename = "Plot2.png", width = 480, height = 480, bg = "white")

plot(FebData$Time, FebData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.off()