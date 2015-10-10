#########################################
## Exploratory Data Analysis ############
## Project 1 ############################
## Plot 3 ###############################
#########################################

setwd("C:\\Users\\wvantrump\\Box Sync\\My Documents\\HR_Stuff\\Data_Sci_Cert\\Explore_data\\Proj_1")
#Download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip")

#Load Data
proj_data = read.delim2(file = ".\\exdata-data-household_power_consumption\\household_power_consumption.txt",sep = ";",stringsAsFactors=F)
proj_data$datetime = as.POSIXlt(paste(proj_data$Date,proj_data$Time),format = "%d/%m/%Y %H:%M:%S")
proj_data$Date = as.Date(proj_data$Date,format = "%d/%m/%Y")
head(proj_data)

sub_data = proj_data[proj_data$Date >= as.Date("2007-02-01",format = "%Y-%m-%d") & proj_data$Date <= as.Date("2007-02-02",format = "%Y-%m-%d"),]

#Make plots

#Plot 3
png(filename = "plot3.png",width = 480,height = 480)
plot(sub_data$datetime,as.numeric(sub_data$Sub_metering_1),type="l",ylab = "Energy sub metering",xlab="",col="black")
lines(sub_data$datetime,as.numeric(as.character(sub_data$Sub_metering_2)),ylab = "",xlab="",col="red")
lines(sub_data$datetime,as.numeric(sub_data$Sub_metering_3),ylab = "",xlab="",col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()
