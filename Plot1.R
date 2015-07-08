setwd("C:/Users/NaveenJ/datasciencecoursera/RProgramming/Data Exploration")

FileData <- read.csv("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?"
  , colClasses = c("character", "character", rep("double", 6), "numeric"))
FileData$Time <- strptime(paste(FileData$Date, FileData$Time, sep=" "), format("%d/%m/%Y %H:%M:%S"))
FileData$Date <- strptime(FileData$Date, format("%d/%m/%Y"))
FebData <- subset(FileData, FileData$Date == as.POSIXct("2007-02-01") | FileData$Date == as.POSIXct("2007-02-02"))
#Plot 1
png(filename = "plot1.png", width = 480, height = 480, bg = "white")
hist(FebData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()
