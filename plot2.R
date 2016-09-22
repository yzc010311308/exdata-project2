
##Subset Baltimore data from the original data
baltimore <- subset(neinew, fips=="24510")
baltimoreplot<- aggregate(Emissions~year, baltimore, sum)
##Draw the plot
plot(baltimoreplot$year, baltimoreplot$Emissions, main= "Baltimore pm2.5 Emissions", "b", 
     xlab="year", ylab="Emissions", xaxt="n")
##Save the image
par(mar=c(5.1,5.1,4.1,2.1))
dev.copy(png, file="plot2.png", width=720, height=480)
                    