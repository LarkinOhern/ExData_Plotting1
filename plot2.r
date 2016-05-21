png(filename = "plot2.png")

par(mfrow=c(1,1))
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

plot(keydates$datetime, keydates$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")

dev.off()