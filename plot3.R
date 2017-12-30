##  Third plot3
# load data
mydata <- read.table("household_power_consumption.txt", header=T, sep=";") 
newdate <- as.Date(mydata$Date, format = "%d/%m/%Y")
datasubset <- subset(mydata, newdate >="2007-02-01 00:00" & newdate <= "2007-02-02 23:59")
# convert time and date and concatenate
newTime <- strptime(paste(datasubset$Date, datasubset$Time), format = "%d/%m/%Y %X")
# plot
plot(as.numeric(newTime), as.numeric(as.character(datasubset$Sub_metering_1)), "l",
     ylab="Energy sub metering",  xaxt="n", xlab="")
lines(as.numeric(newTime), as.numeric(as.character(datasubset$Sub_metering_2)), col="red")
lines(as.numeric(newTime), as.numeric(as.character(datasubset$Sub_metering_3)), col="blue")
legend("topright", legend = names(datasubset[7:9]), col=c(1:2,4), lty=1) 
# name xlabel
axis(side = 1, at  = c(as.numeric(newTime[1]), 
                       as.numeric(newTime[1440]),
                       as.numeric(newTime[2880])), 
     labels = c("Thu","Fri","Sat"))

# save png
dev.copy(png,'plot3.png')
dev.off()
