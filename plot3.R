## Plot2 Global Active Power to Days of the Week
plot3 <- function () { 
        elpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        ## Plot2
        elpower$Global_active_power <- as.numeric(as.character(elpower$Global_active_power))
        ##elpower$Global_active_power <- (elpower$Global_active_power)/1000
        elpower$Date <- as.Date(elpower$Date, "%d/%m/%Y")
        elpower$Sub_metering_1 <- as.numeric(as.character(elpower$Sub_metering_1))
        elpower$Sub_metering_2 <- as.numeric(as.character(elpower$Sub_metering_2))
        elpower$Sub_metering_3 <- as.numeric(as.character(elpower$Sub_metering_3))
        
        ##subset to requested time period!  
        selpower <- subset(elpower, Date <= "2007-02-02" & Date >= "2007-02-01")
        selpower <- transform(selpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        head(selpower)
        plot(selpower$timestamp, selpower$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub Metering")
        ## other lines
        lines(selpower$timestamp, selpower$Sub_metering_2, col = "red")
        lines(selpower$timestamp, selpower$Sub_metering_3, col = "blue")
        ## legend
        legend("topright", col = c("black","blue","red"), c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1), lwd = c(1,1))
        ##copy to file device
        dev.copy(png, file = "Plot3.png", width = 480, height = 480)
        dev.off()
}