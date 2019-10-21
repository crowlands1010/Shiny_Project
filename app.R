library(shiny)
library(datasets)

## User Interface
ui <- fluidPage(
    
    # App title ----
    titlePanel("Swiss Infant Mortality"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout( 
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Selector for variable to plot against Infant Mortality ----
            selectInput("variable", "Select a Variable:",
                        c("Fertility" = "Fertility",
                          "Agriculture" = "Agriculture",
                          "Education" = "Education",
                          "Catholic" = "Catholic")),
            
            # Input: Checkbox for whether outliers should be included ----
            checkboxInput("outliers", "Show outliers", TRUE)
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Formatted text for caption ----
            h3(textOutput("Swiss Infant Mortality Rate")),
            
            # Output: Plot of the requested variable against mpg ----
            plotOutput("swiss")
            
        )
    )
)

# Define server logic to plot various variables against Infant Mortality ----
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
             col = "darkblue",pch=19,cex=2,
             main="Swiss Infant Mortality Data",ylab="Infant Mortality")
    })
    
}

# Create Shiny app ----
shinyApp(ui, server)