# GK exploratory analysis
# assignment 1 plot 3 

# Load data file 
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

# conversion into numeric variable for key figure Submetering 1/2/3
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

# plot Sub_metering_1/2/3 per date
png("plot3.png", width=480, height=480)

#The lines( ) function adds information to a graph. It can not produce a graph
# on its own. Usually it follows a plot(x, y) command that produces a graph. 
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")

#plot legend submetering1/2/3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()