
library(data.table)

setwd("~/Coursera/Exploratory Data analysis")

df <- fread("household_power_consumption.txt", na.strings="?")

df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))

data <- subset(df, Date >= as.Date(strptime("2007-02-01", format = "%Y-%m-%d")) & Date <= as.Date(strptime("2007-02-02", format = "%Y-%m-%d")) )

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Globadata$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

hist(data$Global_active_power, 
     breaks=16, 
     main="Global Active Power", 
     col="red", 
     ylim=c(0, 1200),
     xlab ="Global Active Power (kilowatts)")
