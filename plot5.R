#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extrac baltimore city
balcity<-NEI[NEI$fips=="24510",]
#extract  emissions type= motor vehicle sources ("ON-ROAD")
balcity_motor<-balcity[balcity$type=="ON-ROAD",]

#create plot5
png(filename = "Plot5.png",
    width = 480, height = 480, units = "px")
qplot(year,log10(Emissions),data=balcity_motor,xlab="year",ylab="PM25")+geom_smooth(method="lm")+ggtitle("PM25 emissions from motor vehicles in Baltimore City")
dev.off()