
household<-read.table("household.txt", sep=";", header = TRUE, na.strings=c("?"))
household$Date<-strptime(household$Date, "%d/%m/%Y")
Datetime<-as.POSIXct(paste(household$Date, household$Time), format="%Y-%m-%d %H:%M:%S")
household$Date<-NULL
household$Time<-NULL
household<-cbind(Datetime,household)
twodays<-subset(household, as.Date(Datetime) >= '2007-02-01' & as.Date(Datetime) <= '2007-02-02')

png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(twodays$Global_active_power, col="red", xlim=c(0,6), ylim=c(0,1300),xlab="Global Active Power (kilowatts)", ylab="Frequency", main ="Global Active Power")
ticks=c(0,200,400,600,800,1000,1200)
axis(side = 2, at = ticks)
axis(side = 1)
dev.off()
