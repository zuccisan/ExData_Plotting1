#load the file with header and replace ? with na
dataimport <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#refine datarange to show only 1/2/2007 to 2/2/2007
refineddata <- dataimport[dataimport$Date %in% c("1/2/2007", "2/2/2007"),]
#create a column that combines date and time so we can use it for plotting later
SetTime <-strptime(paste(refineddata$Date, refineddata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
df <- cbind(SetTime, refineddata)

png("plot1.png", width=480, height=480)
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()