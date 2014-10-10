  ##R Script for Plot 1
  
  ##Set working directory and load complete dataset
  setwd("~/DataScienceCertificiation/ExData_Plotting1")
  allData <- read.table("../ExploratoryAnalysisProj1/RawData/household_power_consumption.txt", header = TRUE, sep=";", quote='\"', na.strings="?")

  ##Change Date column to a date and add a date/time column
  dateAndTime <- strptime(paste(allData$Date," ", allData$Time), "%d/%m/%Y %H:%M:%S")
  allData <- cbind(allData, dateAndTime)
  allData$Date <- as.Date(allData$Date,"%d/%m/%Y" )
  
  #Subset to keep only the necessary data, drop old dataset
  myData <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")
  rm(dateAndTime)
  rm(allData)
  
  #Create plot
  with(myData, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (killowatts)"))
  
  #Save plot file to PNG
  dev.copy(png, file = "plot1.png", height = 480, width = 480) 
  dev.off()