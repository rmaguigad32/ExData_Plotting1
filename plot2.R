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
png(file = "plot2.png", width = 480, height = 480)

##Create line type plot comparing Global Active Power with time of day
plot(FilteredDates$Global_active_power~FilteredDates$DateTime,
     type = "l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

##Save to working directory
dev.off()