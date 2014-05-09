#load onlyt the days in question 
data <- read.table("c:/temp/household_power_consumption.txt",skip = 66637, nrow = 2880, sep = ";")

#load the names of the columns
names <- readLines("c:/temp/household_power_consumption.txt",1)

#split the column names vector apart
theColumnNames <- strsplit(names, ';')[1]

#add the names to the data frame
colnames(data) <- theColumnNames[[1]]

#change the dates to days of the week
#data$Date <- weekdays(strptime(data$Date, "%d/%m/%Y"))


#open the image file for writing.
png(filename = "c:/temp/plot4.png", height=480, width=480)

#make the page able to take 4 plots
par(mfrow=c(2,2))


########First Plot###########################

plot(type="l", sub=NULL, as.numeric(data$Global_active_power), xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1,1440, 2880), labels=c("Thu", "Fri", "Sat"))   


########Second Plot##########################

plot(type="l", sub="datetime", as.numeric(data$Voltage), xaxt="n",xlab="", ylab="Voltage")
axis(1, at=c(1,1440, 2880), labels=c("Thu", "Fri", "Sat"))   


########Third Plot###########################
#generate the plot
plot(type="l", sub=NULL, as.numeric(data$Sub_metering_1), xaxt="n",xlab="", ylab="Enegry sub metering")


lines(type="l", as.numeric(data$Sub_metering_2), col="red")
lines(type="l", as.numeric(data$Sub_metering_3), col="blue")

#create the plot's legend
legend("topright", c("Sub_meterting_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"),lty=1, bty="n")
#add the axis
axis(1, at=c(1,1440, 2880), labels=c("Thu", "Fri", "Sat"))   



#########Fourth Plot##############################
plot(type="l", sub="datetime",  as.numeric(data$Global_reactive_power), xaxt="n",xlab="", ylab="Global_reactive_power")
axis(1, at=c(1,1440, 2880), labels=c("Thu", "Fri", "Sat"))   



#close the image file
dev.off()