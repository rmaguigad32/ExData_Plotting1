##Load in data from working directory
household_power_consumption <- read.csv("~/Desktop/ExData_Plotting1/household_power_consumption.txt", sep=";")

##Create new data set filtering only dates 2/1/2007 and 2/2/2007
##Be careful of date format
FilteredDates <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007" )

##Create new column in data set that combines date and time
FilteredDates$Date <- as.Date(FilteredDates$Date, format = "%d/%m/%Y")
dateTime <- paste(FilteredDates$Date, FilteredDates$Time)
FilteredDates$DateTime <- as.POSIXct(dateTime)

##Create png file
png(file = "plot4.png", width = 480, height = 480)

##Format 4 plots to be include in one screen (2x2))
par(mfrow=c(2,2))

##Upper left plot ~ comparing Global Active Power with time of day
plot(FilteredDates$Global_active_power~FilteredDates$DateTime, 
     type = "l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

##Upper right plot ~ comparing voltage by time of day
plot(FilteredDates$Voltage~FilteredDates$DateTime, 
     type = "l",
     ylab="Voltage", 
     xlab="datetime")

##Lower left plot ~ comparing all 3 sub metering with time of day
plot(FilteredDates$Sub_metering_1~FilteredDates$DateTime, type = "l", col = "Black", ylab ="Energy sub metering", xlab = "")
lines(FilteredDates$Sub_metering_2~FilteredDates$DateTime,col="red")
lines(FilteredDates$Sub_metering_3~FilteredDates$DateTime,col="blue")
    ##Create legend of all three Sub metering types and their respective colors
    legend("topright", col = c("black", "red", "blue"), lty=1,lwd=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = .8)

##Lowe right plot ~ comparing reactive power and time of day
plot(FilteredDates$Global_reactive_power~FilteredDates$DateTime, 
     type = "l",
     ylab="Global_reactive_power", 
     xlab="datetime")

##Save to working directory
dev.off()