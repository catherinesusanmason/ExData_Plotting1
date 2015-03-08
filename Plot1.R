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

#step 2 Making plots
# examine how household energy usage varies over a 2-day period in February, 2007
#Plot 1 Global Active Power  freq vs kilowatts
(hist((data1$Global_active_power), breaks=18, col="red",  
      main= "Global active power", xlab ="Global active power (kilowatts)"))  


png(file = "plot1.png", width=480, height=480) ## Open PNG device; create 'plot1.png' in your working directory
## Create plot and send to a file 
hist((data1$Global_active_power), breaks=18, col="red",  
     main= "Global active power", xlab ="Global active power (kilowatts)")
dev.off()
## Now you can view the file 'plot1.png' on your computer
