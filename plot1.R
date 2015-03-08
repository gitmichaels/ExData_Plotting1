## this code reads in power consumption data,
## filters it to only reflect two days (2/1/2007-2/2/2007)
## and generates a histogram of Global Active Power for those two days

pc_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                        comment.char="", stringsAsFactors=FALSE, 
                        colClasses=c(rep("character",2),rep("numeric",7)),
                        na.strings="?")
pc_data$Time <- strptime(paste(pc_data$Date,pc_data$Time),
                        format="%d/%m/%Y %H:%M:%S")
pc_data$Date <- as.Date(pc_data$Date, format="%d/%m/%Y")
pc_data<- pc_data[pc_data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
png(file="plot1.png")
hist(xUse$Global_active_power, main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", col="red")
dev.off()