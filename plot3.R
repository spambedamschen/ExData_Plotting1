library("data.table")
library("lubridate")


data<-fread("household_power_consumption.txt", skip="1/2/2007",nrows=2880)
setnames(data,c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
##data$DateTimeProper = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

with(data, plot(DateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",lty="solid", col= c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file= "plot3.png",width = 480, height = 480)
dev.off()