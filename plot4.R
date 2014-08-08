household<-read.table("household.txt", sep=";", header = TRUE, na.strings=c("?"))
household$Date<-strptime(household$Date, "%d/%m/%Y")
Datetime<-as.POSIXct(paste(household$Date, household$Time), format="%Y-%m-%d %H:%M:%S")
household$Date<-NULL
household$Time<-NULL
household<-cbind(Datetime,household)
twodays<-subset(household, as.Date(Datetime) >= '2007-02-01' & as.Date(Datetime) <= '2007-02-02')

png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

plot(twodays$Datetime,twodays$Global_active_power, type="l",xlab=" ", ylab="Global Active Power (kilowatts)", main =NULL)

plot(twodays$Datetime,twodays$Voltage, type="l",xlab="datetime", ylab="Voltage", main =NULL)

plot(twodays$Datetime,twodays$Sub_metering_1, type="l", col="black",xlab=" ",ylab="Energy sub metering")
lines(twodays$Datetime,twodays$Sub_metering_2, type="l", col="red")
lines(twodays$Datetime,twodays$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red","blue"),lty=c(1,1,1),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(twodays$Datetime,twodays$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power", main =NULL)

dev.off()

