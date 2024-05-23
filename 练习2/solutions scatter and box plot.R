#exercise scatter 1
#discrete balloon plot
library(MASS)
mytab<-data.frame(table(UScereal$mfr,UScereal$shelf))
names(mytab)<-c("Mfr","Shelf","Freq")
ggplot(mytab,aes(x=Mfr,y=Shelf,size=Freq))+
  geom_point(shape=21,fill="lightyellow",colour="black")+
  scale_size_area()

#exercise scatter 2
y1<-cats$Hwt[cats$Sex=="F"]
x1<-cats$Bwt[cats$Sex=="F"]
y2<-cats$Hwt[cats$Sex=="M"]
x2<-cats$Bwt[cats$Sex=="M"]
mylm1<-lm(y1~x1)
mylm2<-lm(y2~x2)
t1<-"R[1]^2==0.2831"
t2<-"R[2]^2==0.6289"
ggplot(cats,aes(x=Bwt,y=Hwt,fill=Sex))+
  geom_point(shape=24)+
  geom_rug(aes(colour=Sex))+
  #geom_rug(aes(colour=Sex),position=position_jitter(0.1))+
  geom_smooth(method=lm,size=1)+
  annotate("text",label=t1,x=3.5,y=8,parse=TRUE)+
  annotate("text",label=t2,x=3.5,y=7,parse=TRUE)

#boxplot exercise
ggplot(diamonds,aes(x=cut,y=price))+
  geom_violin(fill="grey",colour=NA)+
  geom_boxplot(aes(fill=color),position=position_dodge(0.5),width=0.3,
               outlier.alpha=0.1,alpha=0.5)