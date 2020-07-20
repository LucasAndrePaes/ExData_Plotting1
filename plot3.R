tab3 <- read.table("household_power_consumption.txt", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), header=TRUE, sep=";", na.strings = "?")
tab3$Date <- as.Date(tab3$Date,"%d/%m/%Y")
tab3 <- subset(tab3,Date <= as.Date("2007/2/2") & Date >= as.Date("2007/2/1"))
tab3 <- tab3[complete.cases(tab3),]
dateTime <- setNames(paste(tab3$Date, tab3$Time),"DateTime")
tab3 <- cbind(dateTime, tab3[,!(names(tab3) %in% c("Date","Time"))])
tab3$dateTime <- as.POSIXct(dateTime)
with(tab3,
{
  plot(Sub_metering_1~dateTime, type="l", xlab="", ylab="Global Active Power (kW)")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()