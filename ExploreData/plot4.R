# load data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# preprocess date and time
powerData$dateCov <- as.Date(powerData$Date, "%d/%m/%Y")
pdatetime <- paste(powerData$dateCov, powerData$Time)
powerData$datetime <- strptime(pdate, "%Y-%m-%d %H:%M:%S")
subData <- powerData[powerData$dateCov >= as.Date("2007-02-01") 
                     & powerData$dateCov <= as.Date("2007-02-02"),]

# convert data into numbers
numData = sapply(subData[3:9], function(m) as.numeric(as.character(m)))

# make plot and save to png
par(mfrow = c(2, 2), cex = 0.8)
plot(subData$datetime, numData[, 1], type = "l", xlab = "", ylab = "Global Active Power")
plot(subData$datetime, numData[, 3], type = "l", xlab = "datetime", ylab = "Voltage")
plot(subData$datetime, numData[, 5], type = "l", xlab = "", ylab = "Energy sub merging")
lines(subData$datetime, numData[, 6], type = "l", col = "red")
lines(subData$datetime, numData[, 7], type = "l", col = "blue")
legend("topright", "(x,y)", lwd = 1,
       legend = c("Sub_metering_1               ", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), y.intersp = 1.2, cex = 0.8, bty = "n")
plot(subData$datetime, numData[, 2], type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png")
dev.off()
