#Read the raw data
rawdata <- read.csv("household_power_consumption.txt", sep=";", na="?")

#Only get Feb 1 and Feb 2 data
finaldata <- subset(rawdata, Date=="1/2/2007" | Date=="2/2/2007")

#Convert the date to proper format
#finaldata[, "Date"] <- as.Date(strptime(finaldata[, "Date"], format='%d/%m/%Y'))
dt <- strptime(paste(finaldata$Date, finaldata$Time), format="%d/%m/%Y %H:%M:%S")

#Plot data
png(filename="plot3.png")

plot(x=dt, y=finaldata[,"Sub_metering_1"], type="l", ylab="Energy sub metering", main="", xlab="")
lines(x=dt, y=finaldata[, "Sub_metering_2"], col="red")
lines(x=dt, y=finaldata[, "Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()