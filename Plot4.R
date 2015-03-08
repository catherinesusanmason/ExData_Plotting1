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

#Plot 4 Global Actice Power Global and reactive active power vs. datetime 
par(mfrow = c(2,2), mar=c(4,2,2,2), oma= c(1.5,2,1,1))

      plot (data1$Datetime, data1$Global_active_power, type="l", 
            xlab ="Global active power", ylab =" ")
      
      plot (data1$Datetime, data1$Voltage, type="l", xlab ="datetime", ylab ="Voltage")
      
      plot (data1$Datetime, data1$Sub_metering_1, xlab=" ", ylab = "Energy sub metering", type = "n")
      lines(data1$Datetime, data1$Sub_metering_1)
      lines(data1$Datetime, data1$Sub_metering_2, col = "red")
      lines(data1$Datetime, data1$Sub_metering_3, col = "blue")
      
      plot (data1$Datetime, data1$Global_reactive_power, type="l",xlab ="datetime", ylab ="Global_reactive_power")

png(file = "plot4.png", width=480, height=480) 
    par(mfrow = c(2,2), mar=c(4,4,2,2), oma= c(1.5,2,1,1))

      plot (data1$Datetime, data1$Global_active_power, type="l", 
            xlab =" ", ylab ="Global active power")
      
      plot (data1$Datetime, data1$Voltage, type="l", xlab ="datetime", ylab ="Voltage")
      
      plot (data1$Datetime, data1$Sub_metering_1, xlab=" ", ylab = "Energy sub metering", type = "n")
      lines(data1$Datetime, data1$Sub_metering_1)
      lines(data1$Datetime, data1$Sub_metering_2, col = "red")
      lines(data1$Datetime, data1$Sub_metering_3, col = "blue")
      
      plot (data1$Datetime, data1$Global_reactive_power, type="l",xlab ="datetime", ylab ="Global_reactive_power")
dev.off()
## Now you can view the file 'plot4.png' on your computer