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

png("plot3.png", width = 480,height=480)
plot(household_sub$Sub_metering_1, col="black", type="l", axes= FALSE, xlab="",ylab="Energy Sub Metering")
points(household_sub$Sub_metering_2,col="red",type="l")                        #for multiple time series on a single plot
points (household_sub$Sub_metering_3,col="blue",type="l")
axis(side=1,at=c(0,1500,2800), labels = c("Thu", "Fri", "Sat"))
axis(side=2, at=c(0,10,20,30),labels= c("0","10","20","30"))
legend("topright",legend=c("Sub metering-1","Sub metering-2","Sub metering-3"),col=c("black","red","blue"),lty=1, lwd=2, pch=c(NA,NA,NA))
box()
dev.off()

