# Getting full dataset
full_data <- read.csv("~/Downloads/household_power_consumption.txt", header=T, sep=';',
                      na.strings="?", nrows=2075259, quote='')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Subsetting the data
sub_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

# Drawing plot 2
plot(sub_data$Datetime, sub_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()