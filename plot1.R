#loading data from local file. NA character = ? and separator = ;
df <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#filtering only the two dates used for plotting
subSet <- df[df$Date %in% c("1/2/2007","2/2/2007") , ]

#converting column Date to datetime type
subSet$dateTime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#setting locale to English so Date legends match the plots on the assignment
Sys.setlocale("LC_ALL","English")

png("plot1.png", width = 480, height = 480)
hist(asubSet$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power"
)
dev.off()
