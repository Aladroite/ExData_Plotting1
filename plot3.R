##read data file
eldata<- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
na.strings="?")

##subset to 2 days
Febdata<- subset(eldata, Date=="1/2/2007" | Date=="2/2/2007") 

##combine date and time, create vector of length 2880
 datetime<- paste(Febdata$Date, Febdata$Time, sep=" ")

## use strptime to force POSIXlt date time format
datetimestrp<- strptime(datetime, "%d/%m/%Y %H:%M:%S")

##create plot 3: overlay of line graphs of submetering 1, 2, 3, over 2 days
png(filename="plot3.png", width=480, height=480)
plot(datetimestrp, Febdata$Sub_metering_1, col="black", type="l", 
xlab="", ylab="Energy sub metering" )
lines(datetimestrp, Febdata$Sub_metering_2, col="red", type="l")
lines(datetimestrp, Febdata$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()