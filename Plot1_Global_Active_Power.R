setwd("C:/Users/paddy/Documents/Coursera/Data Science/Course Material/4. Exploratory Data Analysis/Assignments/Week 1/Project")
library(dplyr)

## Load the data
        ## ?read.table
        power_consumption <- read.table("./household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE)
        

        ## Check to see what the data looks like
        ## head(power_consumption)
        ## dim(power_consumption)
        ## class(power_consumption$Date)
        ## Change the relevant 
        power_consumption$Date<-as.Date(power_consumption$Date,format = "%d/%m/%Y")
        power_consumption$Global_active_power<-as.numeric(power_consumption$Global_active_power)
        power_consumption$Global_reactive_power<-as.numeric(power_consumption$Global_reactive_power)
        
        ## Check the class changes went through
                ## class(power_consumption$Date)
                ## class(power_consumption$Global_reactive_power)

## Load the data into dplyr 
        power_consumption_df <- tbl_df(power_consumption)
## Orhanise the data to have a look
        arrange(power_consumption_df, desc(power_consumption_df$Global_active_power))
## Filter on the required dates        
        power_consumption_df<-filter(power_consumption_df,  Date>="2007-02-01"&Date<="2007-02-02")
## Plot the histogram for plot 1
        hist(power_consumption_df$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)", breaks=11)
## Add the main title
        title("Global Active Power")

## Alternative Method
##  power_cons_selecct <- power_consumption[power_consumption$Date >= "2007-02-01" & power_consumption$Date <= "2007-02-02", ] 
## summary(power_cons_selecct$Global_active_power)
## power_cons_selecct$Global_active_power<-as.numeric(power_cons_selecct$Global_active_power)
## hist(power_cons_selecct$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)", breaks=11)

        ## Copy to .png file
        dev.copy(png,file="Plot1_Global_Active_Power.png")
        dev.off()
        if(dev.cur() == 1) dev.new()