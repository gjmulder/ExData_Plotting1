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
png('plot3.png')
plot(sub.power$datetime,
     rep(40, nrow(sub.power)),
     type = 'n',
     xlab = NA,
     ylim = c(0, 40),
     ylab = 'Energy sub metering')

line.cols <- c('black', 'red', 'blue')
sub.colums <- grep('Sub_metering_', names(sub.power))

legend("topright",
       names(sub.power)[sub.colums],
       lty = 1,
       col = line.cols)

for (sub.plot in sub.colums) {
  lines(sub.power$datetime,
       sub.power[, sub.plot],
       col = line.cols[sub.plot - sub.colums[1] + 1])
}
dev.off()