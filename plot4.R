library(lubridate)

#
# read data
data <- read.table("household_power_consumption.txt",  na.strings="?",
                   stringsAsFactors = FALSE,sep=";",header =TRUE)
data2 <- data
data2[,1] <- as.Date(data2[,1],"%d/%m/%Y")
data2 <- data2[data2$Date >= "2007-02-01" & data2$Date <= "2007-02-02" ,]
data2[,2] <- parse_date_time(paste(data2[,1],data2[,2]),"%Y%m%d %H%M%S")

#
# PLOTS
#
Sys.setlocale(category = "LC_ALL", locale = "US_us")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data2, {
    #
    # PLOT 1
    #
    plot(Time,Global_active_power,ylab="Global Active Power",xlab="",
         cex.lab = 0.7, cex.axis= 0.75, type="l")
    lines(Time,Global_active_power,type="l")
    
    #
    #
    #
    plot(Time,Voltage,ylab="Voltage",xlab="datetime",
         cex.lab = 0.7, cex.axis= 0.75, type="l")
    lines(Time,Voltage,type="l")
    
    #
    #
    #
    y_max <- max(range(Sub_metering_1),range(Sub_metering_2),
                 range(Sub_metering_3))
    plot(Time,Sub_metering_1, type="l",ylab="Energy sub metering",xlab="",
         cex.lab = 0.7, cex.axis= 0.75, ylim=c(0,y_max))
    lines(Time,Sub_metering_2,type="l",col="red")
    lines(Time,Sub_metering_3,type="l",col="blue")
    axis(side=1,  at=c(0,1440,2880),labels=c("Thu","Fri","Sat"),cex.axis=0.7)
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),
           col=c('black','red','blue'), cex = 0.65,bty = "n")
    
    #
    #
    #
    plot(Time,Global_reactive_power,xlab="datetime",
         cex.lab = 0.7, cex.axis= 0.75, type="n" ,cex.axis=0.60)
    lines(Time,Global_reactive_power,type="l")
}
)

dev.copy(png, file = "plot4.png") 
dev.off()
