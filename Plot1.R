
#Week 1 project

setwd("C:/Coursera/COURSE 4 Exploratory Data Analysis/Week1/Project")
getwd()

install.packages("data.table")
library(data.table)

#Explore the data by reading first 100 rows of the data

lookdata <- fread("C:/Coursera/COURSE 4 Exploratory Data Analysis/Week1/Project/household_power_consumption.txt", nrows=100)
lookdata

#Filter data by given dates to read only selected rows from the original data

mydata1 <- fread("C:/Coursera/COURSE 4 Exploratory Data Analysis/Week1/Project/household_power_consumption.txt", 
                 skip="1/2/2007", stringsAsFactors=FALSE, na.strings="?")

#note the length 2008623

mydata2 <- fread("C:/Coursera/COURSE 4 Exploratory Data Analysis/Week1/Project/household_power_consumption.txt", 
                 skip="3/2/2007", stringsAsFactors=FALSE, na.strings="?")

summary(mydata2)

#note the length 2005743

2008623-2005743 
#nrows=2880, these are the rows that have 1/2/2007 and 2/2/2007. This will help in filtering the data to read in R

mydata3 <- fread("C:/Coursera/COURSE 4 Exploratory Data Analysis/Week1/Project/household_power_consumption.txt", 
                 skip="1/2/2007", nrows=2880, stringsAsFactors=FALSE, na.strings="?")

summary(mydata3)
head(mydata3)

#Since there are no column names in the subsetted data, add column names
colnames(mydata3) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")
head(mydata3)

#convert the Date column which is character class to Date class using as.Date() function


#I had to use capital Y for year. Small y in date format gave year 2020. has to do something with century year?

mydata3$Date <- as.Date(mydata3$Date, "%d/%m/%Y")
mydata3[order(mydata3$Date), ]
str(mydata3)

#To convert Time column which is character variable to Time class, we first need to create Date/Time object


mydata3$DateTimeObj <- as.POSIXct(paste(mydata3$Date, mydata3$Time), format="%Y-%m-%d %H:%M:%S")
head(mydata3)

#Then this new column DateTimeObj can be converted to Time class  

str(mydata3)

#Plot 1 Global Active Power ~ Frequency


hist(mydata3$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global active Power (kilowatts)", ylab="Frequency")


#Copy my plot to a PNG file and specify pixel size 
  dev.copy(png, file = "plot1.png", height=480, width=480, unit="px")

## Don't forget to close the PNG device!
  dev.off()
  
  




