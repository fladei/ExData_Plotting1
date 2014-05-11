plot1 <- function(file="household_power_consumption.txt") {
    data<- read.table(file,sep=";",na.strings="?", header=T)
    data<- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
    data$Date <- as.Date(as.character(data$Date),format="%d/%m/%Y")
    hist(data$Global_active_power,col=498,xlab="Global Active Power (kilowatts)",main="Global Active Power")
    dev.copy(png,file="plot1.png")
    dev.off()
}