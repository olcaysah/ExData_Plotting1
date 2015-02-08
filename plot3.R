

#Read data to workspace
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Convert date to R date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Get the subset of data which is between  2007-02-01 and 2007-02-02
data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Combine date and times and put into them in another column
newDateTime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$newDateTime <- as.POSIXct(newDateTime)

# Plot 3
with(data_sub, {
  plot(Sub_metering_1~newDateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~newDateTime,col='Red')
  lines(Sub_metering_3~newDateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to file
dev.copy(png, file="GitHub/ExData_Plotting1/plots/plot3.png", height=480, width=480)
dev.off()
