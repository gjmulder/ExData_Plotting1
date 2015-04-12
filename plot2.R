power <- read.csv('household_power_consumption.txt',
                  header = T,
                  na.strings = '?',
                  sep = ';',
                  stringsAsFactors = F)

sub.power <- subset(power, (Date == '1/2/2007') |
                           (Date == '2/2/2007'))

sub.power$datetime <- strptime(paste(sub.power$Date,
                                     sub.power$Time),
                               '%d/%m/%Y %H:%M:%S')

png('plot2.png')
plot(sub.power$datetime,
     sub.power$Global_active_power,
     type='l',
     xlab=NA,
     ylab='Global Active Power (kilowatts)')
dev.off()