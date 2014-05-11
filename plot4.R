# Load interested data (Date : 1/2/2007 ~ 2/2/2007)
hpc <- read.table(  "household_power_consumption.txt",
					colClasses = c(rep("character",2), rep("numeric",7)),
					col.names = c(	"Date", 
									"Time", 
									"Global_active_power", 
									"Global_reactive_power",
									"Voltage",
									"Global_intensity",
									"Sub_metering_1",
									"Sub_metering_2",
									"Sub_metering_3"),				
					sep=";",
					header = F,
					skip=66637, 
					nrows=2880)

hpc$Date <- as.Date(hpc$Date,format='%d/%m/%Y')
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time))

# For display English Weekday
Sys.setlocale(category = "LC_TIME", locale = "C")

# Create Device
png("plot4.png", height = 480, width = 480)

# Plot
par(mfrow = c(2, 2))

# Plot 1
plot(	hpc$DateTime,
		hpc$Global_active_power,
		type = "l", 
		xlab = "", 
		ylab = "Global Active Power")

# Plot 2
plot(	hpc$DateTime,
		hpc$Voltage,
		type = "l", 
		xlab = "datetime", 
		ylab = "Voltage")

# Plot 3
plot(	hpc$DateTime, 
		hpc$Sub_metering_1, 
		type="l",
		xlab="",
		ylab="Energy sub metering")
lines(	hpc$DateTime, hpc$Sub_metering_1, col="black")
lines(	hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(	hpc$DateTime, hpc$Sub_metering_3, col="blue")
legend(	"topright",
		lty=c(1,1,1),
		col=c("black","red", "blue"),
		legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
plot(	hpc$DateTime,
		hpc$Global_reactive_power,
		type = "l", 
		xlab = "datetime", 
		ylab = "Global_reactive_power")
	
# Close Device
dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")
