# Read in the electric power consumption dataset
rawdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Keep only observations from the dates 1 Feb and 2 Feb 2007
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
powerdata <- subset(rawdata, as.Date(Date)=='2007-02-01' | as.Date(Date)=='2007-02-02')

# Convert the factor variable Global_active_power into a numeric variable
powerdata$Global_active_power <- as.numeric(as.character(powerdata$Global_active_power))

# Concatenating date and time to convert it to a time format
powerdata$concat_datetime <- paste(powerdata$Date,powerdata$Time,sep=' ') 

# to time format but date is also included. 
powerdata$datetime <- strptime(powerdata$concat_datetime,"%Y-%m-%d %H:%M:%S") 

#Launch a png file device
png(filename = "plot2.png",
    width = 480, height = 480,
    bg = "transparent")

#Plot the chart
plot(powerdata$datetime, powerdata$Global_active_power,
     type = "l",
     ylab = "Global Active Power(kilowatts)",
     xlab = "")

# Close the png file device
dev.off()