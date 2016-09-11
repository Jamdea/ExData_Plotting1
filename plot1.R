# load data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# preprocess date and time
powerData$dateCov <- as.Date(powerData$Date, "%d/%m/%Y")
pdatetime <- paste(powerData$dateCov, powerData$Time)
powerData$datetime <- strptime(pdate, "%Y-%m-%d %H:%M:%S")
subData <- powerData[powerData$dateCov >= as.Date("2007-02-01") 
                     & powerData$dateCov <= as.Date("2007-02-02"),]
# convert data into numbers
gapData <- as.numeric(as.character(subData$Global_active_power))

# make plot and save to png
hist(gapData, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()