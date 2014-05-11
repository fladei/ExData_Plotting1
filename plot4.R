plot4 <- function(file="household_power_consumption.txt") {
    data<- read.table(file,sep=";",na.strings="?", header=T)
    data<- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
    par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0, 0, 2, 0))
    with(data,{
        plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Global_active_power,ylab="Global Active Power",xlab="",type="l")
        plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Voltage,ylab="Voltage",xlab="datetime",type="l")
        with(data, plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l"))
        with(data, points(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Sub_metering_2,col = "red",type="l"))
        with(data, points(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Sub_metering_3,col = "blue",type="l"))
        legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,xjust=1, yjust=0,y.intersp=0.5,bty = "n", seg.len=0.5)
        plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
    })
    dev.copy(png,file="plot4.png")
    dev.off()
}