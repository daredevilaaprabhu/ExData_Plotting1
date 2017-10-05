data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?", skip = 66636, nrows = 2880)
headerVal <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?",nrows = 1)
names(data) <- names(headerVal)
data$combineDate <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2));
plot(data$combineDate, data$Global_active_power, type = "l", 
     xlab = "",ylab='Global Active Power', col = "black")
plot(data$combineDate, data$Voltage, type = "l", 
     xlab = "datetime",ylab='Voltage', col = "black")

plot(data$combineDate, data$Sub_metering_1, type = "l", 
     xlab = "",ylab='Energy sub metering', col = "black")
lines(data$combineDate, data$Sub_metering_2, col = "red")
lines(data$combineDate, data$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.5,y.intersp = 0.3,bty = "n", col = c("black", "red", "blue"), lty = 1)
plot(data$combineDate, data$Global_reactive_power, type = "l", 
     xlab = "datetime",ylab='Global_reactive_power', col = "black")
#axis.POSIXct(1, data$combineDate, format="%a")
dev.copy(png,"plot4.png", width = 480, height = 480)
dev.off()