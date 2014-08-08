household<-read.table("household.txt", sep=";", header = TRUE, na.strings=c("?"))
household$Date<-strptime(household$Date, "%d/%m/%Y")
Datetime<-as.POSIXct(paste(household$Date, household$Time), format="%Y-%m-%d %H:%M:%S")
household$Date<-NULL
household$Time<-NULL
household<-cbind(Datetime,household)
twodays<-subset(household, as.Date(Datetime) >= '2007-02-01' & as.Date(Datetime) <= '2007-02-02')

png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(twodays$Datetime,twodays$Global_active_power, type="l",xlab=" ", ylab="Global Active Power (kilowatts)", main =NULL)
dev.off()