#
# Script for the third part of Course project 1 in Exploratory Data Analysis
#

# Open the Electric power consumption zip file and read it
file<-unzip("household_power_consumption.zip")
data<-read.table(file, header=TRUE, sep=";", na.strings="?")
# Preparing data
# Converting Date to a Date objetc
data$Date<-as.Date(data$Date,"%d/%m/%Y")

# Subset only two days
data<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")

#Convert time to a Time object
data$Time<-strptime(paste(as.character(data$Date), data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

#Plotting the histogram
dev.off() # To assure default par settings

# Plotting the graphic
Sys.setlocale("LC_TIME", "English") # To force days in English
# Setting 2 rows an 2 columns canvas
par(mfrow=c(2,2))
with(data, {
  plot(Time, Global_active_power, type="l", xlab="", ylab="Global Activer Power (kilowatts)")
  
  plot(Time, Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(Time, Sub_metering_1)
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
  legend("topright", pch=95, col = c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Time, Global_reactive_power, type="l", xlab="datetime")
})

# Creating the PNG file
dev.copy(png, file="plot4.png")
dev.off()