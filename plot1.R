library(lubridate)

data <- read.table("household_power_consumption.txt",  na.strings="?",stringsAsFactors = FALSE,sep=";",header =TRUE)

data2 <- data
data2[,1] <- as.Date(data2[,1],"%d/%m/%Y")
data2 <- data2[data2$Date >= "2007-02-01" & data2$Date <= "2007-02-02" ,]
data2[,2] <- parse_date_time(paste(data2[,1],data2[,2]),"%Y%m%d %H%M%S")

#plot1

hist(data2$Global_active_power,col="red" ,xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",main = "Global Active Power",yaxt='n',xaxt='n',cex.lab = 0.75,
     cex.main=0.75)
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200,200), cex.axis= 0.7)
axis(side=1,  at=c(0,2,4,6), labels=c(0,2,4,6), cex.axis= 0.75)
dev.copy(png, file = "plot1.png") 
dev.off()