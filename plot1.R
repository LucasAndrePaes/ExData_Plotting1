tab1 <- read.table("household_power_consumption.txt", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), header=TRUE, sep=";", na.strings = "?")
tab1$Date <- as.Date(tab1$Date,"%d/%m/%Y")
tab1 <- subset(tab1, Date <= as.Date("2007/2/2") & Date >= as.Date("2007/2/1"))
tab1 <- tab1[complete.cases(tab1),]
dateTime <- setNames(paste(tab1$Date, tab1$Time),"DateTime")
tab1 <- cbind(dateTime, tab1[,!(names(tab1) %in% c("Date","Time"))])
hist(tab1$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kW)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()