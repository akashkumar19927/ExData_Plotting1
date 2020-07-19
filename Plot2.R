library(ggplot2)
library(dplyr)
library(scales)
file<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file, destfile = "consumption.zip" )
unzip("consumption.zip")
list.files() 
power_data1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")   
head(power_data1)
power_data1$Date<-as.Date(power_data1$Date, format = "%d/%m/%Y" )
power_data1<- filter( power_data1, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )
head(power_data1)
str(power_data1)
globalActivePower <- power_data1$Global_active_power
globalReactivePower <- power_data1$Global_reactive_power
voltage <-power_data1$Voltage
subMetering1 <-power_data1$Sub_metering_1
subMetering2 <-power_data1$Sub_metering_2
subMetering3 <-power_data1$Sub_metering_3
datetime1<-paste(power_data1$Date,power_data1$Time, sep=" ")
head(datetime1)
datetime2<-strptime(datetime1,format = "%Y-%m-%d%H:%M:%S") 
head(datetime2)
#labels = date_format("%A")
#head(labels)
png("plot2.png")
plot(datetime2 , globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
