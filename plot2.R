plot2 <- function(file="household_power_consumption.txt") {
    data<- read.table(file,sep=";",na.strings="?", header=T)
    data<- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
    plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %T"),data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
    dev.copy(png,file="plot2.png")
    dev.off()
}