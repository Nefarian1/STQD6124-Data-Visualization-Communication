library(MASS)

#Box plot
ggplot(birthwt, aes(x=factor(race),y=bwt))+geom_boxplot()

#change outlier
ggplot(birthwt, aes(x=factor(race),y=bwt))+geom_boxplot(coef=2)

#change features
ggplot(birthwt, aes(x=factor(race),y=bwt))+
  geom_boxplot(outlier.size=3, outlier.shape=21,
               outlier.colour = "red",outlier.fill = "pink")

#a single box plot
ggplot(birthwt, aes(x=1,y=bwt))+geom_boxplot()

#notched box plot
ggplot(birthwt, aes(x=factor(race),y=bwt))+
  geom_boxplot(notch=T)

#add markers
ggplot(birthwt, aes(x=factor(race),y=bwt))+
  geom_boxplot()+
  stat_summary(fun.y="mean",geom="point",shape=23,size=3,fill="blue")

#group box plot
ggplot(birthwt, aes(x=factor(race),y=bwt,fill=factor(smoke)))+geom_boxplot()

ggplot(birthwt, aes(x=factor(race),y=bwt,fill=factor(smoke)))+
  geom_boxplot(width=0.5,position=position_dodge(width=0.7))

#violin plot
ggplot(birthwt, aes(x=factor(race),y=bwt))+geom_violin()


#Axes
#swap x and y axes
gg<-ggplot(birthwt, aes(x=factor(race),y=bwt))
gg+geom_boxplot()+coord_flip()

#limits
gg+geom_boxplot()+ylim(0,7000)
gg+geom_boxplot()+scale_y_continuous(limits = c(0,7000))
gg+geom_boxplot()+expand_limits(y=c(0,7000))

ggplot(trees, aes(x=Girth,y=Height))+geom_line()+
  expand_limits(x=c(0,30))
ggplot(trees, aes(x=Girth,y=Height))+geom_line()+
  scale_x_continuous(limits=c(0,30)) 
ggplot(trees, aes(x=Girth,y=Height))+geom_line()+
  xlim(0,30)

ggplot(PlantGrowth, aes(x=group,y=weight))+geom_boxplot()+
  scale_y_continuous(limits=c(4.5,5.5))
ggplot(PlantGrowth, aes(x=group,y=weight))+geom_boxplot()+
  coord_cartesian(ylim=c(4.5,5.5))

#reverse axes
gg+geom_boxplot()+scale_y_reverse()
ggplot(trees, aes(x=Girth,y=Height))+geom_line()+
  scale_x_reverse()

#recorder items
gg+geom_boxplot()+
  scale_x_discrete(limits=as.character(c(1,3,2)))
gg+geom_boxplot()+
  scale_x_discrete(limits=rev(levels(as.factor(birthwt$race))))
gg+geom_boxplot()+coord_flip()+
  scale_x_discrete(limits=rev(levels(as.factor(birthwt$race))))
gg+geom_boxplot()+
  scale_x_discrete(limits=as.factor(c(1,3)))

#tick marks
gg+geom_boxplot()+
  scale_y_continuous(breaks=c(1000,2500,3000,3500,4000,5000))
gg+geom_boxplot()+
  scale_y_continuous(breaks=c(1000,2300,3700,5000),
                     label=c("min","lower","upper","max"))

gg+geom_boxplot()+theme(axis.text.y=element_blank())
gg+geom_boxplot()+theme(axis.ticks=element_blank())
gg+geom_boxplot()+theme(axis.ticks.x=element_blank(),
                        axis.text=element_blank())
gg+geom_boxplot()+
  scale_y_continuous(breaks=NULL)

#change text on axes
gg+geom_boxplot()+
  theme(axis.text.x=element_text(angle=90,hjust=0.5,vjust=0.5))
gg+geom_boxplot()+scale_x_discrete(labels=c("ONE","TWO","THREE"))+
  theme(axis.text.x=element_text(angle=30,hjust=0.5,vjust=0.5,
                                 colour="violetred",face="bold",size=10))

#data as an axis
ggplot(economics, aes(x=date,y=psavert))+geom_line()

esub<-subset(economics,date>=as.Date("2010-01-01"))
db<-seq(as.Date("2010-01-01"),as.Date("2015-04-01"),by="6 month")

ggplot(esub, aes(x=date,y=psavert))+geom_line()+
  scale_x_date(breaks=db)+
  theme(axis.text.x=element_text(angle=30,hjust=0.5,vjust=0.5,
                                 colour="violetred",face="bold",size=10))

#Labels
##change labels
gg+geom_boxplot()+
  xlab("RACE")+ylab("BIRTH Weight")
gg+geom_boxplot()+
  scale_x_discrete(name="RACE")+
  scale_y_continuous(name="BIRTH Weight")

gg+geom_boxplot()+theme(axis.title.y=element_blank())
gg+geom_boxplot()+theme(axis.title=element_blank())

gg+geom_boxplot()+ylab("BIRTH Weight")+
  theme(axis.title.y=element_text(face="italic",angle=20,
                                  size=9,colour="blue"))

#Title
ggplot(economics, aes(x=date,y=psavert))+geom_line()+
  ggtitle("Personal Savings Rate 2010-2015")
ggplot(economics, aes(x=date,y=psavert))+geom_line()+
  ggtitle("Personal Savings Rate 2010-2015")+
  theme(plot.title=element_text(face="bold.italic",colour="darkred"))

#Legend
gg<-ggplot(birthwt,aes(x=factor(race),y=bwt,fill=factor(race)))
gg+geom_boxplot()

#remove legend
gg+geom_boxplot()+guides(fill=F)
gg+geom_boxplot()+scale_fill_discrete(guide=F)

#change position
gg+geom_boxplot()+theme(legend.position = "top")
gg+geom_boxplot()+theme(legend.position =c(1,1),
                        legend.justification = c(1,1))
#(0,0)=bottom left, (1,1)=top right, (1,0)=bottom right, (0,1)=top left
#legend.justification is which part of the legend box at legend.position

gg+geom_boxplot()+theme(legend.position =c(1,1),
                        legend.justification = c(1,1))+
  theme(legend.background = element_blank())+
  theme(legend.key = element_blank())

gg+geom_boxplot()+theme(legend.position =c(1,1),
                        legend.justification = c(1,1))+
  theme(legend.background = element_rect(fill="skyblue",colour="darkblue"))+
  theme(legend.key = element_rect(fill="skyblue",colour="darkblue"))

#recorder legend items
gg+geom_boxplot()+
  scale_fill_discrete(limits=as.character(c(1,3,2)))
gg+geom_boxplot()+guides(fill=guide_legend(reverse = T))
gg+geom_boxplot()+scale_fill_hue(guide=guide_legend(reverse = T))

#title of legend
gg+geom_boxplot()+labs(fill="RACE")
gg+geom_boxplot()+scale_fill_discrete(name="RACE")

ggplot(mtcars, aes(x=drat,y=wt,shape=factor(am),colour=factor(vs)))+
  geom_point()+labs(shape="am",colour="vs")

#appearance
gg+geom_boxplot()+
  theme(legend.title=element_text(face="bold",colour="seagreen",size=10))
gg+geom_boxplot()+
  guides(fill=guide_legend(title.theme=element_text(face="bold",colour="seagreen")))
gg+geom_boxplot()+
  guides(fill=guide_legend(title=NULL))

#change the labels
gg+geom_boxplot()+
  scale_fill_discrete(labels=c("ONE","TWO","THREE"))
gg+geom_boxplot()+
  theme(legend.title=element_text(face="bold",colour="seagreen",size=10))
gg+geom_boxplot()+
  guides(fill=guide_legend(label.theme=element_text(colour="seagreen",angle=30)))

#circular graph
pie<-ggplot(mtcars, aes(x=" ",fill=factor(cyl)))
pie+geom_bar(width=1)+coord_polar(theta="y")
pie+geom_bar(width=1)+coord_polar()

m<-matrix(mdeaths,ncol=12,byrow = T)
mave<-colMeans(m)
md<-data.frame(1:12,mave)
names(md)<-c("months","deaths")
ggplot(md, aes(x=months,y=deaths))+geom_line()+
  scale_x_continuous(breaks=1:12)+coord_polar()

#facets
qf<-ggplot(mpg, aes(x=displ,y=hwy))+geom_point()
qf+facet_grid(drv~.)#vertically
qf+facet_grid(.~cyl)#horizontal
qf+facet_grid(drv~cyl)
qf+facet_wrap(~class,ncol=2)
qf+facet_grid(drv~cyl,scales="free")
qf+facet_grid(drv~cyl,scales="free_y")

qf+facet_grid(drv~cyl)+
  theme(strip.text = element_text(face="bold",colour="darkblue"),
        strip.background = element_rect(fill="skyblue",colour="darkblue"))

#colour pallettes
ggplot(mpg, aes(x=displ,y=hwy,colour=class))+geom_point()+
  scale_colour_hue(l=30)#default =65

Year<-rep(1960:1980,rep(4,21))
Quarter<-rep(1:4,21)
ds<-data.frame(Year,JohnsonJohnson,Quarter)
names(ds)<-c("Year","Earnings","Quarter")
gs<-ggplot(ds, aes(x=Year,y=Earnings,fill=factor(Quarter)))
gs+geom_area()+scale_fill_grey()
gs+geom_area()+scale_fill_brewer()

library(RColorBrewer)
gs+geom_area()+scale_fill_brewer(palette="Greens")#"BrBG"

mypal<-brewer.pal(4,"Greens")
gs+geom_area()+scale_fill_manual(values=mypal)

#Themes
ggplot(mpg, aes(x=cty,y=hwy,colour=class))+geom_point()
ggplot(mpg, aes(x=cty,y=hwy,colour=class))+geom_point()+theme_grey()
ggplot(mpg, aes(x=cty,y=hwy,colour=class))+geom_point()+theme_bw()

#modify theme
ggplot(mpg, aes(x=cty,y=hwy,colour=class))+geom_point()+
  theme_grey(base_size = 20)
ggplot(mpg, aes(x=cty,y=hwy,colour=class))+geom_point()+
  theme(panel.grid.major = element_line(colour="blue"),
        panel.grid.minor =element_line(colour="skyblue",linetype="dashed"),
        panel.background = element_rect(fill="lightblue"),
        panel.border = element_rect(colour="darkblue",fill=NA))

ggplot(mpg, aes(x=cty,y=hwy,colour=class))+geom_point()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor =element_blank(),
        panel.background = element_rect(fill="lightblue"),
        panel.border = element_rect(colour="darkblue",fill=NA))

#mytheme
mytheme<-theme_bw()+
  theme(panel.grid.major=element_line(colour="blue"),
        panel.grid.minor=element_line(colour="skyblue",linetype="dashed"),
        panel.background=element_rect(fill="floralwhite"),
        panel.border=element_rect(colour="darkblue",fill=NA))+
  theme(axis.title.x=element_text(colour="darkred"),
        axis.text.x=element_text(colour="hotpink"),
        axis.title.y=element_text(colour="darkred"),
        axis.text.y=element_text(colour="hotpink"),
        plot.title=element_text(colour="lightcoral",face="bold"))+
  theme(legend.background=element_rect(fill="honeydew",colour="black"),
        legend.title=element_text(colour="seagreen",face="italic"),
        legend.text=element_text(colour="darkgreen"),
        legend.key=element_rect(colour="grey"))

ggplot(mpg, aes(x=cty,y=hwy,colour=class))+geom_point()+mytheme
gg+geom_boxplot()+mytheme





