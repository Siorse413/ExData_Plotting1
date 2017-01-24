## Plot2 Global Active Power to Days of the Week
plot2 <- function () { 
        elpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        ## Plot2
        elpower$Global_active_power <- as.numeric(as.character(elpower$Global_active_power))
        ##elpower$Global_active_power <- (elpower$Global_active_power)/1000
        elpower$Date <- as.Date(elpower$Date, "%d/%m/%Y")
        
        ##subset to requested time period!  
        selpower <- subset(elpower, Date <= "2007-02-02" & Date >= "2007-02-01")
        selpower <- transform(selpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        head(selpower)
        plot(selpower$timestamp, selpower$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowats)")
        
        ##copy to file device
        dev.copy(png, file = "Plot2.png", width = 480, height = 480)
        dev.off()
}