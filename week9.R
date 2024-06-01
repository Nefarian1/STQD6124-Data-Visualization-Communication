library(shiny)
runApp("shiny")
runExample("04_mpg")
runApp("shiny",display.mode="showcase")

##
# 查看单个包的位置
find.package("shiny")
# 打开"D:/RSTUDIO/R/R-4.4.0/library/shiny/try/app.R"
# 输入代码,在那个新的R文件里面可以点右上角运行
# runApp('D:/RSTUDIO/R/R-4.4.0/library/shiny/try')
ui<-fluidPage(
  titlePanel("My First Shiny App"),
  sidebarLayout(position = "right",
                sidebarPanel("This is a side bar."),
                mainPanel("This is the main part."))
)
server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)


##
ui<-fluidPage(
  titlePanel("Mulan"),
  mainPanel(
    p("Let's get down to business, to defeat the Huns"),
    p("Did they sent me daughters, when I asked for sons?"),
    p("You're the saddest bunch I've ever met", style="font-family:'arial'"),
    p(code("But you can bet before we're through")),
    div("Mister, I'll make a man out of you.", style="color:red"),
    br(),
    p("AAA"),
    p("You are a", span("BBB", style="color:red"),"BABA"),
    p(strong("CCC", style="color:red"))
  )
)

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)
##

#"D:/RSTUDIO/R/R-4.4.0/library/shiny/www"
#存喜欢的图或者音乐视频进去
#app.R和www不是同一个文件夹
ui<-fluidPage(
  titlePanel("Mulan"),
  mainPanel(
    p("Let's get down to business, to defeat the Huns"),
    p("Did they sent me daughters, when I asked for sons?"),
    p("You're the saddest bunch I've ever met", style="font-family:'arial'"),
    p(code("But you can bet before we're through")),
    div("Mister, I'll make a man out of you.", style="color:red"),
    br(),
    p("AAA"),
    p("You are a", span("BBB", style="color:red"),"BABA"),
    p(strong("CCC", style="color:red")),
    img(src="mulan.jpg"),
    tags$audio(src="mulan.mp3",type="audio/mp3",autoplay=NA, controls=NA)
  )
)

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)

##
ui<-fluidPage(
  titlePanel("Widgets"),
  sidebarLayout(
    sidebarPanel(#put widgets in side bar panel 
      h3("Buttons"), #title of widget
      br(),
      br(),
      actionButton("button","Button 1"),
      br(),
      br(),
      submitButton("Submit")),
      mainPanel()
))

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)

##
ui<-fluidPage(
  titlePanel("Widgets"),
  fluidRow(
    column(3,h3("Checkbox"),
           checkboxInput("check 1","Chocolate",value=T),
           checkboxInput("check 2","Strawberry"),
           checkboxInput("check 3","Vanilla")),
    column(3,
           checkboxGroupInput("checks",h3("Another Checkbox"),
                              choices = list("KFC"=1,"McD"=2,"Texas Chicken"=3),
                              selected = 1))
   )
  )

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)

##
ui<-fluidPage(
  titlePanel("Widgets"),
  fluidRow(
    column(3,h3("Checkbox"),
           checkboxInput("check 1","Chocolate",value=T),
           checkboxInput("check 2","Strawberry"),
           checkboxInput("check 3","Vanilla")),
    column(3,
           checkboxGroupInput("checks",h3("Another Checkbox"),
                              choices = list("KFC"=1,"McD"=2,"Texas Chicken"=3),
                              selected = 1))),
  fluidRow(
    column(5,dateInput("date",h3("Insert a Date"),value="2024-05-23")),
    
    column(5,dateInput("date",h3("Insert a Range of Dates")))),
  
  fluidRow(
    column(4,fileInput("file",h3("Upload File"))),
    column(4,numericInput("number",h3("Insert a number"),value=30)),
    column(4,textInput("text",h3("Insert your name"),value="My name..."))),
  
  fluidRow(
    column(4,radioButtons("radio",h3("Choose"),
                          choices = list("Horror"=1,"Action"=2,"Comedy"=3),selected = 2)),
    column(4,selectInput("select",h3("Select"),
                          choices = list("R","Python","Java"),selected = "R")),
    column(4,sliderInput("slider",h3("Choose a range"),min=0,max=50,value=c(3,30)))
  )
)

server<-function(input,output){
  
}

shinyApp(ui=ui,server = server)

##
ui<-fluidPage(
  titlePanel("Examples"),
  sidebarLayout(
    sidebarPanel(fluidRow(
      column(7,radioButtons("radio",h3("Choose"),
                            choices = list("Horror","Action","Comedy"),selected = "Horror")),
      column(7,selectInput("select",h3("Select"),
                           choices = list("R","Python","Java"),selected = "R")),
      column(7,sliderInput("slider",h3("Choose a range"),min=0,max=50,value=c(3,30)))
    )),
    
    mainPanel(
      textOutput("myradio"),
      textOutput("myselect"),
      textOutput("myslider")
    )
  )
)

server<-function(input,output){
  output$myradio<-renderText({
    paste("You have selected a",input$radio,"as your choice of movie genre.")
  })
  output$myselect<-renderText({
    paste("You have chosen to continue with",input$select,"programming.")
  })
  output$myslider<-renderText({
    paste("Your range is between",input$slider[1],"and",input$slider[2])
  })
}

shinyApp(ui=ui,server = server)


##Other out put functions:
#imageOutput(),plotOutput(),dataTableOutput()

##Other render function:
#renderImage(),renderPlot(),renderDataTable(),renderTable(),renderPlotly(),renderUI()



