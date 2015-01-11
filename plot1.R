##**********************************************************************************
## plot1.R
## Author: T. Aristanto  1/10/2015
## The program will create a histogram from the household_power_consumption.txt data.
## Data file should be located under Data folder in the workspace 
##***********************************************************************************

## Read and Load the file
pwrcon1 <- read.table("Data/household_power_consumption.txt", sep =";", head = TRUE)

## Filter the data to between 2007-02-01 to 2007-02-02
pwrcon2 <- pwrcon1[as.Date(pwrcon1$Date,"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(pwrcon1$Date,"%d/%m/%Y") <= as.Date("2007-02-02"),]

## Create the graphic diagram
hist(as.numeric(as.character(pwrcon2$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Write the graphic diagram to a file
png(file="plot1.png")
hist(as.numeric(as.character(pwrcon2$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
