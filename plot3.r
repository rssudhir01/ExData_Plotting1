#Setting the data tytpe
colclass = c("character", "character", rep("numeric", 7))
colclass

#Loading the data
mydata = read.table('household_power_consumption.txt', header = TRUE, sep = ";", colClasses = colclass, na.strings="?")
str(mydata)

#Joining the date and time in the format of "Day/Month/Year" "Hour/Minutes/Seconds"
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), 
                            "%d/%m/%Y %H:%M:%S")

#Selecting the required date
mydata = subset(mydata, 
                as.Date(DateTime) >= as.Date("2007-02-01") & 
                    as.Date(DateTime) <= as.Date("2007-02-02"))

#Plotting the data and saving it on png file
png(filename = "plot3.png", height = 480, width = 480)
plot(mydata$DateTime, mydata$Sub_metering_1, pch = NA, ylab = "Energy Sub Metering")
lines(mydata$DateTime, mydata$Sub_metering_1, col = "black")
lines(mydata$DateTime, mydata$Sub_metering_2, col = 'red')
lines(mydata$DateTime, mydata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', "red", "blue"), lty = c(1,1,1))
dev.off()
