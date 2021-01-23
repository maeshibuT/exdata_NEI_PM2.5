#plot3'

#readRDS
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

#extrac baltimore city
balcity<-NEI[NEI$fips=="24510",]



#subset dataframe for each type
balcity_point<-balcity[balcity$type=="POINT",]
balcity_nonpoint<-balcity[balcity$type=="NONPOINT",]
balcity_onroad<-balcity[balcity$type=="ON-ROAD",]
balcity_nonroad<-balcity[balcity$type=="NON-ROAD",]

#total emissions of each year with each type
t_point<-data.frame(totalemit=with(balcity_point,tapply(Emissions,year,sum)),year=c(1999,2002,2005,2008),type=rep("POINT"))
t_nonp<-data.frame(totalemit=with(balcity_nonpoint,tapply(Emissions,year,sum)),year=c(1999,2002,2005,2008),type=rep("NONPOINT"))
t_onr<-data.frame(totalemit=with(balcity_onroad,tapply(Emissions,year,sum)),year=c(1999,2002,2005,2008),type=rep("ON-ROAD"))
t_nonr<-data.frame(totalemit=with(balcity_nonroad,tapply(Emissions,year,sum)),year=c(1999,2002,2005,2008),type=rep("NON-ROAD"))

#rbind each emission type
balcity_emit_type<-rbind(t_point,t_nonp,t_onr,t_nonr)
rownames(balcity_emit_type)<-1:16 #change rownames


#create plot(baltimore)
qplot(x=year,y=log10(Emissions),data=balcity,facets =.~type)+geom_smooth(method="lm")
