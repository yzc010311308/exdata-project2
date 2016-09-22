
##Get the "Coal" data from the original data
coal<- grepl('coal', neinew$Short.Name, fixed= TRUE)
plot4<- subset(neinew, coal, c("Emissions", "year", "type", "Short.Name"))
plot4<- aggregate(Emissions~year, plot4, sum)
##Draw the plot using ggplot2
ggplot(data=plot4, aes(x=year, y=Emissions)) + geom_line() + 
  geom_point( size=4, shape=21, fill="white") + xlab("Year") + 
  ylab("Emissions (thousands of tons)") + ggtitle("Total United States PM2.5 Coal Emissions")
##save the image
par(mar=c(5.1,5.1,4.1,2.1))
dev.copy(png, file="plot3.png", width=720, height=480)