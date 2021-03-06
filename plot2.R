setwd("G:/DataScience/4-Exploratory/Assigment1");

#library(data.table)
DT <- fread("household_power_consumption.txt", na.strings="?")

# Filter relevant rows
mDT <-  DT[DT$Date %in% c("1/2/2007", "2/2/2007")]
DT <- mDT

# Cleanup data
DT$timestamp <- as.POSIXct(x=paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")
DT$Global_active_power = sapply(DT$Global_active_power, as.double)


# PLOT

png(filename="plot2.png",width=480,height=480)

plot(x=DT$timestamp, y=DT$Global_active_power, type="l"
, ylab="Global Active Power (kilowatts)"
, xlab=""    
)
dev.off()