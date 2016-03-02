#load the file with header and replace ? with na
dataimport <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#refine datarange to show only 1/2/2007 to 2/2/2007
refineddata <- dataimport[dataimport$Date %in% c("1/2/2007", "2/2/2007"),]
#create a column that combines date and time so we can use it for plotting later
SetTime <-strptime(paste(refineddata$Date, refineddata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
df <- cbind(SetTime, refineddata)

png("plot3.png", width=480, height=480)
linelabels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
linecolors <- c("black","red","blue")
plot(df$SetTime, df$Sub_metering_1, type="l", col="black", xlab = "", ylab = "Energy sub metering")
lines(df$SetTime, df$Sub_metering_2, col="red")
lines(df$SetTime, df$Sub_metering_3, col="blue")
legend("topright", legend=linelabels, col=linecolors, lty="solid")
dev.off()