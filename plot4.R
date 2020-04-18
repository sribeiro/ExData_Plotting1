#loading data from local file. NA character = ? and separator = ;
df <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#filtering only the two dates used for plotting
subSet <- df[df$Date %in% c("1/2/2007","2/2/2007") , ]

#converting column Date to datetime type
subSet$dateTime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#setting locale to English so Date legends match the plots on the assignment
Sys.setlocale("LC_ALL","English")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(subSet$dateTime, subSet$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(subSet$dateTime, subSet$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(subSet$dateTime, subSet$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(subSet$dateTime, subSet$Sub_metering_2, type = "l", col = "red")
lines(subSet$dateTime, subSet$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(subSet$dateTime, subSet$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
