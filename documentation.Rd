\name{Developing Data Products}
\alias{Swiss Data Project}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Coursera - Developing Data Products
}
\description{
This application just shows the correlation between data in the swiss dataset. 
}
\usage{
Developing Data Products: To show an understanding of the materials covered in this assignment.
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{}{
 Libraries called: shiny and datasets. 
 Shiny is used to develop the shiny app and datasets is called in order to use the swiss dataset. 
 Basic user interface was created in order to show a clean understand of materials.     
 Select Variable box was chosen because I decided to use multiple variables to show correlation. 
 Once the input is received, the output shows a correlation between that input data and the .
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

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

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~swiss }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~input }% __ONLY ONE__ keyword per line
\keyword{ ~output }% __ONLY ONE__ keyword per line
\keyword{ ~plot }% __ONLY ONE__ keyword per line
