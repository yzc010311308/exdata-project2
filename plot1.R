
##Download and unzip the file
if(!file.exists("exdata-data-NEI_data.zip")){
  temp <- tempfile() 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp) 
  unzip(temp) 
  unlink(temp)
}

##Read the data
nei<- read.rds("summraySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

##Processing the raw data
x<- subset(scc, select = c("SCC", "Short.Name"))
neinew <- merge(nei, x, by.x="SCC", by.y="SCC", all= TRUE)
neinew$Emissions<- neinew$Emissions/1000
head(neinew)
neiplot <- aggregate(Emissions~year, neinew, sum)

#Draw the plot
plot(neiplot$year, neiplot$Emissions, main="Total US pm2.5 Emissions", "b", xlab="Year", ylab="Emissions", xaxt="n")
axis(side=1, at=c("1999","2002","2005","2008"))

##Save the image
par(mar=c(5.1,5.1,4.1,2.1))
dev.copy(png, file="plot1.png", width=720, height=480)