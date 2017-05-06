# Read in data (already subsetted)
power = read.table(file="./subset_power.txt", header=TRUE, sep = ";")
power$DateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#Open output device
png(filename = "plot3.png", width=480, height=480)

# Set background color
par(bg="grey87")

# Open up plot area
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
       lwd = c(1, 1, 1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close device
dev.off()