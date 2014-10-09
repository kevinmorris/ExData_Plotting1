temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip", temp)
d <- read.csv(unzip(temp), sep=";")
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
d <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]

d$DateTime <- as.POSIXct(strptime(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S"))
d$Date <- NULL
d$Time <- NULL

d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
d$Voltage <- as.numeric(as.character(d$Voltage))
d$Global_intensity <- as.numeric(as.character(d$Global_intensity))
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))

png(filename="plot2.png")
plot(d$Global_active_power ~ d$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()