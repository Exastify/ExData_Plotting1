#Read the raw data
rawdata <- read.csv("household_power_consumption.txt", sep=";", na="?")

#Only get Feb 1 and Feb 2 data
finaldata <- subset(rawdata, Date=="1/2/2007" | Date=="2/2/2007")

#Convert the date to proper format
finaldata[, "Date"] <- as.Date(strptime(finaldata[, "Date"], format='%d/%m/%Y'))

#Plot data
png(filename="plot1.png")
hist(finaldata[,"Global_active_power"], col="red", main="Global Active power",xlab="Global Active power (kilowatts)" )
dev.off()