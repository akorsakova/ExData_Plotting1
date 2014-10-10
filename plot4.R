  ##R Script for Plot 4
  
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
  
  #Create plot and save directly to the PNG file (avoids ledgend resizing)
  png(file = "plot4.png")

  par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
  with (myData, {
    plot(dateAndTime, Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
    plot(dateAndTime, Voltage, type = "l", xlab = "datetime")
    plot(dateAndTime, Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
    lines(dateAndTime, Sub_metering_2,  col="red")
    lines(dateAndTime, Sub_metering_3,  col="blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1, lwd =1,col=c("black","blue","red"))
    plot(dateAndTime, Global_reactive_power, type = "l", xlab = "datetime")
  })
  
  dev.off()