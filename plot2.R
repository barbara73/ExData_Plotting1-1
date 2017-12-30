##  Second plot2
# load data
mydata <- read.table("household_power_consumption.txt", header=T, sep=";") 
newdate <- as.Date(mydata$Date, format = "%d/%m/%Y")
datasubset <- subset(mydata, newdate >="2007-02-01 00:00" & newdate <= "2007-02-02 23:59")
# concatenate Date and Time
newTime <- strptime(paste(datasubset$Date, datasubset$Time), format = "%d/%m/%Y %X")
# plot
plot(as.numeric(newTime), as.numeric(as.character(datasubset$Global_active_power)), "l",
     ylab="Global Active Power (kilowatts)",  xaxt="n", xlab="")
#a <- weekdays(newTime) -> weekdays in german, that's why I rename them
axis(side = 1, at  = c(as.numeric(newTime[1]), 
                       as.numeric(newTime[1441]),
                       as.numeric(newTime[2880])), 
     labels = c("Thu","Fri","Sat"))
# save png
dev.copy(png,'plot2.png')
dev.off()
