#PAN ZHANGYU P136922

#################################################################################
#Q1
library(ggplot2)
library(datasets)

data("infert")
str(infert)
#对于变量 age 和 induced，我们要创建一个新的数据框来存储频率
#计算每个 age-induced 组合的频率 Calculate the frequency of each age-induced combination
frequency <- table(infert$age, infert$induced, useNA = "ifany")
#将频率数据转换为数据框 Convert frequency data to data frame
frequency_df <- as.data.frame.table(frequency)
#重命名列名 Rename column names
names(frequency_df) <- c("age", "induced", "frequency")
#绘制分组条形图 Draw a grouped bar chart
ggplot(frequency_df, aes(x = as.factor(age), y = frequency, fill = as.factor(induced))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Age", y = "Frequency", fill = "Induced") +
  theme_minimal()

#################################################################################
#Q2
#计算每个 pcut 和 pcol 组合的比例 Calculate the ratio for each combination of pcut and pcol
proportions <- prop.table(table(diamonds$cut, diamonds$color), margin = 1)
#将比例放大100倍 Magnify the scale 100 times
proportions <- proportions * 100
#将比例数据转换为数据框 Convert scale data to data frame
proportions_df <- as.data.frame.matrix(proportions)
#添加 pcut 列 Add pcut column
proportions_df$pcut <- rownames(proportions_df)
#将数据从宽格式转换为长格式 Convert data from wide format to long format
proportions_long <- reshape2::melt(proportions_df, id.vars = "pcut")
#修改变量名称 Modify variable name
names(proportions_long) <- c("pcut", "pcol", "prop")
#创建颜色映射 Create a color map
#I used the color picker to choose the color
color_map <- c(D = "lightcoral", E = "#c49a00", F = "#53b400", G = "#00c094", H = "#00b6eb", I = "#a58aff", J = "#fb61d7")
#将 pcut 列转换为因子，并指定水平顺序
#Convert pcut column to factor and specify horizontal order
proportions_long$pcut <- factor(proportions_long$pcut, levels = c("Fair", "Good", "Very Good", "Premium", "Ideal"))
#计算每个格子的叠加之前的比例
#Calculate the proportion of each grid before superposition
proportions_long$cumulative_prop <- ave(proportions_long$prop, proportions_long$pcut, FUN = function(x) rev(cumsum(rev(x))))
#绘制堆叠条形图，并在图表中插入比例值
#Draw a stacked bar chart and insert scale values ​​in the chart
z<-proportions_long
x<-proportions_long$pcut
y<-proportions_long$prop
c<-proportions_long$pcol
cp<-proportions_long$cumulative_prop
ggplot(data=z, aes(x = x, y = y, fill = c)) +geom_bar(stat = "identity", width = 0.75) +
  #小数点保留2位,不加position = "stack"的话参数位置会错误
  geom_text(aes(label = round(cp, 2)), color = "black", position = "stack", vjust=1.5, size = 3) + 
  scale_y_continuous(name = "prop", limits = c(0, 100), breaks = seq(0, 100, by = 25)) +
  scale_fill_manual(name = "pcol", values = color_map) +
  labs(x = "pcut", y = "Proportion", fill = "Color") + #修改x轴标签
  theme_minimal()

#################################################################################
#Q3
#a
#Filter diamonds less than $5000 and less than 1 carat, and with clarity equals to "IF"
#过滤价值低于 5000 美元、重量低于 1 克拉、净度等于“IF”的钻石
a <- diamonds[diamonds$price < 5000 & diamonds$carat < 1 & diamonds$clarity == "IF", ]
#为每种颜色绘制多条线图 Plot multiple line graph for each color
color_map <- c(D = "lightcoral", E = "#c49a00", F = "#53b400", G = "#00c094", H = "#00b6eb", I = "#a58aff", J = "#fb61d7")
ggplot(a, aes(x = carat, y = price, color = color, linetype = color)) +
  geom_line() +
  labs(x = "carat", y = "price", color = "color") +
  scale_color_manual(values = color_map)+
  theme_minimal()
#b
#过滤颜色G和H的钻石，净度等于“IF” Filter diamonds with color G and H, and clarity equals to "IF"
b <- diamonds[diamonds$color %in% c("G", "H") & diamonds$clarity == "IF", ]
#绘制颜色 G 和 H 的理想和优质钻石的多线图 Plot multiple line graph for Ideal and Premium diamonds of color G and H
ggplot(b, aes(x = carat, y = price, shape = cut)) +
  geom_line(data = subset(b, cut %in% c("Ideal", "Premium")),color = "lightcoral") +
  geom_point(data = subset(b, cut %in% c("Ideal", "Premium")),size = 1) +
  labs(x = "carat", y = "price", shape = "cut", linetype = "cut") +
  scale_shape_manual(values = c("Ideal" = 16, "Premium" = 17)) +  # 设置不同形状的点
  theme_minimal()+
  xlim(0.2, 0.9) +  # 设置 x 轴的范围
  ylim(0, 5000)  # 设置 y 轴的范围

##############################################################################
# Question 1
infert
mytab<-table(infert$induced,infert$age)
#mytab[mytab==0]<-NA
mydat<-data.frame(mytab)
names(mydat)<-c("Induced","Age","Freq")
ggplot(data=mydat,aes(x=Age,y=Freq,fill=Induced))+
  geom_bar(stat="identity",position="dodge")

# Question 2
diamonds
icol<-levels(diamonds$color)
icut<-levels(diamonds$cut)
w<-function(n,icol){
  j<-n[n==icol]
  res<-length(j)/length(n)*100
  return(res)
}

iweight<-function(icut,icol,diamonds){
  n<-diamonds$color[diamonds$cut==icut]
  p<-sapply(icol, function(i) w(n,i))
  return(p)
}
prop<-do.call(c,lapply(icut,function(i) iweight(i,icol,diamonds)))
pcut<-rep(icut,rep(7,5))
pcol<-rep(icol,5)
final<-data.frame(pcut,pcol,prop)

x<-rep(1:5,rep(7,5))
y<-do.call(rbind,lapply(icut,function(i) iweight(i,icol,diamonds)))
y<-y[,7:1]
y1<-apply(y,MARGIN=1,cumsum)
y2<-as.vector(y1)
mylab<-round(y2,2) 
tab<-data.frame(x,y2,mylab)

ggplot(final,aes(x=pcut,y=prop,fill=pcol))+geom_bar(stat="identity")+
  geom_text(aes(x=x,y=y2,label=mylab),data=tab,vjust=1,size=3)+
  scale_x_discrete(limits=icut)

# Question 3
d1<-subset(diamonds,subset=(carat<=1&price<=5000&clarity=="IF"))
l1<-ggplot(d1, aes(x=carat,y=price,colour=color))
l1+geom_line()


d2<-subset(d1,subset=(color=="G"|color=="H")&(cut=="Premium"|cut=="Ideal"))
l2<-ggplot(d2, aes(x=carat,y=price,shape=cut,linetype=cut))
l2+geom_line(colour="violetred")+geom_point(colour="black")