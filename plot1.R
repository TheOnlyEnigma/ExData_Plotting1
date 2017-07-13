## Use setwd() so that the working directory in use contains the exdata_data_household_power_consumption file
## needed to complete this assignment. This needs to be done before the code below is ran in R.
## The function library() is then used to open and use the neccessary packages needed to create a histogram. 

## Reads the data as a table and saves it in the object data.

data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?",
                              skip = 66637, nrows = 2879)

## Sets up a PNG file with a width of 480 pixels and a height of 480 pixels, and creates a histrogram to be 
## saved into this file. 

globalActiveData <- as.numeric(data$V3)
png("plot.png", width = 480, height = 480)   
hist(globalActiveData, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)",
                  ylab = "Frequency", col = "red")
dev.off()