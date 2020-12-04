library(dplyr)
library(data.table)

##read data into dataframe
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

##set datetime variables
mydata1<-subset(mydata,mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007")
gap <-mydata1$Global_active_power
gap <- as.numeric(as.character(gap))

##Plot 2 

png("plot2.png",width=480,height=480)
datetime <- strptime(paste(mydata1$Date, mydata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()