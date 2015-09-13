################
# READ IN DATA #
################
household_power_consumption <- read.csv("C:/R_dat/household_power_consumption.txt", sep=";", na.strings="?")

###############
# SUBSET DATA #
###############
workingdata <- subset(household_power_consumption, household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007")

#####################
# CREATE DEVICE png #
#####################
png(filename = "plot1.png", width = 480, height = 480)

####################
# HISTOGRAM        #
####################
hist(workingdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

####################
# TURN OFF DEVICE  #
####################
dev.off()
