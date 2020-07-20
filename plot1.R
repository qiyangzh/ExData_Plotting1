setwd("~/Desktop/学习/Coursera")
my_data <- read.delim("household_power_consumption.txt", sep=';')
data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=800, height=600)
dev.off()
