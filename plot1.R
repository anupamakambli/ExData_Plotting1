getwd()                                                                        # Get working directory
setwd("C:/office/Analytics/Assignment")                                        # Set working directory to folder
install.packages("data.table")                                                 #Read zip containing single file using fread function
library(data.table)
household <- fread("household_power_consumption.txt")
names(household)                                                               # study column names of household dataset
str(household)                                                                 # check classes
head(household)                                                                # See 1st 6 data values

Date1 <- as.Date("2007-02-01")                                                 # declare two date values for subsetting the dataset                                      
Date2 <- as.Date("2007-02-02")
household$Date <- as.Date(household$Date, "%d/%m/%Y")                          # convert date to R date format
household_sub <- household[household$Date >= Date1 & household$Date <= Date2]  #subset household dataset

#plot 1 - histogram 
dev.cur()                                                                     #check current graphical screen
png("plot1.png", height=480, width=480)                                       # set graphical device
par(mfrow= c(1,1)) 
hist(as.numeric(household_sub$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",ylab= "Frequency", main="Global Active Power")
dev.off()                                                                     # change it to by default graphical device



