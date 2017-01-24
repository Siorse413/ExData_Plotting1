## Plot4 
plot4 <- function () { 
        elpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        ## Plot2
        elpower$Global_active_power <- as.numeric(as.character(elpower$Global_active_power))
        
        elpower$Date <- as.Date(elpower$Date, "%d/%m/%Y")
        elpower$Sub_metering_1 <- as.numeric(as.character(elpower$Sub_metering_1))
        elpower$Sub_metering_2 <- as.numeric(as.character(elpower$Sub_metering_2))
        elpower$Sub_metering_3 <- as.numeric(as.character(elpower$Sub_metering_3))
        elpower$Voltage <- as.numeric(as.character(elpower$Voltage))
        elpower$Global_reactive_power <- as.numeric(as.character(elpower$Global_reactive_power))
        
        ##subset to requested time period!  
        selpower <- subset(elpower, Date <= "2007-02-02" & Date >= "2007-02-01")
        selpower <- transform(selpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
       
        par(mfrow = c(2,2))
        #Global active
        plot(selpower$timestamp, selpower$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowats)")
        #Voltage
        plot(selpower$timestamp, selpower$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        ##Plot3
        plot(selpower$timestamp, selpower$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub Metering")
        ## other lines
        lines(selpower$timestamp, selpower$Sub_metering_2, col = "red")
        lines(selpower$timestamp, selpower$Sub_metering_3, col = "blue")
        ## legend
        legend("topright", col = c("black","blue","red"), c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1), lwd = c(1,1))
        #Plot 4
        plot(selpower$timestamp, selpower$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_Reactive_Power")
        ##copy to file device
        dev.copy(png, file = "Plot4.png", width = 480, height = 480)
        dev.off()
}