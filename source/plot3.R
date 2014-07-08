# install and load the sqldf package to subset the data while reading it from CSV file
install.packages("sqldf")
library(sqldf)

#read into DF dataframe only the info for the dates specified in assignment
filename <- "/Users/mm/Rfiles/Exploratory1/household_power_consumption.txt"
DF <- read.csv.sql(filename, sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ';')

#clean data from NA values
DF <- DF[DF$Global_active_power != '?',]
#creating combined date-time vector for the x axe
x <- as.POSIXct(paste(DF$Date, DF$Time), format="%d/%m/%Y %H:%M:%S")

#plot data as a histogram into a PNG file
png(filename="/Users/mm/Rfiles/Exploratory1/ExData_Plotting1/graphs/plot3.png", width = 480, height = 480, units = "px")
plot(x, DF$Sub_metering_1, type="n", ylab = "Energy submetering", xlab="")
lines(x,DF$Sub_metering_1)
lines(x,DF$Sub_metering_2,col="red")
lines(x,DF$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()