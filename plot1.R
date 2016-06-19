# GK exploratory analysis
# assignment 1 plot 1 

# Reading data 
# getwd( )

dataFile <- "./household_power_consumption.txt"

# load datafile into dataframe
data <- 
read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset data is extracted only for date 1/2/2007 and 2/2/2007
# using %in% operator to filter data 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Compactly display the internal structure of subSetData,
str(subSetData)


datetime <- 
strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# conversion into numeric variable for key figure Global_active_power
globalActivePower <- as.numeric(subSetData$Global_active_power)

# plot histogram 480 x 480
# call a function to open a new graphics file 
png("plot1.png", width=480, height=480)
hist(globalActivePower, col = "red" , main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
# close graphics file
dev.off()