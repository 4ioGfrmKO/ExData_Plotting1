setwd("G:/DataScience/4-Exploratory/Assigment1");

library(data.table)
DT <- fread("household_power_consumption.txt", na.strings="?")

mDT <-  DT[DT$Date %in% c("1/2/2007", "2/2/2007")]
DT <- mDT
Date <- sapply(mDT$Date, strptime, format = "%d/%m/%Y")
DT$Global_active_power = sapply(DT$Global_active_power, as.double)

png(filename="plot1.png",width=480,height=480)
hist(DT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
