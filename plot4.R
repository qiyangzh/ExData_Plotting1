setwd("~/Desktop/学习/Coursera")
install.packages("graphics")
library(graphics)

my_data <- read.delim("household_power_consumption.txt", sep=';')
data <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#instruct r to make 2*2 array, mar is margin size, 
par(mfrow=c(2,2), mar=c(2,2,2,2), oma=c(0,0,2,0))

#use with to plot graphs from data
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
