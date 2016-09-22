
##Subset Baltimore data from the original data
plot3<- subset(neinew, fips==24510, c("Emissions", "year", "type"))
plot3<- melt(plot3, id=c("year", "type"), measure.vars= "Emissions")
plot3<- dcast(plot3, year+type~variable, sum)
##Draw the plot using ggplot2
ggplot(data=plot3, aes(x=year, y= Emissions, group=type, color=type))+
  geom_line()+geom_point(size=3, shape=21, fill= "white")+xlab("year")+
  ylab("Emissions(tons)")+ggtitle("Baltimore PM2.5 Emissions by Type and Year")

##save the image
par(mar=c(5.1,5.1,4.1,2.1))
dev.copy(png, file="plot3.png", width=720, height=480)