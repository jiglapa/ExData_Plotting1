#
# Name: plot3.R
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


# Plotting the graphic
Sys.setlocale("LC_TIME", "English") # To force days in  English

#Creating PNG
png("plot3.png", width = 480, height = 480)
with(data, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(data, lines(Time, Sub_metering_1))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), pt.cex=1, cex=0.7)


dev.off()