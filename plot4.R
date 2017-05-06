# Read in data (already subsetted)
power = read.table(file="./subset_power.txt", header=TRUE, sep = ";")
power$DateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#Open output device
png(filename = "plot4.png", width=480, height=480)

#Set background color
par(bg="grey87", mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#Make plot of Global Active Power - upper left
with(power,
     plot(x = DateTime,
          y = Global_active_power,
          type="l",
          col="black",
          xlab="",
          ylab = "Global Active Power"))

#Make plot of Voltage - upper right
with(power,
     plot(x = DateTime,
          y = Voltage,
          type="l",
          col="black",
          xlab="datetime",
          ylab = "Voltage"))

# Open up plot area for Energy sub metering - lower left
with(power,
     plot(x = DateTime,
          y=Sub_metering_1,
          col="black",
          xlab="",
          ylab = "Energy sub metering",
          type="n",
     ))

# Add content for Sub_metering_1
with(power, 
     points(x = DateTime,
            y=Sub_metering_1,
            type="l",
            col="black"))

# Add content for Sub_metering_2
with(power, 
     points(x = DateTime,
            y=Sub_metering_2,
            type="l",
            col="red"))

# Add content for Sub_metering_3
with(power, 
     points(x = DateTime,
            y=Sub_metering_3,
            type="l",
            col="blue"))

legend("topright", 
       bty="n",       
       lwd = c(1, 1, 1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Make plot of Global Reactive Power - lower right
with(power,
     plot(x = DateTime,
          y = Global_reactive_power,
          type="l",
          col="black",
          xlab="datetime"))

# Close device
dev.off()