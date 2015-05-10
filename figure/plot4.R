# Getting full dataset
full_data <- read.csv("~/Downloads/household_power_consumption.txt", header=T, sep=';',
                      na.strings="?", nrows=2075259, quote='')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Subsetting the data
sub_data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)


# Drawing plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))
with(sub_data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",cex=0.7,seg.len=0.8,inset=c(-0.2,0),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_rective_power",xlab="datetime")
})

# Save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()