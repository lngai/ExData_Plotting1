#Read the Source dataset
fileurl<-"./exdata_data_household_power_consumption/household_power_consumption.txt"
plotdataset<-read.table(fileurl,header=TRUE,sep=";",na.strings="?")

#Get the data set for 1/2/2007 and 2/2/2007 only
subdataset<-plotdataset[plotdataset$Date=="1/2/2007" | plotdataset$Date=="2/2/2007",]

#Plot the Line chart to png file
png(filename="plot2.png",width=480,height=480)
xaxis<-strptime(paste(subdataset$Date,subdataset$Time),format="%d/%m/%Y %H:%M:%S")
plot(xaxis,subdataset$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()
