# Getting full dataset
full_data <- read.csv("~/Downloads/household_power_consumption.txt", header=T, sep=';',
                      na.strings="?", nrows=2075259, quote='')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Subsetting the data
sub_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Drawing plot 1
hist(sub_data$Global_active_power, main="Global Active Power", breaks=12, xlab="Global Active Power (kilowatts)", col="Red")

# Save file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()