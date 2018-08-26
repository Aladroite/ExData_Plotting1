##read data file
eldata<- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
na.strings="?")

##subset to 2 days
Febdata<- subset(eldata, Date=="1/2/2007" | Date=="2/2/2007") 

##combine date and time, create vector of length 2880
 datetime<- paste(Febdata$Date, Febdata$Time, sep=" ")

## use strptime to force POSIXlt date time format
datetimestrp<- strptime(datetime, "%d/%m/%Y %H:%M:%S")

##create plot2: line graph of global active power over days (variable: datetimestrp)
png(filename="plot2.png", width=480, height=480)
plot(datetimestrp, Febdata$Global_active_power, type="l", xlab="", 
ylab="Global Active Power (kilowatts)")
dev.off()