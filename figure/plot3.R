# Getting full dataset
full_data <- read.csv("~/Downloads/household_power_consumption.txt", header=T, sep=';',
                      na.strings="?", nrows=2075259, quote='')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Subsetting the data
sub_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

# Drawing plot 3
with(sub_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex=0.7,seg.len=0.8,inset=c(-0.02,0),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()