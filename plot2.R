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
png(filename = "c:/temp/plot2.png", height=480, width=480)

#generate the histagram
plot(type="l", sub=NULL, as.numeric(data$Global_active_power), xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1440, 2880), labels=c("Thu", "Fri", "Sat"))   

#close the image file
dev.off()