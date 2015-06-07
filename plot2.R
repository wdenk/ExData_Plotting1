library(data.table)

setwd("~/Coursera/Exploratory Data analysis")

df <- fread("household_power_consumption.txt", na.strings="?")

df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))

data <- subset(df, Date >= as.Date(strptime("2007-02-01", format = "%Y-%m-%d")) & Date <= as.Date(strptime("2007-02-02", format = "%Y-%m-%d")) )

Date <- paste(data$Date, data$Time)
Date <- strptime(Date, format="%Y-%m-%d %H:%M:%S")

plot(Date, 
     data$Global_active_power, 
     type = "l", 
     ylab ="Global Active Power (kilowatts)", 
     xlab ="")

dev.copy(png, file="plot2.png")
dev.off()