  ##R Script for Plot 2
  
  ##Set working directory and load complete dataset
  setwd("~/DataScienceCertificiation/ExData_Plotting1")
  allData <- read.table("../RawData/household_power_consumption.txt", header = TRUE, sep=";", quote='\"', na.strings="?")

  ##Change Date column to a date and add a date/time column
  dateAndTime <- strptime(paste(allData$Date," ", allData$Time), "%d/%m/%Y %H:%M:%S")
  allData <- cbind(allData, dateAndTime)
  allData$Date <- as.Date(allData$Date,"%d/%m/%Y" )
  
  #Subset to keep only the necessary data, drop old dataset
  myData <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")
  rm(dateAndTime)
  rm(allData)
  
  #Create plot
  with(myData, plot(dateAndTime, Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)"))
  
  #Save plot file to PNG
  dev.copy(png, file = "plot2.png", height = 480, width = 480) 
  dev.off()