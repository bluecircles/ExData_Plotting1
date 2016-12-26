## Assuming that the data files are saved in the current working directory

df1 <- read.table("./household_power_consumption.txt", header = TRUE, 
      stringsAsFactors =  FALSE , sep = ";")

## Adding Variables and converting charachter to numeric
  
df1$Date_asDate <-as.Date(df1$Date, format = "%d/%m/%Y")
df1$Global_active_power_asNumeric <- as.numeric(df1$Global_active_power)

## Select data from 2007-02-01 and 2007-02-02
df <- subset(df1, Date_asDate >= as.Date("2007-02-01") & Date_asDate <= as.Date("2007-02-02")) 


## Open and Close the PNG
dev.copy(png, filename = "plot1.png")

## Create Histogram
hist(df$Global_active_power_asNumeric, 
     col = "red" ,
     xlim = c(0,6) ,
     ylim = c(0,1200) ,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     xaxt = "n"
     )
axis(1, at=seq(0,6 ,by=2))

dev.off()