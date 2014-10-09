d <- read.csv("household_power_consumption.txt", sep=";")
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
d <- d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"),]

d$DateTime <- strptime(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S")
d$Date <- NULL
d$Time <- NULL

d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
d$Voltage <- as.numeric(as.character(d$Voltage))
d$Global_intensity <- as.numeric(as.character(d$Global_intensity))
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))

png(filename="plot1.png")
hist(d$Global_active_power, col="red", ylim=c(0, 1200), main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()