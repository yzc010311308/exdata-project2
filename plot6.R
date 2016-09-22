
##subset Baltimore and LA data from the original data
plot6<- subset(neinew, (fips=="24510"|fips=="06037")&type=="ON-ROAD", c("Emissions", "year", "type","fips"))
plot6<- rename(plot6 , c("fips"="City"))
##rename the fips
plot6$City <- factor(plot6$City, levels = c("06034", "24510"), labels = c("Los Angles, CA", "Baltimore, MD"))
##melt then dcast the data
plot6 <- melt(plot6, id=c("year", "City"), measure.var= "Emission")
plot6 <- dcast(plot6, City+year~variable, sum)
plot6
##Calculate the difference
plot6[2:8,"change"] <- diff(plot6$Emissions)
plot6[c(1,5), 4]<-0
##Draw the plot
ggplot(data=plot6, aes(x=year, y=change, group=City, color=City)) + 
  geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + 
  ylab("Change in Emissions (tons)") + ggtitle("Motor Vehicle PM2.5 Emissions Changes: Baltimore vs. LA")
##save the image
par(mar=c(5.1,5.1,4.1,2.1))
dev.copy(png, file="plot6.png", width=720, height=480)