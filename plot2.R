## Assuming that the data files are saved in the current working directory

df1 <- read.table("./household_power_consumption.txt", header = TRUE, 
                  stringsAsFactors =  FALSE , sep = ";")

## Adding Variables and converting charachter to numeric

df1$Date_asDate <-as.Date(df1$Date, format = "%d/%m/%Y")
df1$Global_active_power_asNumeric <- as.numeric(df1$Global_active_power)

## Select data from 2007-02-01 and 2007-02-02
df <- subset(df1, Date_asDate >= as.Date("2007-02-01") & Date_asDate <= as.Date("2007-02-02")) 

## Convert to time
df$DateTime <- paste(df$Date, df$Time)
df$DateTime_asDT <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")


## Open and Close the PNG
dev.copy(png, filename = "plot2.png")

## Plot
plot(df$DateTime_asDT, df$Global_active_power_asNumeric,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
     )

dev.off()