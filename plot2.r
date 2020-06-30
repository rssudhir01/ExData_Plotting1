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


png(filename = 'plot2.png', height = 480, width = 480)
plot(mydata$DateTime, mydata$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power (kilowatts)")
lines(mydata$DateTime, mydata$Global_active_power)
dev.off()


