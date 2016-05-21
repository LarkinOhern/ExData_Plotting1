png(filename = "plot4.png")

par(mfrow=c(2,2))

###read in the complete data 
pdata1<-read.table("C:/Users/Larkin/Documents/Coursera Work/Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?",stringsAsFactors = FALSE )

### conert to Date
pdata1$Date<-as.Date(pdata1$Date, format = "%d/%m/%Y")

###subset the key dates
keydate1<-subset(pdata1, pdata1$Date=="2007-02-01")
keydate2<-subset(pdata1, pdata1$Date=="2007-02-02")

###combine the subsets
keydates<-rbind(keydate1,keydate2)
keydates$datetime<-paste(keydates$Date,keydates$Time)
keydates$datetime<-as.POSIXct(strptime(keydates$datetime, format = "%Y-%m-%d %H:%M:%S"))


###active power plot 
plot(keydates$datetime, keydates$Global_active_power, type = "l", xlab="", ylab="Global ctive Power")

###voltage plot 
plot(keydates$datetime, keydates$Voltage, type="l", xlab ="datetime", ylab = "Voltage")

#plot sub meters 
plot(keydates$datetime, keydates$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(keydates$datetime,keydates$Sub_metering_2, type="l", col="red")
lines(keydates$datetime, keydates$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = .75, lty=1,  col=c("black", "red", "blue"))

###reactive power plot
plot(keydates$datetime, keydates$Global_reactive_power,type="l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()