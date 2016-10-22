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

png("plot2.png", width = 480,height=480)
plot(household_sub$Global_active_power, type= "l",xlab="Day", ylab="Global Active Power (kilowatts)",axes=F)
axis(side=1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,2,4,6),labels=c("0","2","4","6"))
box()                                                                          # to put a box frame around the graph
dev.off()
