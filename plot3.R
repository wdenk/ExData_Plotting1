library(data.table)

setwd("~/Coursera/Exploratory Data analysis")

df <- fread("household_power_consumption.txt", na.strings="?")

df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))

data <- subset(df, Date >= as.Date(strptime("2007-02-01", format = "%Y-%m-%d")) & Date <= as.Date(strptime("2007-02-02", format = "%Y-%m-%d")) )

Date <- paste(data$Date, data$Time)
Date <- strptime(Date, format="%Y-%m-%d %H:%M:%S")

l <- list(data, Date)

with(l, plot(Date, 
               data$Sub_metering_1,
               type="l",
               ylab = "Energy sub metering",
               xlab = ""
               ))
lines(Date, data$Sub_metering_2, col ="red")
lines(Date, data$Sub_metering_3, col = "blue")
legend("topright", pch="----", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
