# Read in data (already subsetted)
power = read.table(file="./subset_power.txt", header=TRUE, sep = ";")

#Open output device
png(filename = "plot1.png", width=480, height=480)

# Set background color
par(bg="grey87")

#Make histogram plot
hist(power$Global_active_power, 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     main="Global Active Power")

# Close device
dev.off()