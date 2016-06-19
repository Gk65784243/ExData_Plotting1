# GK exploratory analysis
# assignment 1 plot 4 
getwd( )
dataFile <- "./household_power_consumption.txt"

# load datafile into dataframe
data <-
read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset data is extracted only for date 1/2/2007 and 2/2/2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

str(subSetData)


datetime <- 
strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# conversion into numeric variables
globalActivePower   <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage             <- as.numeric(subSetData$Voltage)
Sub_metering_1      <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2      <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3      <- as.numeric(subSetData$Sub_metering_3)

# plot 4 pictures into one
png("plot4.png", width=480, height=480)

# devide window into 2 x 2 Matrix
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")

#plot legend submetering1/2/3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")


plot(datetime, globalReactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()