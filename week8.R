# install.packages("")
library(ggplot2)
library(gganimate)
library(gapminder)
library(gifski)

#static
ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, size=pop, colour=country))+
  geom_point(alpha=0.7)+
  scale_x_log10()+guides(colour=FALSE, size=FALSE)+
  labs(x="GDP per capital", y="Life Expectancy")
#animate
ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, size=pop, colour=country))+
  geom_point(alpha=0.7)+
  scale_x_log10()+guides(colour=FALSE, size=FALSE)+
  labs(x="GDP per capital", y="Life Expectancy")+
  facet_wrap(~continent)+
  transition_time(year)
#add labels
ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, size=pop, colour=country))+
  geom_point(alpha=0.7)+
  scale_x_log10()+guides(colour=FALSE, size=FALSE)+
  labs(x="GDP per capital", y="Life Expectancy",title = "Year:{frame_time}")+
  transition_time(year)
#view follow
ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, size=pop, colour=country))+
  geom_point(alpha=0.7)+
  scale_x_log10()+guides(colour=FALSE, size=FALSE)+
  labs(x="GDP per capital", y="Life Expectancy",title = "Year:{frame_time}")+
  transition_time(year)+
  view_follow()#(fixed_y=TRUE)在括号里，y轴不变
#点像蝌蚪一样跑
ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, size=pop, colour=country))+
  geom_point(alpha=0.7)+
  scale_x_log10()+guides(colour=FALSE, size=FALSE)+
  labs(x="GDP per capital", y="Life Expectancy",title = "Year:{frame_time}")+
  transition_time(year)+
  shadow_wake(wake_length = 0.1)
#
ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, size=pop, colour=country))+
  geom_point(alpha=0.7)+
  scale_x_log10()+guides(colour=FALSE, size=FALSE)+
  labs(x="GDP per capital", y="Life Expectancy",title = "Year:{frame_time}")+
  transition_time(year)+
  shadow_mark(alpha = 0.3, size = 0.5)

# change data 
head(airquality)

ggplot(airquality,aes(x=Day, y=Temp, group=Month, colour=factor(Month)))+
  geom_line()+labs(x="Day of Month", y="Temperature")+
  theme(legend.position = "top")
#会动的折线图
ggplot(airquality,aes(x=Day, y=Temp, group=Month, colour=factor(Month)))+
  geom_line()+labs(x="Day of Month", y="Temperature")+
  theme(legend.position = "top")+
  transition_reveal(Day)
#开头带点
ggplot(airquality,aes(x=Day, y=Temp, group=Month, colour=factor(Month)))+
  geom_line()+labs(x="Day of Month", y="Temperature")+
  theme(legend.position = "top")+geom_point()+
  transition_reveal(Day)
#路过的都标点
ggplot(airquality,aes(x=Day, y=Temp, group=Month, colour=factor(Month)))+
  geom_line()+labs(x="Day of Month", y="Temperature")+
  theme(legend.position = "top")+
  geom_point(aes(group=seq_along(Day)))+
  transition_reveal(Day)

##
#An example of dual-axis plot
set.seed(1)
x<-1:100
var1<-cumsum(rnorm(100,0,1))
var2<-var1^2
data<-data.frame(x,var1,var2)
head(data)

ggplot(data, aes(x=x))+
  geom_line(aes(y=var1), colour="red")+
  geom_line(aes(y=var2/10), colour="blue")+
  labs(y="Var 1",colour = "Var")+
  scale_y_continuous(sec.axis = sec_axis(~.*10, name="Var 2"))
#animate
ggplot(data, aes(x=x))+
  geom_line(aes(y=var1), colour="red")+
  geom_line(aes(y=var2/10), colour="blue")+
  labs(y="Var 1",colour = "Var")+
  scale_y_continuous(sec.axis = sec_axis(~.*10, name="Var 2"))+
  transition_reveal(x)


##
air<-data.frame(airquality$Temp, airquality$Month)
mean.temp<-aggregate(air, by=list(air$airquality.Month),FUN = mean)
names(mean.temp)<-c("Group","Temp","Month")

#static
ggplot(mean.temp, aes(x=Month, y=Temp, fill=Temp))+
  geom_bar(stat="identity")
#animate
ggplot(mean.temp, aes(x=Month, y=Temp, fill=Temp))+
  geom_bar(stat="identity")+
  transition_states(Month)
#
ggplot(mean.temp, aes(x=Month, y=Temp, fill=Temp))+
  geom_bar(stat="identity")+
  transition_states(Month)+
  shadow_mark()

#
ggplot(data=mpg)+
  geom_bar(aes(x=class))+
  transition_states(class)+
  shadow_mark()

ggplot(data=mpg)+
  geom_bar(aes(x=class))+
  transition_states(class)+
  shadow_mark()+
  labs(title = "Class:{closest_state}")


#######
#
library(ggplot2)
library(plotly)

#plot_ly function provides direct interface to plotly.js
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length) %>%
  add_markers(alpha=0.5)

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length) %>%
  add_markers(symbol=I(1))

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, symbol = ~Species) %>%
  add_markers(symbols=1:3)

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species) %>%
  add_markers(colors=c("red","green","blue"))

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species,
        colors=c("red","green","blue"), symbol = ~Species,symbols = 1:3)

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, z = ~Sepal.Width,
        color=~Species, colors = c("red","green","blue"))

#lines
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length) %>% add_lines()
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length) %>% add_paths()
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, linetype = ~Species) %>% 
  add_lines()


#
dt<-data.frame(1871:1970, Nile)
names(dt)<-c("Year","Flow")

m<-lm(Flow~Year, data=dt)
dnew<-data.frame(dt, m$fitted.values)
names(dnew)<-c("Year","Flow","Fitted")
std<-sd(dt$Flow)

plot_ly(data=dnew, x=~Year) %>%
  add_markers(y=~Flow,color=I("skyblue")) %>%
  add_lines(y=~Fitted,color=I("darkblue")) %>%
  add_ribbons(ymin = ~Fitted-std,ymax = ~Fitted+std, color=I("grey"))

#maps
library(maps)
world<-map_data("world")
world %>% group_by(group) %>% plot_ly(x=~long,y=~lat)

library(tmap)
library(sf)
library(leaflet)
library(terra)
selangor<-st_read("D:/学校/出国/课程/STQD6124 Data Visualization & Communication/week7/Selangor.shp")
map_selangor<-tm_shape(selangor)+tm_polygons()
map_selangor
tmap_mode("view")
map_selangor + tm_basemap(server = "OpenTopoMap")

#bae
plot_ly(diamonds,x=~price) %>% add_histogram()

x<-1:5
y<-round(runif(5,1,10))
z<-data.frame(x,y)

plot_ly(z,x=~x,y=~y) %>% add_bars()

plot_ly(diamonds,x=~color,color=~cut) %>% add_histogram()
plot_ly(diamonds,x=~color,color=~cut) %>% add_histogram() %>%
  layout(barmode="stack")

#multiple plots
subplot(
  plot_ly(diamonds,x=~color,color=~cut) %>% add_histogram(name="cut"),
  plot_ly(diamonds,x=~color,color=~clarity) %>% add_histogram(name="clarity"),
  plot_ly(diamonds,x=~color,color=~color) %>% add_histogram(name="color")
)

#boxplot
plot_ly(diamonds,x=~color,color=~cut) %>% add_boxplot()

plot_ly(diamonds,x=~interaction(color,cut),y=~price) %>% add_boxplot(color=~cut)

plot_ly(diamonds,x=~interaction(color,cut),y=~price) %>% add_boxplot(color=~color)

#heatmap
Year<-rep(1960:1980, rep(4,21))
Quarter<-rep(1:4,21)
ds<-data.frame(Year, as.numeric(JohnsonJohnson),Quarter)
names(ds)<-c("Year","Earnings","Quarter")
plot_ly(data=ds,x=~Year,y=~Quarter,z=~Earnings) %>% add_heatmap()

#axes
f<-list(family="Courier New",size=18, color="navy")
x1<-list(title="Year",titlefont=f)
y1<-list(title="Quarter",titlefont=f)
plot_ly(data=ds,x=~Year,y=~Quarter,z=~Earnings) %>% add_heatmap() %>%
  layout(title="Heatmap for JohnsonJohnson Projects",xaxis=x1,yaxis=y1)

#legends
l<-list(font=list(family="sans-serif",size=12,color="plum"),
        bgcolor="ivory",bordercolor="purple",boderwidth=2,orientation="h")

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length) %>%
  add_markers(color=~Species,colors=c("red","green","blue"),
              symbol=~Species,symbols=I(3:5)) %>% layout(legend=1)

#hoverlabel - customize
#hoverinfo - information that appears
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
        text = ~paste('Species:',Species)) %>%
  add_markers(color=~Species,colors=c("red","green","blue"),
              symbol=~Species,symbols=I(3:5)) %>% layout(legend=1,
              hoverlabel=list(bgcolor="khaki",bordercolor="chocolate",
                              font=list(family="Arial",color="chocolate")))

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
        text = ~paste('Species:',Species)) %>%
  add_markers(color=~Species,colors=c("red","green","blue"),
              symbol=~Species,symbols=I(3:5)) %>% layout(dragmode="lasso")

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
        text = ~paste('Species:',Species)) %>%
  add_markers(color=~Species,colors=c("red","green","blue"),
              symbol=~Species,symbols=I(3:5)) %>% layout(dragmode="pan")

#
gf<-ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+facet_wrap(~class)
ggplotly(gf)

###修复尝试
# 生成图形并在浏览器中查看
# 安装并加载必要的包
library(plotly)
library(htmlwidgets)

# 生成 plotly 图形
p <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, type = 'scatter', mode = 'markers')

# 获取当前工作目录并生成完整路径
file_path <- file.path(getwd(), "plotly_plot.html")

# 保存为 HTML 文件到当前工作目录
htmlwidgets::saveWidget(as_widget(p), file_path)

# 打印文件路径，确认是否正确
print(file_path)

#Windows 10：
#打开“设置”（Windows键 + I）。
#选择“应用”。
#在左侧菜单中选择“默认应用”。
#在右侧的“Web 浏览器”下，选择你想要设置为默认的浏览器。

# 使用 shell.exec 打开 HTML 文件（针对 Windows）
shell.exec(file_path)

##########################################################
# 使用 ggplot2 生成图形
library(ggplot2)
p <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + geom_point()

# 将 ggplot2 图形转换为交互式图形
library(plotly)
ggplotly(p)

# 检查包依赖项
sessionInfo()

# 设置 RStudio 默认的图形设备
options(device = "RStudio")

# 初始化绘图设备
png()
# 执行 ggplotly 函数
ggplotly(p)
# 关闭绘图设备
dev.off()
# 检查设备设置
dev.list()
