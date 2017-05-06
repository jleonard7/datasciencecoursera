# Read in data (already subsetted)
power = read.table(file="./subset_power.txt", header=TRUE, sep = ";")
power$DateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#Open output device
png(filename = "plot2.png", width=480, height=480)

#Set backgound color

#Makes plot
par(bg="grey87")
with(power,
     plot(x = DateTime,
          y=Global_active_power,
          type="l",
          col="black",
          xlab="",
          ylab = "Global Active Power (kilowatts)"))

# Close device
dev.off()