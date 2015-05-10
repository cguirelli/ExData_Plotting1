library(lubridate)

data <- read.table("household_power_consumption.txt",  na.strings="?",stringsAsFactors = FALSE,sep=";",header =TRUE)

data2 <- data
data2[,1] <- as.Date(data2[,1],"%d/%m/%Y")
data2 <- data2[data2$Date >= "2007-02-01" & data2$Date <= "2007-02-02" ,]


data2[,2] <- parse_date_time(paste(data2[,1],data2[,2]),"%Y%m%d %H%M%S")


# plot2
with (data2,{
        plot(Time,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",
        cex.lab = 0.7, cex.axis= 0.75, type="n")
        lines(Time,Global_active_power,type="l")
        #axis(side=1,  at=c(0,1440,2880),labels=c("Thu","Fri","Sat"),cex.axis=0.7)
})
dev.copy(png, file = "plot2.png") 
dev.off()
