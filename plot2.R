#
# Name: plot2.R
#
# Script for the second part of Course project 1 in Exploratory Data Analysis
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
#Creating PNG
png("plot2.png", width = 480, height = 480)

# Plotting the graphic
Sys.setlocale("LC_TIME", "English") # To print days in English
with(data, plot(Time, Global_active_power, type="l", ylab="Global Activer Power (kilowatts)"))


dev.off()