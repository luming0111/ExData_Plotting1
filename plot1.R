zipfile = "exdatadatahousehold_power_consumption.zip"

# if the file is downloaded and zipfile is exist in workspace. the download file could be comment for speeding up.
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile)
unzip(zipfile)

original_column <- read.table(file = "household_power_consumption.txt", nrow = 1, header = TRUE, sep =";")
original_power <- read.table(file = "household_power_consumption.txt", sep = ";",col.names = colnames(original_column),na.strings = "?")

# The original power is a cache data. If the temp power is mistake in debug, it could recovery here.
tmp_power <- original_power
tmp_power$Date <- as.Date(tmp_power$Date, format = "%d/%m/%Y")
datarange_power <- subset(tmp_power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
datarange_power$Time <- strptime(datarange_power$Time, "%H:%M:%S")
datarange_power$Global_active_power <- as.numeric(datarange_power$Global_active_power)

hist(datarange_power$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(KW)", col="red")
dev.copy(png, file="plot1.png")
dev.off()