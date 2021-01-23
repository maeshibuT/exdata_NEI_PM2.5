#extrac baltimore city
bal_city<-NEI[NEI$fips=="24510",]

#create barplot(baltimore)
balcity_emit<-tapply(bal_city$Emissions,bal_city$year,sum)
barplot(balcity_emit,xlab="year",ylab="PM25 Emissions in Baltimore City")