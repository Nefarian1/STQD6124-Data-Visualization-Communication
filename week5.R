library(ggplot2)
#Bar Chart###################################################
#Bar Chart with table
x<-1:5
y<-round(runif(5,1,10))
z<-data.frame(x,y)
z
ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity")

#if x continuous
x<-c(1,1.3,1.4,2.0,2.5)
z<-data.frame(x,y)
ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity")

#force x to be discrete
ggplot(data=z,aes(x=factor(x),y=y))+geom_bar(stat="identity")

#change colour
ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity",fill="lightgreen")
ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity",fill=rainbow(5))

#add border
ggplot(data=z,aes(x=x,y=y))+
  geom_bar(stat="identity",fill="lightgreen",colour="black")

#count data
mpg
ggplot(data=mpg,aes(x=class))+geom_bar()
b<-ggplot(data=mpg)
b+geom_bar(aes(x=class),colour="black",fill=rainbow(7))

b+geom_bar(aes(x=displ))
b+geom_histogram(aes(x=displ))
b+geom_histogram(aes(x=displ),bins=50,fill="lightcoral")
b+geom_histogram(aes(x=displ),binwidth =0.1,fill="lightcoral")

#change colour with respect to categories
a<-c("A","B","C","D","E","F","G","H","I","J")
b<-ceiling(runif(10,10,13))
c<-round(runif(10,5,20))
d<-data.frame(a,b,c)

ggplot(data=d,aes(x=a,y=c,fill=b))+geom_bar(stat="identity")
ggplot(data=d,aes(x=a,y=c,fill=factor(b)))+geom_bar(stat="identity")
ggplot(data=d,aes(x=a,y=c))+geom_bar(stat="identity",fill=b)

f<-factor(b,labels = c("First","Second","Third"))
e<-data.frame(a,f,c)
ggplot(data=e,aes(x=a,y=c,fill=f))+geom_bar(stat="identity")
ggplot(data=e,aes(x=a,y=c))+geom_bar(stat="identity",fill=f)#error

g<-factor(b,labels = c("red","violet","coral"))
e<-data.frame(a,f,c,g)
ggplot(data=e,aes(x=a,y=c))+geom_bar(stat="identity",fill=g)#ok

#group data
x<-rep(1:3,2)
y<-rep(1:2,3)
r<-round(runif(6,1,10))
z<-data.frame(x,y,r)
table(z$x,z$y)

ggplot(data=z,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",colour="black")

ggplot(data=z,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",colour="black",position = "dodge")

ggplot(data=z,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",colour="black",position = position_dodge())
#Example of Exercise bars & line Q2
z1<-z[-6,]
ggplot(data=z1,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",colour="black")

ggplot(data=z1,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",colour="black",position = "dodge")
#
z2<-rbind(z1,c(3,2,NA))
ggplot(data=z2,aes(x=factor(x),y=r,fill=factor(y)))+
  geom_bar(stat = "identity",colour="black",position = "dodge")

#group count data
ggplot(data = mpg,aes(x=class,fill=drv))+geom_bar(position = "dodge")
ggplot(data = mpg,aes(x=class,fill=drv))+geom_bar()

#set bar width and spacing
ggplot(data = mpg,aes(x=class,fill=drv))+geom_bar(width = 0.5)
ggplot(data = mpg,aes(x=class,fill=drv))+geom_bar(width = 1)

ggplot(data=mpg,aes(x=class,fill=drv))+
  geom_bar(width=0.5,position = "dodge")

#width=x makes each group total width=x
#Example of Exercise bars & line Q1
ggplot(data=mpg,aes(x=class,fill=drv))+
  geom_bar(width=0.5,position = position_dodge(width = 0.7))

#position_dodge(width=x) makes the middle of each bar
#where it would be if the bar width is x and touching

#add labels
x<-1:5
y<-round(runif(5,1,10))
z<-data.frame(x,y)

ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity")+
  geom_text(aes(label=y),colour="white")
ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity")+
  geom_text(aes(label=y),colour="white",vjust=1.5)
ggplot(data=z,aes(x=x,y=y))+geom_bar(stat="identity")+
  geom_text(aes(label=y),colour="red",vjust= -0.5)

b<-ggplot(data = mpg)
tab<-data.frame(table(mpg$class))

b+geom_bar(aes(x=class),fill="steelblue")+
  geom_text(aes(x=1:7,y=Freq,label=Freq),data=tab,vjust=1,size=3)
#default size font=5默认大小字体

#reorder bars

a<-c("A","B","C","D","E","F","G","H","I","J")
b<-ceiling(runif(10,10,13))
c<-round(runif(10,5,20))
d<-data.frame(a,b,c)

ggplot(data=d,aes(x=a,y=c))+geom_bar(stat="identity")

ggplot(data=d,aes(x=a,y=c))+geom_bar(stat="identity")+
  scale_x_discrete(limits=c("A","C","E","G","I","B","D","F","H","J"))

ggplot(data=d,aes(x=reorder(a,b),y=c))+geom_bar(stat="identity")


#line chart##################################################
#basic line chart
g<-ggplot(trees,aes(x=Girth,y=Height))
g+geom_line()

#expand the limits
g+geom_line()+expand_limits(x=5,y=50)
g+geom_line()+expand_limits(x=c(5,25))

#add points to a line
g+geom_line()+geom_point()

#log scale limit
g+geom_line()+geom_point()+scale_y_log10()
g+geom_line()+geom_point()+scale_x_log10()

ggplot(sleep,aes(x=as.numeric(ID),y=extra))+geom_line()

#multiple line
#third variable discrete
ggplot(sleep,aes(x=as.numeric(ID),y=extra,colour=group))+geom_line()
ggplot(sleep,aes(x=as.numeric(ID),y=extra,linetype=group))+geom_line()
ggplot(sleep,aes(x=as.numeric(ID),y=extra,shape=group))+geom_point()
ggplot(sleep,aes(x=as.numeric(ID),y=extra,group=group))+geom_line()

#change line andpoint features
g<-ggplot(trees,aes(x=Girth,y=Height))
g+geom_line(colour="red",linetype="dashed",size=2)+geom_point()
g+geom_line(colour="red",linetype="dashed",size=0.5)+
  geom_point(shape=22,size=3,colour="blue",fill="red")

ggplot(sleep,aes(x=as.numeric(ID),y=extra,fill=group))+geom_line()+
  geom_point(shape=21,size=2)

#area chart
dt<-data.frame(1871:1970,Nile)
names(dt)<-c("Year","Flow")

ga<-ggplot(dt,aes(x=Year,y=Flow))
ga+geom_area()

#change area features
ga+geom_area(fill="lightpink",colour="darkred")
#transparency
ga+geom_area(fill="lightpink",colour="darkred",alpha=0.2)#80% transparent
ga+geom_area(fill="lightpink",colour="darkred",alpha=0.4)#60%

#stacked area chart
Year<-rep(1960:1980,rep(4,21))
Quarter<-rep(1:4,21)
ds<-data.frame(Year,JohnsonJohnson,Quarter)
names(ds)<-c("Year","Earnings","Quarter")

ggplot(ds,aes(x=Year,y=Earnings,fill=factor(Quarter)))+geom_area(alpha=0.7)

#add confidence interval
ga+geom_line()
std<-sd(dt$Flow)

#geom_ribbon
ga+geom_ribbon(aes(ymin=Flow-std,ymax=Flow+std),alpha=0.3)+
  geom_line()

ga+geom_line()+geom_ribbon(aes(ymin=Flow-std,ymax=Flow+std),alpha=0.3)

#geom_line()
ga+geom_line(aes(y=Flow-std),linetype="dashed",colour="darkgrey")+
  geom_line(aes(y=Flow+std),linetype="dashed",colour="darkgrey")+
  geom_line()

#scatter plots##################################################
ggplot(trees,aes(x=Girth,y=Height))+geom_point()

#change features of points
ggplot(trees,aes(x=Girth,y=Height))+geom_point(shape=21,size=3)

#groups of points
#Example of Exercise bars & line Q3
ggplot(mpg,aes(x=cty,y=hwy,shape=class))+geom_point()+
  scale_shape_manual(values = 1:7)
ggplot(mpg,aes(x=cty,y=hwy,shape=class,colour=class))+geom_point()+
  scale_shape_manual(values = 1:7)

ggplot(mtcars,aes(x=drat,y=wt,shape=factor(am),colour=factor(am)))+
  geom_point()+scale_shape_manual(values = 1:2)+
  scale_colour_manual(values=c("red","black"))

#for shape 21-25, we can also change fill
ggplot(mtcars,aes(x=drat,y=wt))+
  geom_point(colour="red",fill="black",size=5,shape=21)

ggplot(mtcars,aes(x=drat,y=wt,shape=factor(am),
                  colour=factor(am),fill=factor(am)))+
  geom_point(size=4)+scale_shape_manual(values = 21:22)+
  scale_colour_manual(values=c("red","black"))+
  scale_fill_manual(values=c("black","red"))

#fit 3rd variable is continnuous
ggplot(mpg,aes(x=cty,y=hwy,size=displ))+geom_point()
ggplot(mpg,aes(x=cty,y=hwy,colour=displ))+geom_point()

ggplot(mtcars,aes(x=drat,y=wt,fill=qsec))+
  geom_point(colour="black",alpha=0.5,size=5,shape=21)

ggplot(mtcars,aes(x=drat,y=wt,size=qsec))+
  geom_point(colour="black",alpha=0.5,fill="red",shape=21)

ggplot(mtcars,aes(x=drat,y=wt,size=qsec,fill=factor(am)))+
  geom_point(colour="black",alpha=0.5,shape=21)

#make the area proportion to scale value
ggplot(mtcars,aes(x=drat,y=wt,size=qsec))+
  geom_point(colour="black",alpha=0.5,shape=21)+
  scale_size_area()

#overploting
#transparency
ggplot(diamonds,aes(x=carat,y=price))+geom_point(alpha=0.1)

#jitter
ggplot(Loblolly,aes(x=age,y=height))+geom_point()
ggplot(Loblolly,aes(x=age,y=height))+
  geom_point(position=position_jitter(width=0.3,height=0.2))

#adding fitted lines
#linear regression
ggplot(trees,aes(x=Girth,y=Height))+geom_point()+
  geom_smooth(method = lm)#default 95% confidence region
ggplot(trees,aes(x=Girth,y=Height))+geom_point()+
  geom_smooth(method = lm,level=0.99)
ggplot(trees,aes(x=Girth,y=Height))+geom_point()+
  geom_smooth(method = lm,se=FALSE)

lm(trees$Height~trees$Girth)
txt<-"italic(y)==62.031+1.054*italic(x)"

ggplot(trees,aes(x=Girth,y=Height))+geom_point()+
  geom_smooth(method = lm,level=0.99)+
  annotate("text",label=txt,x=18,y=65,parse=T)

ggplot(trees,aes(x=Girth,y=Height))+geom_point()+
  geom_smooth()#local weighted polynomial curve

#logistic regression
ggplot(mtcars,aes(x=mpg,y=am))+geom_point()+
  geom_smooth(method = glm,method.args=list(family="binomial"))

#add marginal rugs
ggplot(faithful,aes(x=eruptions,y=waiting))+geom_point()+
  geom_rug(sizze=1)

#add labels
CARS<-rownames(mtcars)
new<-data.frame(CARS,mtcars)

ggplot(new,aes(x=drat,y=wt))+geom_point()+
  geom_text(aes(label=CARS),size=3,vjust=1,hjust=-0.2)
