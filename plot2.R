# GK exploratory analysis
# assignment 1 plot 2 
getwd( )
dataFile <- "./household_power_consumption.txt"

# load datafile into dataframe
data <- 
read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset data is extracted only for date 1/2/2007 and 2/2/2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

str(subSetData)

# convert the data and Time variables to Date/Time classes
#Functions to convert between character representations and objects of classes 
#"POSIXlt" and "POSIXct"  representing calendar dates and times.
datetime <- 
strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime

# conversion into numeric varaible for key figure Global_active_power
globalActivePower <- as.numeric(subSetData$Global_active_power)

# plot Global_active_power per date
png("plot2.png", width=480, height=480)

# labeling x axis with datetime variables
plot(datetime, globalActivePower, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()