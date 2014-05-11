#setup
require("utils");
require("graphics");
require("grDevices");
rm(list=ls());
#Windows System English language for Time
Sys.setlocale(category = "LC_TIME", locale = "english");

# Helper Function to Convert Strings (Character) to DateTime
ConvertToDateTime=function(StringDate,StringTime) {
    temp<-paste(StringDate,StringTime,sep=" ");
    DateTime<-strptime(temp,format="%d/%m/%Y %H:%M:%S");
    return(DateTime);
};

# reading data - Date and Time will be character
epc <- read.table(
    file="household_power_consumption.txt"
    ,header=TRUE
    ,sep=";"
    ,quote=""
    ,dec="."
    ,na.strings= "?"
    ,stringsAsFactors = FALSE);

# subset on the character data to reduce size
epc<- subset(epc, (epc$Date == "1/2/2007" | epc$Date== "2/2/2007"));

# add datetime column
epc$DateTime <- ConvertToDateTime(epc$Date,epc$Time);

# Creating the plot
png("plot4.png", width = 480, height = 480);
#multiple plots
par(mfrow=c(2,2));
#plot 1
plot(
    x=epc$DateTime
    ,y=epc$Global_active_power
    ,type="l"
    ,col="black"
    ,ylab= "Global Active Power"
    ,xlab="");
#plot 2
plot(
    x=epc$DateTime
    ,y=epc$Voltage
    ,type="l"
    ,col="black"
    ,ylab= "Voltage"
    ,xlab="datetime");
#plot 3
plot(
    x=epc$DateTime
    ,y=epc$Sub_metering_1
    ,type="l"
    ,col="black"
    ,ylab= "Energy sub metering"
    ,xlab="");
lines(
    x=epc$DateTime
    ,y=epc$Sub_metering_2
    ,col="red");
lines(
    x=epc$DateTime
    ,y=epc$Sub_metering_3
    ,col="blue");
legend(
    x="topright"
    ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    ,col=c("black","red","blue")
    ,lty=1
    ,bty="n");
#plot 4
plot(
    x=epc$DateTime
    ,y=epc$Global_reactive_power
    ,type="l"
    ,col="black"
    ,ylab= "Global_reactive_power"
    ,xlab="datetime");
dev.off();