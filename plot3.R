##**********************************************************************************
## plot3.R
## Author: T. Aristanto  1/10/2015
## The program will create a diagram from the household_power_consumption.txt data.
## Data file should be located under Data folder in the workspace 
##***********************************************************************************

## Read and Load the file
pwrcon1 <- read.table("Data/household_power_consumption.txt", sep =";", head = TRUE)

## Filter the data to between 2007-02-01 to 2007-02-02
pwrcon2 <- pwrcon1[as.Date(pwrcon1$Date,"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(pwrcon1$Date,"%d/%m/%Y") <= as.Date("2007-02-02"),]

##Combine Date and Time then add them as a new column
pwrdate <- paste(pwrcon2$Date,pwrcon2$Time)
pwrcon2$DateTime <- as.POSIXct(strptime(pwrdate,"%d/%m/%Y %H:%M:%S"))

##Create the graphic Diagram
with(pwrcon2, plot(DateTime, as.numeric(as.character(Sub_metering_1)), pch="", xlab = "", ylab ="Energy sub metering"))
with(subset(pwrcon2), lines(DateTime,as.numeric(as.character(Sub_metering_1)), col="black"))
with(subset(pwrcon2), lines(DateTime,as.numeric(as.character(Sub_metering_2)), col="red"))
with(subset(pwrcon2), lines(DateTime,as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Write the graphic Diagram to file
png(file="plot3.png")
with(pwrcon2, plot(DateTime, as.numeric(as.character(Sub_metering_1)), pch="", xlab = "", ylab ="Energy sub metering"))
with(subset(pwrcon2), lines(DateTime,as.numeric(as.character(Sub_metering_1)), col="black"))
with(subset(pwrcon2), lines(DateTime,as.numeric(as.character(Sub_metering_2)), col="red"))
with(subset(pwrcon2), lines(DateTime,as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()