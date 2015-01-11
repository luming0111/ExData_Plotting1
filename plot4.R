zipfile = "exdatadatahousehold_power_consumption.zip"

# if the file is downloaded and zipfile is exist in workspace. the download file could be comment for speeding up.
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile)
#unzip(zipfile)

#original_column <- read.table(file = "household_power_consumption.txt", nrow = 1, header = TRUE, sep =";")
#original_power <- read.table(file = "household_power_consumption.txt", sep = ";",col.names = colnames(original_column),na.strings = "?")

# The original power is a cache data. If the temp power is mistake in debug, it could recovery here.
#tmp_power <- original_power

#tmp_power$Date <- as.Date(tmp_power$Date, format = "%d/%m/%Y")
#datarange_power <- subset(tmp_power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#datarange_power$Global_active_power <- as.numeric(datarange_power$Global_active_power)

#datarange_power$Time <- strptime(paste(datarange_power$Date, datarange_power$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
with(datarange_power, {
  # Plot 1
  plot(x=datarange_power$Time, y=as.numeric(datarange_power$Global_active_power), type='l', 
       xlab='', ylab='Global Active Power')
  
  # Plot 2
  plot(x=datarange_power$Time, y=as.numeric(datarange_power$Voltage), type='l', xlab='datetime', ylab='Voltage')
  
  # Plot 3
  plot(x=datarange_power$Time, y=as.numeric(datarange_power$Sub_metering_1), type="l", xlab=" ", ylab="Energy sub metering")
  lines(x=datarange_power$Time, y=as.numeric(datarange_power$Sub_metering_2), type='l', col='red')
  lines(x=datarange_power$Time, y=as.numeric(datarange_power$Sub_metering_3), type='l', col='blue')
  legend(x='topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1))
  
  # Plot 4
  plot(x=datarange_power$Time, y=as.numeric(datarange_power$Global_reactive_power), type='l', 
       xlab='datetime', ylab='Global_reactive_power')
})

dev.copy(png, file="plot4.png")
dev.off()