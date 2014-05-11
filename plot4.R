plot4 <- function() {
  
# calling the library to read the data  
require("sqldf")  
   
## reading the data
  
# setting up the variable names  
sql_statement <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
file_name <- "household_power_consumption.txt"

# reading the data as a csv with a ';' as a seperation
data <- read.csv.sql(file_name, sql_statement, sep=';')

# creating the date-time string
date_time = paste(data$Date, data$Time,sep=' ')

# parsing the string into dates objects
formated_date_time = as.POSIXct(strptime(tg,"%d/%m/%Y %H:%M:%S"))

# four graphs will be included
par(mfrow=c(2,2))

# plotting the first graph
plot(formated_date_time,data$Global_active_power,type='l',ylab='Global Active Power',xlab=' ')

# plotting the second graph
plot(formated_date_time,data$Voltage,type='l',ylab='Voltage',xlab='datetime')

# plotting the third graph and setting the labels
plot(formated_date_time,data$Sub_metering_1,type='l',col='black',xlab=' ',ylab='Energy sub metering')
lines(formated_date_time,data$Sub_metering_2,col='red')
lines(formated_date_time,data$Sub_metering_3,col='blue')
# putting the legend for third graph
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('red','black','blue'),lty=1,lwd=c(0.5,0.5),bty="n")

# plotting the second graph
plot(formated_date_time,data$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime')


# saving the graph as a png file
dev.copy(png, file="plot4.png")
# closing png device
dev.off()

}