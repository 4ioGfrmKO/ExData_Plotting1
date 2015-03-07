setwd("G:/DataScience/4-Exploratory/Assigment1");

#library(data.table)
DT <- fread("household_power_consumption.txt", na.strings="?")

# Filter relevant rows
mDT <-  DT[DT$Date %in% c("1/2/2007", "2/2/2007")]
DT <- mDT

# Cleanup data
DT$timestamp <- as.POSIXct(x=paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")
DT$Global_active_power = sapply(DT$Global_active_power, as.double)
DT$Sub_metering_1 = sapply(DT$Sub_metering_1, as.double)
DT$Sub_metering_2 = sapply(DT$Sub_metering_2, as.double)
DT$Sub_metering_3 = sapply(DT$Sub_metering_3, as.double)

# PLOT

png(filename="plot3.png",width=480,height=480)

plot(x=DT$timestamp, y=DT$Sub_metering_1, type="l"
, ylab="Energy sub metering"
, xlab=""    
)

lines(x=DT$timestamp,y=DT$Sub_metering_2,col="red")
lines(x=DT$timestamp,y=DT$Sub_metering_3,col="blue")

legend("topright", 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"),  
        lty=1)
dev.off()