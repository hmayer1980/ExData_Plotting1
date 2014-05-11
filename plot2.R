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
png("plot2.png", width = 480, height = 480);
plot(
    x=epc$DateTime
    ,y=epc$Global_active_power
    ,type="l"                       #Line
    ,col="black"
    ,ylab= "Global Active Power(kilowatts)"
    ,xlab="");
dev.off();