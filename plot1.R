###slect the png device to save file
png(filename = "plot1.png")


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

###produce the histogram
hist(keydates$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red",ylim = c(0,1200))

##turn of the graphics device 
dev.off()