library("data.table")
library("lubridate")


data<-fread("household_power_consumption.txt", skip="1/2/2007",nrows=2880,colClass="character")
setnames(data,c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data$DateTime <- dmy_hms(paste(data$Date, data$Time))

with(data, plot(DateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file= "plot2.png",width = 480, height = 480)
dev.off()