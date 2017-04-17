source("load_power_data.R")
feb <- load_power_data()
png(filename="plot4.png")

par(mfrow=c(2,2), mar=c(4,4,2,1))
## Global Active Power, top left
with(feb, plot(x=DateTime,y=Global_active_power, type="l", ylab="Global Active Power", xlab="",col="black"))

## Voltage, top right
with(feb, plot(x=DateTime,y=Voltage, type="l", ylab="Voltage", xlab="datetime", col="black"))

## Enerty Sub Metering, bottom left
with(feb, plot(x=DateTime,y=Sub_metering_1, type="l", ylab="Energy sub metering", xlab="",col="black"))
with(feb, lines(x=DateTime,y=Sub_metering_2, col="red"))
with(feb, lines(x=DateTime,y=Sub_metering_3, col="blue"))
legend(x="topright", y=NULL, col=c("black", "red", "blue"), lty=c(1,1,1), c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))

## Global reactive power, bottom right
with(feb, plot(x=DateTime, y=Global_reactive_power, type="l", xlab="datetime"))

dev.off()
