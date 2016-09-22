
#Subset Baltimore and on-road from the original data
plot5<- subset(neinew, fips=="24510"& type=="ON-ROAD", c("Emissions", "year"))
plot5<- aggregate(Emissions~year, plot5, sum)
##Draw the plot using ggplot2
ggplot(data=plot5, aes(x=year, y=Emissions)) + geom_line() + 
  geom_point( size=4, shape=21, fill="white") + xlab("Year") + 
  ylab("Emissions (tons)") + ggtitle("Motor Vehicle PM2.5 Emissions in Baltimore")
##save the image
par(mar=c(5.1,5.1,4.1,2.1))
dev.copy(png, file="plot3.png", width=720, height=480)