#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract coal related SCC
SCC_coal<-SCC[grep("coal",SCC$Short.Name),]
NEI_coal<-NEI[NEI$SCC %in% SCC_coal$SCC,]

#save as png file
png(filename = "Plot4.png",
    width = 480, height = 480, units = "px")

qplot(x=year,y=log10(Emissions),data=NEI_coal,ylab="PM25 Emissions")+geom_smooth(method="lm")

dev.off()
