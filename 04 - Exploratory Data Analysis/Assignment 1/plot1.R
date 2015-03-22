# Read in the electric power consumption dataset
rawdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Keep only observations from the dates 1 Feb and 2 Feb 2007
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
powerdata <- subset(rawdata, as.Date(Date)=='2007-02-01' | as.Date(Date)=='2007-02-02')

# Convert the factor variable Global_active_power into a numeric variable
powerdata$Global_active_power <- as.numeric(as.character(powerdata$Global_active_power))

#Launch a png file device
png(filename = "plot1.png",
    width = 480, height = 480,
    bg = "transparent")

#Plot the histogram
hist(powerdata$Global_active_power, 
     col= "red", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

# Close the png file device
dev.off()
