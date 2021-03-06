data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?", skip = 66636, nrows = 2880)
headerVal <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character", na.strings = "?",nrows = 1)
names(data) <- names(headerVal)
hist(as.double(data$Global_active_power), col ="red", main = "Global Active Power", xlab = " Global Active Power(kilowatts)")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()