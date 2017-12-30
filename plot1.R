##  First plot
# load data
mydata <- read.table("household_power_consumption.txt", header=T, sep=";") 
newdate <- as.Date(mydata$Date, format = "%d/%m/%Y")
# make subset of desired data
datasubset <- subset(mydata, newdate >="2007-02-01 00:00" & newdate <= "2007-02-02 23:59")
# histogram
hist(as.numeric(as.character(datasubset$Global_active_power), 
     na.rm=TRUE)/1000, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", xaxt="n")
axis(side=1, at=c(0,0.002,0.004,0.006), labels=c(0,2,4,6))
# save png
dev.copy(png,'plot1.png',width = 480, height = 480, units = "px")
dev.off()
