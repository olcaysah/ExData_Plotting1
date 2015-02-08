

#Read data to workspace
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert date to R date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Get the subset of data which is between  2007-02-01 and 2007-02-02
data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Combine date and times and put into them in another column
data_sub$newDateTime <- as.POSIXct(as.Date(data_sub$Date), data_sub$Time)

#Plot the hostigram for Global active power 
hist(data_sub$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to file
dev.copy(png, file="GitHub/ExData_Plotting1/plots/plot1.png", height=480, width=480)
dev.off()
