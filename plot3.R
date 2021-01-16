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
png(file = "plot3.png", width = 480, height = 480)

##Create line type plot comparing all Sub metering types in one graph by time of day
plot(FilteredDates$Sub_metering_1~FilteredDates$DateTime, 
     type = "l", 
     col = "Black", 
     ylab ="Energy sub metering", 
     xlab = "")
lines(FilteredDates$Sub_metering_2~FilteredDates$DateTime,
      col="red")
lines(FilteredDates$Sub_metering_3~FilteredDates$DateTime,
      col="blue")

##Create legend of all three Sub metering types and their respective colors
legend("topright", col = c("black", "red", "blue"), lty=1,lwd=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Save to working directory
dev.off()