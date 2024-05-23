#Question 1

mydata<-read.csv(file="traitsbyprogram.csv",header=T)
nprogram<-nrow(mydata)
ntraits<-ncol(mydata)-2
program<-rep(mydata$Program,rep(ntraits,nprogram))
traits<-colnames(mydata)
traits<-traits[-c(1,2)]
traits<-rep(traits,nprogram)
mysub<-mydata[,-(1:2)]
mysub<-as.matrix(mysub)
score<-do.call(c,lapply(1:nprogram,function(x) t(mysub[x,])))
new<-data.frame(program,traits,score)

library(ggplot2)

gg<-ggplot(new,aes(x=traits,y=program,fill=score))
gg+geom_raster()+
  scale_fill_gradient2(
    midpoint=5,low="mediumseagreen",mid="khaki",high="indianred")+
  theme(axis.text.y=element_text(size=5),
        axis.text.x=element_text(angle=90,size=7,vjust=0.5))


######################################################################

#Question 2

rain<-read.csv(file="rain.csv",header=T)
qs<-quantile(rain$ave,c(0.25,0.5,0.75))
category<-rain$ave
category[category<qs[1]]<-1
category[category>=qs[1]&category<qs[2]]<-2
category[category>=qs[2]&category<qs[3]]<-3
category[category>=qs[3]]<-4
newrain<-data.frame(rain,category)

msia<-map_data("world",region="Malaysia")
ggplot(msia,aes(x=long,y=lat,group=group))+	
  coord_cartesian(xlim=c(99,105))+
  geom_polygon(fill="skyblue",colour="darkblue")+
  geom_point(aes(x=longitude,y=latitude,size=ave,
                 fill=as.factor(category)),
             data=newrain,inherit.aes=F,shape=21)+
  labs(fill="Category",size="Amount,mm")+
  scale_fill_discrete(labels=c
                      ("Less than 25%","25%-50%","50%-75%","More than 75%"))

#########################################################################

#Question 3

usa<-map_data("state")
Rape<-usa$region
st<-rownames(USArrests)
st<-tolower(st)
x<-1:length(st)
change<-function(Rape,st,USArr,x){
  R1<-Rape[Rape==st[x]]
  R1<-rep(USArr[x],length(R1))
  return(R1)
}
USRape<-do.call(c,lapply(x,function(x) change(Rape,st,USArrests$Rape,x)))

#Since there are no data on rape cases for the District of Columbia, 
#extra care have to be taken so that our data matches from both sets 
ww<-which(usa$region=="district of columbia")
USRape<-c(USRape[1:(ww[1]-1)],rep(NA,length(ww)),USRape[ww[1]:length(USRape)])
us<-data.frame(usa,USRape)

library(RColorBrewer)
mybrew<-colorRampPalette(brewer.pal(12, "Paired"))(50)
ggplot(us,aes(x=long,y=lat,group=group,fill=as.factor(USRape)))+	
  geom_polygon(colour="dodgerblue")+
  scale_fill_manual(values=mybrew,name="Rape arrests (per 100,000)")