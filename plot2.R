data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = '?', nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote ='\"')

data_req <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

data_req$Date <- as.Date(data_req$Date, format = "%d/%m/%Y")
data_req$Time <- format(data_req$Time, format = "%H/%M/%S")
date_time <- strptime(paste(data_req$Date~data_req$Time, sep = " "), "%d/%m/%Y %H/:%M/:%S")

data_req$lol <- as.character("1")

png("plot2.png", width = 480, height = 480)
with(data_req, {
        plot(data_req$Global_active_power~data_req$date_time, type ="1", ylab = "Global Active Power (kilowatts" )
})

