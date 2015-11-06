library(shiny)
library(ggplot2)
data(diamonds)

fit= lm(price ~ carat, data = diamonds)
slope<-coef(fit)[2]
names(slope)<- "US$ Dollars"

CaratPrice <- function(carat) {0.77134*(carat*slope + coef(fit)[1])}


shinyServer(
    function(input, output) {

        caratval <- reactive({
            isolate({
            paste(input$carat, CaratPrice(input$carat))
            })
        })

        output$inputValue <- renderPrint({input$carat})
        output$prediction <- renderPrint({CaratPrice(input$carat)})
        
        #output$test <- renderText({
        #    c <- caratval()
        #    summary(c)
        #})
        
        # make the linear regression plot
        output$plot <- renderPlot({
            c <- data.frame(caratval())
            g <- ggplot(diamonds, aes(carat,price)) + 
                geom_point(alpha=0.1) + 
                geom_smooth(method="lm") #+
               # geom_point(aes(x=c,y=0, color="red", size=4))
            g
        })
    }
)
