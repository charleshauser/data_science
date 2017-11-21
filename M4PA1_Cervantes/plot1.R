png(filename = "plot1.png",width=480,height=480)
temp <- tempfile()
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,temp)
graphdata <- read.table(unz(temp, "household_power_consumption.txt"),header=T, sep=";", na.strings="?")
unlink(temp)

graphdata <- graphdata[graphdata$Date %in% c("1/2/2007","2/2/2007"),]

hist(graphdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()