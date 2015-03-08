#Step 1 Load data
#setwd("~/Data Science/Exploratory Data Analysis")
data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE, na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
#convert the Date and Time variables to Date/Time classes in R using the strptime() 
#and as.Date() functions.   #missing values are coded as ?

data1<- subset(data,Date=="1/2/2007"| Date=="2/2/2007")
Datetime<- paste(data1$Date, data1$Time, sep = " ")
data1<- cbind (data1,Datetime)
data1$Datetime<- strptime(as.character(data1$Datetime), format="%d/%m/%Y %H:%M:%S")

#Plot 2 Global Active Power kilowatts vs. weekday
    plot (data1$Datetime, data1$Global_active_power, type="l", 
          xlab ="Global active power (kilowatts)", ylab =" ")

    png(file = "plot2.png", width=480, height=480) 
    plot (data1$Datetime, data1$Global_active_power, type="l", 
          xlab ="Global active power (kilowatts)", ylab =" ")
    dev.off()
## Now you can view the file 'plot2.png' on your computer