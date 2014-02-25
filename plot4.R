library("data.table")
library("lubridate")


data<-fread("household_power_consumption.txt", skip="1/2/2007",nrows=2880)
setnames(data,c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data$DateTime <- dmy_hms(paste(data$Date, data$Time))

par(mfcol=c(2,2))
with(data, plot(DateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))

with(data, {
  plot(DateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright",lty="solid", bty="n", cex=1, col= c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

})

##with(data, plot(DateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))
##with(data, lines(DateTime, Sub_metering_2, col="red"))
##with(data, lines(DateTime, Sub_metering_3, col="blue"))
##legend("topright",lty="solid", col= c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Voltage"))

dev.copy(png, file= "plot4.png",width = 480, height = 480)
dev.off()