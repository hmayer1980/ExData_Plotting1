#setup
require("utils");
require("graphics");
require("grDevices");
rm(list=ls());

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

# Creating the plot
png("plot1.png", width = 480, height = 480);
hist(
    x=epc$Global_active_power
    ,main="Global Active Power"
    ,col="red"
    ,ylab= "Frequency"
    ,xlab="Global Active Power(kilowatts)");
dev.off();