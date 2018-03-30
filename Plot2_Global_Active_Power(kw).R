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


## Plot the histogram for plot 2
x<-as.POSIXct(paste(power_consumption_df$Date, power_consumption_df$Time), format="%Y-%m-%d %H:%M:%S")
## Alternate method to get the Date-time combined
## datestring <- paste(power_consumption_df$Date, power_consumption_df$Time) 
## Datetime <- strptime(datestring, "%Y-%m-%d %H:%M:%S")
## In the next entry you could replace "x" with "Datetime"

        ##?plot.default
        with(power_consumption_df, plot(x, Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)",type="n"))
        with(power_consumption_df, lines(x, Global_active_power,type="l",lty=1))


        ## Copy to .png file
        dev.copy(png,file="Plot2_Global_Active_Power(kw).png")
        dev.off()
        if(dev.cur() == 1) dev.new()
