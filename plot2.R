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
png(filename = "plot2.png", width = 480, height = 480)

####################
# PLOT             #
####################
plot(x=workingdata$Date,y=workingdata$Global_active_power,xlab="",type="l",ylab="Global Active Power")

####################
# TURN OFF DEVICE  #
####################
dev.off()
