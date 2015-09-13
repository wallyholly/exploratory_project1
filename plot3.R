################
# READ IN DATA #
################
household_power_consumption <- read.csv("C:/R_dat/household_power_consumption.txt", sep=";", na.strings="?")

###############
# SUBSET DATA #
###############
workingdata <- subset(household_power_consumption, household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007")

#########################
# Combine Date and Time #
# Convert to time       #
#########################
workingdata$Date<-paste(workingdata$Date, workingdata$Time)
workingdata$Date<-strptime(workingdata$Date, format="%d/%m/%Y %H:%M:%S")

#####################
# CREATE DEVICE png #
#####################
png(filename = "plot3.png", width = 480, height = 480)

####################
# PLOT             #
####################

with(workingdata, {plot(Date,Sub_metering_1,type="l",col="Black",ylab="Energy sub metering",xlab="Date")
                   lines(Date,Sub_metering_2,col="Blue")
                   lines(Date,Sub_metering_3,col="Red")
                   legend("topright",bty="n", lwd=1, 
                          col = c("black","blue","red"), 
                          legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
                          pt.cex=.8,
                          cex=.8)
                   }
     )

####################
# TURN OFF DEVICE  #
####################
dev.off()
