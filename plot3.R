## Exploratory Data Analysis
## fladei
## 06/03/2014

plot3 <- function(file="household_power_consumption.txt") {
    data<- read.table(file,sep=";",na.strings="?", header=T)
    data<- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
    with(data, plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l"))
    with(data, points(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Sub_metering_2,col = "red",type="l"))
    with(data, points(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Sub_metering_3,col = "blue",type="l"))
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,xjust=1, yjust=0,y.intersp=0.5, seg.len=0.5)
    dev.copy(png,file="plot3.png")
    dev.off()
}