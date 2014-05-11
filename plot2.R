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

# Create Device
png("plot2.png", height = 480, width = 480)

# Plot
Sys.setlocale(category = "LC_TIME", locale = "C")
plot(	hpc$DateTime,
		hpc$Global_active_power,
		type = "l", 
		xlab = "", 
		ylab = "Global Active Power (kilowatts)")
Sys.setlocale(category = "LC_ALL", locale = "")

# Close Device
dev.off()
