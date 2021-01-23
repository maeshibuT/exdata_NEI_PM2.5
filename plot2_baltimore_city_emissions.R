#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extrac baltimore city
balcity<-NEI[NEI$fips=="24510",]

#create barplot(baltimore)
balcity_emit<-tapply(balcity$Emissions,balcity$year,sum)

#save as png file
png(filename = "Plot2.png",
    width = 480, height = 480, units = "px")
barplot(balcity_emit,xlab="year",ylab="PM25 Emissions in Baltimore City")
dev.off()
