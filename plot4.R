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
DT$Voltage = as.double(DT$Voltage)
DT$Global_reactive_power = as.double(DT$Global_reactive_power)
# PLOT

png(filename="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

# upper left
plot(x=DT$timestamp, y=DT$Global_active_power, type="l"
, ylab="Global Active Power"
, xlab=""    
)

# upper right
plot(x=DT$timestamp, y=DT$Voltage, type="l"
, ylab="Voltage"
, xlab="datetime"    
)


# lower left  
plot(x=DT$timestamp, y=DT$Sub_metering_1, type="l"
, ylab="Energy sub metering"
, xlab=""    
)

lines(x=DT$timestamp,y=DT$Sub_metering_2,col="red")
lines(x=DT$timestamp,y=DT$Sub_metering_3,col="blue")

legend("topright", 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"),  
        bty = "n",
        lty=1)
      
# lower right
plot(x=DT$timestamp, y=DT$Global_reactive_power, type="l"
, ylab="Global_reactive_power"
, xlab="datetime"    
)
     
dev.off()