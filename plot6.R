#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extrac baltimore city and Los Angeles whose time is "ON-ROAD"
balLA_motor<-subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type %in% "ON-ROAD")

#total emission from motor vehicle in each year 

balLA_motor_total<-tapply(balLA_motor$Emissions,INDEX=list(balLA_motor$year,balLA_motor$fips),sum)
balLA_motor_total<-data.frame(balLA_motor_total)
#create data.frame($year,$fips,$t_Emissions)
balLA_motor_total2<-data.frame(year=rep(c("1999","2002","2005","2008"),2),fips=rep(c("06037","24510"),each=4),
                               t_Emissions=c(balLA_motor_total$X06037,balLA_motor_total$X24510))

png(filename = "Plot6.png",
    width = 480, height = 480, units = "px")

qplot(year,t_Emissions,data=balLA_motor_total2,col=fips,geom=c("point","line"),xlab="year",ylab="PM25 Emissions from motor veicles",main="PM25 emissions from motor vehicles in two cities")
dev.off()