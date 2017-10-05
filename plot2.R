data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?", skip = 66636, nrows = 2880)
headerVal <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?",nrows = 1)
names(data) <- names(headerVal)
data$combineDate <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(data$combineDate, data$Global_active_power, xaxt='n', type = "l", 
      xlab = "" ,ylab='Global Active Power (kilowatts)')
axis.POSIXct(1, data$combineDate, format="%a")
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()