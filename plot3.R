#Read the Source dataset
fileurl<-"./exdata_data_household_power_consumption/household_power_consumption.txt"
plotdataset<-read.table(fileurl,header=TRUE,sep=";",na.strings="?")

#Get the data set for 1/2/2007 and 2/2/2007 only
subdataset<-plotdataset[plotdataset$Date=="1/2/2007" | plotdataset$Date=="2/2/2007",]

#Plot the Line chart to png file
png(filename="plot3.png",width=480,height=480)
xaxis<-strptime(paste(subdataset$Date,subdataset$Time),format="%d/%m/%Y %H:%M:%S")
with(subdataset,plot(xaxis,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
with(subdataset,lines(xaxis,Sub_metering_2,col="red"))
with(subdataset,lines(xaxis,Sub_metering_3,col="blue"))
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Submetering_1","Submetering_2","Submetering_3"))
dev.off()
