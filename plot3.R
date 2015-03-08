## this code reads in power consumption data,
## filters it to only reflect two days (2/1/2007-2/2/2007)
## and generates a time series graph of energy sub-metering
## for sub_metering_1, sub_metering_2, and sub_metering_3

pc_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                    comment.char="", stringsAsFactors=FALSE, 
                    colClasses=c(rep("character",2),rep("numeric",7)),
                    na.strings="?")
pc_data$Time <- strptime(paste(pc_data$Date,pc_data$Time),
                         format="%d/%m/%Y %H:%M:%S")
pc_data$Date <- as.Date(pc_data$Date, format="%d/%m/%Y")
pc_data<- pc_data[pc_data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
png(file="plot3.png")
plot(pc_data$Time,pc_data$Sub_metering_1, type="n", 
     ylab="Energy sub metering",xlab="")
lines(pc_data$Time,pc_data$Sub_metering_1,col="black")
lines(pc_data$Time,pc_data$Sub_metering_2,col="red")
lines(pc_data$Time,pc_data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
