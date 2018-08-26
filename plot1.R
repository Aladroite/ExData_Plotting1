##read data file
eldata<- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
na.strings="?")

##subset to 2 days
Febdata<- subset(eldata, Date=="1/2/2007" | Date=="2/2/2007") 

##create plot 1: histogram of global active power
png(filename="plot1.png", width=480, height=480)
hist(Febdata[[3]], col="red", main="Global Active Power", 
xlab="Global Active Power (kilowatts)")
dev.off()