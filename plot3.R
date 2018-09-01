data <- read.table("./household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2881, 
    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", 
    ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    lty = 1:1, col=c("black","red", "blue"))

dev.off()