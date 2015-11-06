# showing a distriibution from random data
# Define a server for the Shiny app
shinyServer(function(input, output) {

    # make the histogram plot
    output$plot <- renderPlot({
        # check what kind of distro is choosen from the radio buttons
        if (input$distro == 1) {
            # calculate values for the normal distrobution
            value <- rnorm(input$n, mean = 0, sd = input$sd)
            output$inputname = renderPrint("Standard deviation:")
        }
        else if (input$distro == 2) {
            # calculate values for the uniform distrobution
            value <- runif(input$n, min = 0, max = input$sd)
            output$inputname = renderPrint("Max:")
        }
        else if (input$distro == 3) {
            # calculate values for the poisson distrobution
            value <- rpois(input$n, lambda = input$sd)
            output$inputname = renderPrint("Lambda:")
        }
        
        # finally make the histogram from these values
        hist(value)
    })
})
