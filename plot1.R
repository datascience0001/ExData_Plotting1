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

# Create Device
png("plot1.png", height = 480, width = 480)

# Create Histogram
hist(	hpc$Global_active_power, 
		col = "red", 
		main = "Global Active Power", 
		xlab = "Global Active Power (kilowatts)",
		ylab = "Frequency")

# Close Device
dev.off()					