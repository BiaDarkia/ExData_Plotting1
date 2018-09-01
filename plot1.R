dlMethod <- "curl"
if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
if(!file.exists("household_power_consumption.txt")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
        destfile="household_power_consumption.zip",
        method=dlMethod, # use OS-appropriate method
        mode="wb")        # "w" means "write," and is used for text files
    unzip(zipfile = "household_power_consumption.zip")
    file.remove("household_power_consumption.zip")
}

data <- read.table("./household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2881, 
    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

png("plot1.png")
hist(data$Global_active_power, breaks = 12, freq = TRUE, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()