power_sub <- subset(power, Date %in% c("2/2/2007","1/2/2007"))
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)

#first graph
hist(power_sub$Global_active_power, col = "red")

hist(table(power_sub$Global_active_power))
#Second graph
datetime <- strptime(paste(power_sub$Date, power_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
power_sub["weekday"] <- weekdays(as.Date(power_sub$Date,'%d/%m/%y'))
power_sub$weekday <- as.factor(power_sub$weekday)
with(power_sub, plot(datetime, Global_active_power, type = "l"))

#Third graph
with(power_sub, {plot(datetime, Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = "")
     lines(datetime, Sub_metering_2, type = "l", col = "red")
     lines(datetime, Sub_metering_3, type = "l", col = "blue")
     legend("topright",col = c("black","red","blue"), lwd =1 ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))})
legend("topright",col = c("black","red","blue"), lwd =1 ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Forth Graph
par(mfrow = c(2,2))
with(power_sub, plot(datetime, Global_active_power, type = "l"))
plot(datetime, power_sub$Voltage, type = "l", ylab = "Voltage")
with(power_sub, {plot(datetime, Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = "")
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright",col = c("black","red","blue"), lwd =1 ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))})
with(power_sub,plot(datetime, Global_reactive_power, type = "l"))


