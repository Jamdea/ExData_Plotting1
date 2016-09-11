# load data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# preprocess date and time
powerData$dateCov <- as.Date(powerData$Date, "%d/%m/%Y")
pdatetime <- paste(powerData$dateCov, powerData$Time)
powerData$datetime <- strptime(pdate, "%Y-%m-%d %H:%M:%S")
subData <- powerData[powerData$dateCov >= as.Date("2007-02-01") 
                     & powerData$dateCov <= as.Date("2007-02-02"),]
# convert data into numbers
numData = sapply(subData[7:9], function(m) as.numeric(as.character(m)))

# make plot and save to png
plot(subData$datetime, numData[, 1], type = "l", xlab = "", ylab = "Energy sub merging")
lines(subData$datetime, numData[, 2], type = "l", col = "red")
lines(subData$datetime, numData[, 3], type = "l", col = "blue")
legend("topright", "(x,y)", lwd = 1,
       legend = c("Sub_metering_1       ", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), y.intersp = 1.2)
dev.copy(png, file="plot3.png")
dev.off()