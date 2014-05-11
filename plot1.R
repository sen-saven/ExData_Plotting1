plot1 <- function() {
  
# calling the library to read the data  
require("sqldf")  
  
## reading the data
  
# setting up the variable names  
sql_statement <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
file_name <- "household_power_consumption.txt"

# reading the data as a csv with a ';' as a seperation
data <- read.csv.sql(file_name, sql_statement, sep=';')

# plotting the histogram and setting the labels
hist(data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')

# defining y-axis
y_axis = seq(0,1200,200)

# inserting it to the graph
axis(2,at= y_axis,label=y_axis)

# saving the graph as a png file
dev.copy(png, file="plot1.png")
# closing png device
dev.off()

}