getwd()                                                                        # Get working directory
setwd("C:/office/Analytics/Assignment")                                        # Set working directory to folder
install.packages("data.table")                                                 #Read zip containing single file using fread function
library(data.table)
household <- fread("household_power_consumption.txt")
names(household)                                                               # study column names of household dataset
str(household)                                                                 # check classes
head(household)  

Date1 <- as.Date("2007-02-01")                                                 # declare two date values for subsetting the dataset                                      
Date2 <- as.Date("2007-02-02")
household$Date <- as.Date(household$Date, "%d/%m/%Y")                          # convert date to R date format
household_sub <- household[household$Date >= Date1 & household$Date <= Date2]  #subset household dataset


png("plot4.png",width = 480,height=480)
par(mfcol=c(2,2),mar=c(3,4,4,1))
#1
plot(household_sub$Global_active_power, type= "l",xlab="", ylab="Global Active Power (kilowatts)",axes=F)
axis(side=1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,2,4,6),labels=c("0","2","4","6"))
box()                                                                          # to put a box frame around the graph

#2
plot(household_sub$Sub_metering_1, col="black", type="l", axes= FALSE, xlab="",ylab="Energy Sub Metering")
points(household_sub$Sub_metering_2,col="red",type="l")                        #for multiple time series on a single plot
points (household_sub$Sub_metering_3,col="blue",type="l")
axis(side=1,at=c(0,1500,2800), labels = c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0,10,20,30),labels= c("0","10","20","30"))
legend("topright",legend=c("Sub metering-1","Sub metering-2","Sub metering-3"),col=c("black","red","blue"), lwd=2, pch=c(NA,NA,NA),bty="n") #bty - is to remove box around legend
box()

#3
plot(household_sub$Voltage,col="black",type="l",axes=FALSE, xlab="Datetime",ylab="Voltage")
axis(side=1,at=c(0,1500,2800), labels = c("Thu", "Fri", "Sat"))
axis(side=2, at=c(234,238,242,246),labels= c("234","238","242","246"))
box()

#4
plot(household_sub$Global_reactive_power,col="black",type="l",axes=FALSE, xlab="Datetime",ylab="Global Reactive Power")
axis(side=1,at=c(0,1500,2800), labels = c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5),labels= c("0.0","0.1","0.2","0.3","0.4","0.5"))
box()

dev.off()