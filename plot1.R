#
# Name: plot1.R
#
# Script for the first part of Course project 1 in Exploratory Data Analysis
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

with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

# Creating the PNG file
dev.copy(png, file="plot1.png")
dev.off()