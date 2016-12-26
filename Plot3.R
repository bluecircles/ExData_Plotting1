## Assuming that the data files are saved in the current working directory

df1 <- read.table("./household_power_consumption.txt", header = TRUE, 
                  stringsAsFactors =  FALSE , sep = ";")

## Adding Variables and converting charachter to numeric

df1$Date_asDate <-as.Date(df1$Date, format = "%d/%m/%Y")
df1$Sub_metering_1_asNumeric <- as.numeric(df1$Sub_metering_1)
df1$Sub_metering_2_asNumeric <- as.numeric(df1$Sub_metering_2)
df1$Sub_metering_3_asNumeric <- as.numeric(df1$Sub_metering_3)


## Select data from 2007-02-01 and 2007-02-02
df <- subset(df1, Date_asDate >= as.Date("2007-02-01") & Date_asDate <= as.Date("2007-02-02")) 

## Convert to time
df$DateTime <- paste(df$Date, df$Time)
df$DateTime_asDT <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")


## Open and Close the PNG
dev.copy(png, filename = "plot3.png")

## Plot
with(df, {
  plot(df$DateTime_asDT, df$Sub_metering_1_asNumeric,
              type = "l",
              ylab = "Global Active Power (kilowatts)",
              xlab = "")
  lines(df$DateTime_asDT, df$Sub_metering_2_asNumeric,
             col = "Red")
  lines(df$DateTime_asDT, df$Sub_metering_3_asNumeric,
        col = "Blue")
})

legend("topright", col = c("black", "red", "blue"), lty =1 , lwd =2,
                   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )
      
dev.off()

