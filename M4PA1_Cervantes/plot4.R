png(filename = "plot4.png",width=480,height=480)
temp <- tempfile()
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,temp)
graphdata <- read.table(unz(temp, "household_power_consumption.txt"),header=T, sep=";", na.strings="?")
unlink(temp)

graphdata <- graphdata[graphdata$Date %in% c("1/2/2007","2/2/2007"),]

datetimecol <-strptime(paste(graphdata$Date, graphdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

graphdata <- cbind(datetimecol, graphdata)

par(mfrow = c(2,2))

plot(graphdata$datetimecol, graphdata$Global_active_power, type = "l", col="black", xlab="", ylab="Global Active Power")

plot(graphdata$datetimecol, graphdata$Voltage, type = "l", col="black", xlab="datetime", ylab="Voltage")

plot(x=graphdata$datetimecol, y=graphdata$Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering")
lines(graphdata$datetimecol, graphdata$Sub_metering_2, col = "red")
lines(graphdata$datetimecol, graphdata$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty="solid")

plot(graphdata$datetimecol, graphdata$Global_reactive_power, type = "l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()

