library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Distribution example"),
    
    sidebarLayout(
        # Sidebar with a slider and number of inputs
        sidebarPanel(
            sliderInput("n",
                        "Number of data points:",
                        min = 1,  max = 5000, value = 500),
            sliderInput("sd",
                        verbatimTextOutput("inputname"),
                        min = 0.0,  max = 10.5,  value = 0.5),
            radioButtons("distro", label = h3("Sort of distribution"), 
                          choices = list("Normal" = 1, "Uniform" = 2, "Poisson" = 3),
                          selected = 1)
        ),
        
        # Show plot
        mainPanel(
            plotOutput("plot")
        )
    )
))