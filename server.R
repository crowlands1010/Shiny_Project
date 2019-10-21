#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    # Compute the formula text ----
    # This is a reactive formula 
    formulaText <- reactive({
        paste("Infant.Mortality ~ ", input$variable)
    })
    
    # Return the formula text for printing as a caption ----
    output$caption <- renderText({
        formulaText()
    })
    
    # Generate a plot of the requested variable against infant mortality ----
    # and only exclude outliers if requested
    output$swiss <- renderPlot({
        plot(as.formula(formulaText()),
             data = swiss,
             col = "darkgreen",pch=19,cex=1,
             main="Swiss Infant Mortality Data",ylab="Infant Mortality")
    })
    
}


