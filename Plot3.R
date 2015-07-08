setwd("C:/Users/NaveenJ/datasciencecoursera/RProgramming/Data Exploration")

FileData <- read.csv("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?"
  , colClasses = c("character", "character", rep("double", 6), "numeric"))
FileData$Time <- strptime(paste(FileData$Date, FileData$Time, sep=" "), format("%d/%m/%Y %H:%M:%S"))
FileData$Date <- strptime(FileData$Date, format("%d/%m/%Y"))
FebData <- subset(FileData, FileData$Date == as.POSIXct("2007-02-01") | FileData$Date == as.POSIXct("2007-02-02"))
#Plot 3
png(filename = "Plot3.png", width = 480, height = 480, bg = "white")

plot(FebData$Time, FebData$Sub_metering_1, type="l", col="black", ylab="Energy Sub Metering")
lines(FebData$Time, FebData$Sub_metering_2, col="red")
lines(FebData$Time, FebData$Sub_metering_3, col="blue")
legend("topright",9.5, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"))

dev.off()