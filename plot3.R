#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

#extrac baltimore city
balcity<-NEI[NEI$fips=="24510",]

#create and save plot3

png(filename = "Plot3.png",
    width = 960, height = 480, units = "px")

qplot(x=year,y=log10(Emissions),data=balcity,facets =.~type)+geom_smooth(method="lm")
dev.off()