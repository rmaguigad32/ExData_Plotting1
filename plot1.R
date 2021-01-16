##Load in data from working directory
household_power_consumption <- read.csv("~/Desktop/ExData_Plotting1/household_power_consumption.txt", sep=";")

##Create new data set filtering only dates 2/1/2007 and 2/2/2007
##Be careful of date format
FilteredDates <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007" )

##Create png file
png(file = "plot1.png", width = 480, height = 480)

##Create histogram visualizing frequency of Global Active Power
hist(as.numeric(FilteredDates$Global_active_power), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0,6),
     ylim = c(0,1200), 
     main = "Global Active Power")

##Save to working directory
dev.off()