#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        h3("Primary Filter"),
        uiOutput("filter_col_1"),
        h3("Secondary Filter"),
        uiOutput("filter_select_1"),
        actionButton("reset", "Reset Filter"),
        conditionalPanel('input.filter_select_1 > 0',
          "IT WORKED!!!"
        )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         "test"
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
   
  output$filter_col_1 <- renderUI({
    req(inventory.df)
    selectInput("filter_col_1", "Column:",
                c("None", unique(names(inventory.df))),
                selected = "None")
  })
  #------------------------------------------------------------------------------
  output$filter_select_1 <- renderUI({
    req(inventory.df)
    req(input$filter_col_1)
    selectInput("filter_select_1", "Parameter:",
                c(unique(inventory.df[, names(inventory.df) == input$filter_col_1])),
                #selected = "All",
                multiple = TRUE)
  })
  observeEvent(input$reset,{
               updateSelectInput(session, "filter_col_1", selected = "None")
               })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

