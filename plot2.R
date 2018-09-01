data <- read.table("./household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2881, 
    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()