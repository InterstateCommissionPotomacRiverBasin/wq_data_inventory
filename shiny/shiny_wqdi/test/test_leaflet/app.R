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
      selectInput("param.select", "Parameter:",
                  c("All", unique(inventory.df$metric_parameter)),
                  selected = "All")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      leaflet::leafletOutput("mymap", height = 600, width = "100%")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  data.df <- reactive({
    req(inventory.df)
    if (input$param.select == "All") {
      inventory.df
    } else {
      filter(inventory.df, metric_parameter == input$param.select)
    }
    
  })
  
  output$mymap <- leaflet::renderLeaflet({
    leaflet::leaflet(options = leaflet::leafletOptions(maxBoundsViscosity = 1)) %>%
      leaflet::addTiles(options = leaflet::tileOptions(minZoom = 7, maxZoom = 18)) %>% 
      leaflet::setMaxBounds(lng1 = -81, lat1 = 37.75, lng2 = -75, lat2 = 40.25) %>%
      leaflet::setView(-78.110291, lat = 39.029230, zoom = 8) 
  }) # End output$MAP
  
  hyperlink_ifelse <- function(spec.column) {
    if_else(spec.column == "Unavailable", spec.column, 
            paste('<a href =', spec.column,'target="_blank"> Click Here </a>'))
  }
  
  observe({
    leafletProxy("mymap", data = data.df()) %>%
      clearMarkerClusters() %>%
      clearMarkers() %>% 
      leaflet::addMarkers(~long, ~lat,
                          clusterOptions = leaflet::markerClusterOptions(),
                          label = ~as.character(source_no),
                          popup = paste("<strong>Monitoring Station:</strong>", data.df()$source_no, "<br/>",
                                        "<strong>Agency:</strong>", data.df()$source, "<br/>",
                                        "<strong>Site Location:</strong>", data.df()$site_location, "<br/>",
                                        #"<strong>Watershed:</strong>", data.df()$LATITUDE, "<br/>",
                                        "<strong>Purpose:</strong>", data.df()$purpose, "<br/>",
                                        "<strong>Contact:</strong>", data.df()$contact_name, "<br/>",
                                        "<strong>Website:</strong>", hyperlink_ifelse(data.df()$program_website), "<br/>",
                                        "<strong>Data Link:</strong>", hyperlink_ifelse(data.df()$data_link)),
                          options = markerOptions(
                            riseOnHover = TRUE
                          ),
                          icon = icons(iconWidth = 10, iconHeight = 25)
                          
      )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

