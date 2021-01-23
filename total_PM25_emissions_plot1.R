#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#check the contents of summarySCC_PM25
head(NEI)
head(SCC)

#create barplot
emission_each_Y<-tapply(NEI$Emissions,NEI$year,sum)
barplot(emission_each_Y,xlab="year",ylab="PM25 Emissions")