# Read in the electric power consumption dataset
rawdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Keep only observations from the dates 1 Feb and 2 Feb 2007
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
powerdata <- subset(rawdata, as.Date(Date)=='2007-02-01' | as.Date(Date)=='2007-02-02')

# Convert the factor variables into numeric variables
powerdata$Global_active_power <- as.numeric(as.character(powerdata$Global_active_power))
powerdata$Sub_metering_1 <- as.numeric(as.character(powerdata$Sub_metering_1))
powerdata$Sub_metering_2 <- as.numeric(as.character(powerdata$Sub_metering_2))
powerdata$Sub_metering_3 <- as.numeric(as.character(powerdata$Sub_metering_3))

# Concatenating date and time to convert it to a time format
powerdata$concat_datetime <- paste(powerdata$Date,powerdata$Time,sep=' ') 

# to time format but date is also included. 
powerdata$datetime <- strptime(powerdata$concat_datetime,"%Y-%m-%d %H:%M:%S") 

summary(powerdata$Sub_metering_2)

#####
#Launch a png file device
png(filename = "plot3.png",
    width = 480, height = 480,
    bg = "transparent")

#Plot the chart
    # Sub_metering_1
    plot(powerdata$datetime, powerdata$Sub_metering_1,
         type = "l",
         ylab = "Energy sub metering",
         xlab = "")

    #Add the chart for Sub_metering_2
    lines(powerdata$datetime, powerdata$Sub_metering_2, col= "red")
    
    #Add the chart for Sub_metering_3
    lines(powerdata$datetime, powerdata$Sub_metering_3, col= "blue")
    
    #Add the legend
    legend("topright", lwd=1, col =c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close the png file device
dev.off()