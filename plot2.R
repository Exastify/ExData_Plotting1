#Read the raw data
rawdata <- read.csv("household_power_consumption.txt", sep=";", na="?")

#Only get Feb 1 and Feb 2 data
finaldata <- subset(rawdata, Date=="1/2/2007" | Date=="2/2/2007")

#Convert the date to proper format
#finaldata[, "Date"] <- as.Date(strptime(finaldata[, "Date"], format='%d/%m/%Y'))
dt <- strptime(paste(finaldata$Date, finaldata$Time), format="%d/%m/%Y %H:%M:%S")

#Plot data
png(filename="plot2.png")

plot(x=dt, y=finaldata[,"Global_active_power"], type="l", ylab="Global Active Power (kilowatts)", main="", xlab="")

dev.off()