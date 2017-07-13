## Use setwd() so that the working directory in use contains the exdata_data_household_power_consumption file
## needed to complete this assignment. This needs to be done before the code below is ran in R.
## The function library() is then used to open and use the neccessary packages needed to create a histogram. 

## Reads the data as a table and saves it in the object data, and creates another column made up from the
## V1 (date) and V2 (time) columns called datetime. It also converts columsn V3, V7, V8, V9 into numeric values.

data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?",
                   skip = 66637, nrows = 2879)
data$V1 <- as.Date(data$V1, format = "%d/%m/%y")
datetime <- paste(as.Date(data$V1), data$V2)
data$datetime <- as.POSIXct(datetime)

gap <- as.numeric(data$V3)
grp <- as.numeric(data$V4)
voltage <- as.numeric(data$V5)
sub1 <- as.numeric(data$V7)
sub2 <- as.numeric(data$V8)
sub3 <- as.numeric(data$V9)

## Set plot parameters using par()

png("plot.png", width = 480, height = 480) 
par(mfrow = c(2,2))

## Graph one

with(data, plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power"))

## Graph two

with(data, plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## Graph three

with(data, 
     plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, 
     lines(datetime, sub1, type = "l", col = "black"))
with(data, 
     lines(datetime, sub2, type = "l", col = "red"))
with(data, 
     lines(datetime, sub3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"))

## Graph four

with(data, plot(datetime, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


dev.off()