## Use setwd() so that the working directory in use contains the exdata_data_household_power_consumption file
## needed to complete this assignment. This needs to be done before the code below is ran in R.
## The function library() is then used to open and use the neccessary packages needed to create the necessary graphs. 

## Reads the data as a table and saves it in the object data, and creates another column made up from the
## V1 (date) and V2 (time) columns called datetime.

data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?",
                   skip = 66637, nrows = 2879)
data$V1 <- as.Date(data$V1, format = "%d/%m/%y")
datetime <- paste(as.Date(data$V1), data$V2)
data$datetime <- as.POSIXct(datetime)


## Plots the data and saves it to a PNG file. It is also noteworthy to know that in this data V1 is date, V2 is time
## abd V3 is global active power.

png("plot.png", width = 480, height = 480)   
plot(data$datetime, data$V3, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()