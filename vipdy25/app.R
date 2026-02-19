#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Dataanalyse 2026", title = div(img(height = 100, width = 125, src = "dania.png"))),
    
    theme = shinytheme("cosmo"),
    
    headerPanel("Det her er vores web app"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 100,
                        value = 30),
            numericInput("sel_day",
                         "Select a number to return a day",
                         min = "1",
                         max = "7",
                         value = "1")
        ),

        # Show a plot of the generated distribution
        mainPanel(
          
          tabsetPanel(id = "tabs",
                      
                      tabPanel("Ugedag",
                               uiOutput("day")),
                      
                      tabPanel("Hej",
                               plotOutput("distPlot")
                               ),
                      tabPanel("Hej igen"))
          
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$day <- renderUI({
    
    library(bslib)
    library(bsicons)
    
    bslib::value_box(title = "Den valgte dag er:",
                     value = input$sel_day,
                     showcase = bs_icon("bank2"),
                     theme = "bg-danger")
    
  }) 
  

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
