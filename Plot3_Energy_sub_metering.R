setwd("C:/Users/paddy/Documents/Coursera/Data Science/Course Material/4. Exploratory Data Analysis/Assignments/Week 1/Project")
library(dplyr)

## Load the data
power_consumption <- read.table("./household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE)
## ?read.table

        ## Check to see what the data looks like
                ## head(power_consumption)
                ## dim(power_consumption)
                ## class(power_consumption$Date)


## Change the relevant fields 
        power_consumption$Date<-as.Date(power_consumption$Date,format = "%d/%m/%Y")
        power_consumption$Global_active_power<-as.numeric(power_consumption$Global_active_power)
        power_consumption$Global_reactive_power<-as.numeric(power_consumption$Global_reactive_power)
        
        ## Check the class changes went through
                ## class(power_consumption$Date)
                ## class(power_consumption$Global_reactive_power)

## Load the data into dplyr 
        power_consumption_df <- tbl_df(power_consumption)
## Orhanise the data
        arrange(power_consumption_df, desc(power_consumption_df$Global_active_power))
## Filter on the required dates        
        power_consumption_df<-filter(power_consumption_df,  Date>="2007-02-01"&Date<="2007-02-02")



## Plot the histogram for plot 3       

        ## Plot date-time vs Sub metering 1 data
        plot(x, power_consumption_df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

## Plot date-time vs Sub metering 2 data in red
        lines(x, power_consumption_df$Sub_metering_2, type = "l", col = "red" )

## Plot date-time vs Sub metering 3 data in blue
        lines(x, power_consumption_df$Sub_metering_3, type = "l", col = "blue" )

## Adds legend
        legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


## Copy to .png file
dev.copy(png,file="Plot3_Energy_sub_metering.png")
dev.off()
if(dev.cur() == 1) dev.new()