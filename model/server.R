library(shiny)

shinyServer(function(input,output) {
    
    predictModel <- reactive({
        a <- lm(dist ~ speed,data=cars)
        
        predict(a,data.frame(speed = c(1,input$speed,25)))
    })
    
    output$model <- renderDataTable({
        print(predictModel())    
        d = data.frame(mile = as.vector(predictModel()))
        d
    }) 
})