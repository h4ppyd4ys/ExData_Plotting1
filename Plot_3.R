library(dplyr)
library(data.table)

##read data into dataframe
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

##set datetime variables
mydata1<-subset(mydata,mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007")


##Plot 3 

png("plot3.png",width=480,height=480)
datetime <- strptime(paste(mydata1$Date, mydata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, b$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black",ylim=c(0,40))
par(new=TRUE)
plot(datetime, b$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering",col="red",ylim=c(0,40))
par(new=TRUE)
plot(datetime, b$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering",col="blue",ylim=c(0,40))
par(new=TRUE)
legend("topright", col= c("black","red","blue"), lty=1, legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_1"))
dev.off()