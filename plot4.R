##read data file
eldata<- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
na.strings="?")

##subset to 2 days
Febdata<- subset(eldata, Date=="1/2/2007" | Date=="2/2/2007") 

##combine date and time, create vector of length 2880
 datetime<- paste(Febdata$Date, Febdata$Time, sep=" ")

## use strptime to force POSIXlt date time format
datetimestrp<- strptime(datetime, "%d/%m/%Y %H:%M:%S")

##create plot 4: 4 plots on 1 page
png(filename="plot4.png", width=480, height=480)

##setup plot page
par(mfcol=c(2,2))
##create plot 4.1 - line graph of global active power over 2 days
plot(datetimestrp, Febdata$Global_active_power, type="l", xlab="", 
ylab="Global Active Power")

##create plot 4.2 - overlay of Submetering 1, 2, 3, over 2 days
plot(datetimestrp, Febdata$Sub_metering_1, col="black", type="l", 
xlab="", ylab="Energy sub metering" )
lines(datetimestrp, Febdata$Sub_metering_2, col="red", type="l")
lines(datetimestrp, Febdata$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##create plot 4.3 - voltage ~ datetime
plot(datetimestrp, Febdata$Voltage, type="l", ylab="Voltage", xlab="datetime")

##create plot 4.4 - Global reactive Power ~ datetime
plot(datetimestrp, Febdata$Global_reactive_power, type="l", xlab="datetime",
ylab="Global Reactive Power")

dev.off()