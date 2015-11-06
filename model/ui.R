library(shiny)

shinyUI(basicPage(
    headerPanel("Model"),
    sliderInput("speed",label="Speed",min=0,max=25,value=15),
    dataTableOutput("model")
))
