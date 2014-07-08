# install and load the sqldf package to subset the data while reading it from CSV file
install.packages("sqldf")
library(sqldf)

#read into DF dataframe only the info for the dates specified in assignment
filename <- "/Users/mm/Rfiles/Exploratory1/household_power_consumption.txt"
DF <- read.csv.sql(filename, sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ';')

#plot data as a histogram into a PNG file
png(filename="/Users/mm/Rfiles/Exploratory1/ExData_Plotting1/graphs/plot1.png", width = 480, height = 480, units = "px")
hist(DF$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()