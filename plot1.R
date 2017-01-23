## reads electric power consumption records
## and constructs first plot (histogram)
plot1 <- function () { 
        elpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        ## histogram
        elpower$Global_active_power <- as.numeric(as.character(elpower$Global_active_power))
        ##elpower$Global_active_power <- (elpower$Global_active_power)/1000
        elpower$Date <- as.Date(elpower$Date, "%d/%m/%Y")
        
        ##subset to requested time period!  
        selpower <- subset(elpower, Date <= "2007-02-02" & Date >= "2007-02-01")
        
        hist(selpower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowats)")
      
        ##copy to file device
        dev.copy(png, file = "Plot1.png", width = 480, height = 480)
        dev.off()
}