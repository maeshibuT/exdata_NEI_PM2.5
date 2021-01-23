#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#check the contents of summarySCC_PM25
head(NEI)
head(SCC)

#create barplot
emission_each_Y<-tapply(NEI$Emissions,NEI$year,sum)
#save as png file
png(filename = "Plot1.png",
    width = 480, height = 480, units = "px")

barplot(emission_each_Y,xlab="year",ylab="PM25 Emissions")
dev.off()
