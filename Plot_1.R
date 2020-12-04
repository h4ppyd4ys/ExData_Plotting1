library(dplyr)
library(data.table)

##read data into dataframe
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

##subset for required dates
mydata1<-subset(mydata,mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007")
mydata1$Date <- as.Date(mydata1$Date, format="%d/%m/%Y")

##Plot 1 - Histogram of global active power to png file

png("plot1.png",width=480,height=480)
hist(mydata1$Global_active_power, xlab="Global Active Power (kilowatts)", 
     col="red", main="Global Active Power")
dev.off()





