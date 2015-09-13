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
png(filename = "plot4.png", width = 480, height = 480)

####################
# SET UP PANEL     #
# (par)            #
# PLOT             #
####################

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 2))
with(workingdata, 
     {plot(x=workingdata$Date,y=workingdata$Global_active_power,xlab="Date",type="l",ylab="Global Active Power")
     plot(x=workingdata$Date,y=workingdata$Voltage,xlab="Date",type="l",ylab="Voltage")
     plot(Date,Sub_metering_1,type="l",col="Black",ylab="Energy sub metering")
                  lines(Date,Sub_metering_2,col="Blue")
                   lines(Date,Sub_metering_3,col="Red")
     legend("topright",bty="n", lwd=1, 
            col = c("black","blue","red"), 
            legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
            pt.cex=.5,
            cex=.5)
                  
     plot(x=workingdata$Date,y=workingdata$Global_reactive_power,xlab="Date",type="l",ylab="Global Reactive Power")
     }
     )
par(mfrow = c(1,1))
####################
# TURN OFF DEVICE  #
####################
dev.off()
