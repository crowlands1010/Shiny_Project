#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
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