# Module UI function
leaflet_output <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    tags$style(type="text/css",
               "#mymap.recalculating { opacity: 1.0; }"),
    shinycssloaders::withSpinner(
      leaflet::leafletOutput(ns("mymap"),
                             height = "600px",#"80vh",
                             width = "100%"),
      type = 6
    )
  )
  
}

# Module Server function
leaflet_plot <- function(input, output, session, data.df, param.1) {
  ns <- NS("leaflet")
  
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
  
  observeEvent(param.1, {
    req(data.df())
    validate(need(nrow(data.df()) > 0, "No data available for this filtering combination."))
    
    leafletProxy("mymap", data = data.df()) %>%
      clearMarkerClusters() %>%
      clearMarkers() %>%
  leaflet::addMarkers(lng = data.df()$long, lat = data.df()$lat,
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
  }, ignoreNULL = FALSE, ignoreInit = FALSE, priority = 1)
}
