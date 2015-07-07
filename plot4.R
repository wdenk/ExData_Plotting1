library(data.table)

setwd("~/Coursera/Exploratory Data analysis")

# read data
df <- fread("household_power_consumption.txt", na.strings="?")

# transform dates
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))
data <- subset(df, Date >= as.Date(strptime("2007-02-01", format = "%Y-%m-%d")) & Date <= as.Date(strptime("2007-02-02", format = "%Y-%m-%d")) )
Date <- paste(data$Date, data$Time)
Date <- strptime(Date, format="%Y-%m-%d %H:%M:%S")
l <- list(data, Date)

# transform data typs
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

# open png device
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# plot1
plot(Date, 
     data$Global_active_power, 
     type = "l", 
     ylab ="Global Active Power", 
     xlab ="")

# plot2
plot(Date, 
     data$Voltage, 
     type = "l", 
     ylab ="Voltage", 
     xlab ="datetime")

# plot3
with(l, plot(Date, 
             data$Sub_metering_1,
             type="l",
             ylab = "Energy sub metering",
             xlab = ""))
lines(Date, data$Sub_metering_2, col ="red")
lines(Date, data$Sub_metering_3, col = "blue")
legend("topright", lty=1 ,col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot4
plot(Date, 
     data$Global_reactive_power, 
     type = "l", 
     xlab ="datetime")

# close device and write file
dev.off()

