library(dplyr)
library(data.table)

##read data into dataframe
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

##set datetime variables
mydata1<-subset(mydata,mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007")
gap <-mydata1$Global_active_power
gap <- as.numeric(as.character(gap))
vol<-as.numeric(as.character(mydata1$Voltage))
grp<-as.numeric(as.character(mydata1$Global_reactive_power))

##Plot 4
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1)) 
datetime <- strptime(paste(mydata1$Date, mydata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, vol, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, b$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="green",ylim=c(0,40))
par(new=TRUE)
plot(datetime, b$Sub_metering_2, type="l", xlab="", ylab="",col="red",ylim=c(0,40))
par(new=TRUE)
plot(datetime, b$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","red","blue"),cex=0.5)

plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
