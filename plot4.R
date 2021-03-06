hpc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)
hpc2 <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))
x <- paste(as.Date(hpc2$Date,"%d/%m/%Y"), hpc2$Time)
hpc2$DtTm <- strptime(x, "%Y-%m-%d %H:%M:%S")
hpc3 <- hpc2
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2, 2))
plot(hpc3$DtTm, hpc3$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(hpc3$DtTm, hpc3$Global_active_power)

plot(hpc3$DtTm, hpc3$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(hpc3$DtTm, hpc3$Sub_metering_1, col="black")
lines(hpc3$DtTm, hpc3$Sub_metering_2, col="red")
lines(hpc3$DtTm, hpc3$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

plot(hpc3$DtTm, hpc3$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(hpc3$DtTm, hpc3$Voltage)

plot(hpc3$DtTm, hpc3$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(hpc3$DtTm, hpc3$Global_reactive_power)
dev.off()
