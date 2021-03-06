# Assignment: Exploratory Data Analysis_Course Project_1
# author: Taehee Jeong
# date: 05/20/2016
# Individual household electric power consumption Data Set

## Load data (big size)
#bigfile.sample <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";",header=T, nrows=10)

bigfile.raw <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";",header=T,  nrows=2075259)

# Convert Date variable as Date format  
bigfile.raw$datetime<-strptime(paste(bigfile.raw$Date, bigfile.raw$Time),"%d/%m/%Y %H:%M:%S")
bigfile.raw$Date<-as.Date(strptime(bigfile.raw$Date,"%d/%m/%Y"))

#subset dataset
smalldata<-subset(bigfile.raw,Date=="2007-02-01")
smalldata2<-subset(bigfile.raw,Date=="2007-02-02")
newdata<-rbind(smalldata,smalldata2)

## Making Plots
par(las=1)
plot(newdata$datetime,newdata$Global_active_power,lty=1, lwd=1, type="l",xlab="",ylab="Global Active Power(kilowatts)")
# save plot as png file
dev.copy(png,file="plot2.png")
dev.off()
