#load onlyt the days in question 
data <- read.table("c:/temp/household_power_consumption.txt",skip = 66637, nrow = 2880, sep = ";")

#load the names of the columns
names <- readLines("c:/temp/household_power_consumption.txt",1)

#split the column names vector apart
theColumnNames <- strsplit(names, ';')[1]

#add the names to the data frame
colnames(data) <- theColumnNames[[1]]

#open the image file for writing.
png(filename = "c:/temp/plot1.png", height=480, width=480)

#generate the histagram
hist(as.numeric(data$Global_active_power), col="red", breaks=16, main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")

#close the image file
dev.off()