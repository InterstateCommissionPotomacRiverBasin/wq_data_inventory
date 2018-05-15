output$mymap <- leaflet::renderLeaflet({
  #validate(need(nrow(inventory.rec()) > 0, "No data available for this filtering combination."))
  leaflet::leaflet(options = leaflet::leafletOptions(maxBoundsViscosity = 1)) %>%
    leaflet::addTiles(options = leaflet::tileOptions(minZoom = 7, maxZoom = 18)) %>% 
    leaflet::setMaxBounds(lng1 = -81, lat1 = 37.75, lng2 = -75, lat2 = 40.50) %>%
    leaflet::setView(-78.110291, lat = 39.029230, zoom = 8) 
}) # End output$MAP

hyperlink_ifelse <- function(spec.column) {
  if_else(spec.column == "Unavailable", spec.column, 
          paste('<a href =', spec.column,'target="_blank"> Click Here </a>'))
}

#observeEvent(c(input$param.select.1, input$param.select.2, input$param.select.3), {
observe({
  #req(inventory.rec())
  #validate(need(nrow(inventory.rec()) > 0, "No data available for this filtering combination."))
  inventory.df <- inventory.rec()
  if (nrow(inventory.df) == 0) {
    leafletProxy("mymap") %>%
      clearMarkerClusters() %>%
      clearMarkers()
  } else {
    leafletProxy("mymap", data = inventory.rec()) %>%
      clearMarkerClusters() %>%
      clearMarkers() %>%
      leaflet::addMarkers(lng = inventory.rec()$long, lat = inventory.rec()$lat,
                          clusterOptions = leaflet::markerClusterOptions(),
                          label = ~as.character(source_no),
                          popup = paste("<strong>Monitoring Station:</strong>", inventory.rec()$source_no, "<br/>",
                                        "<strong>Agency:</strong>", inventory.rec()$source, "<br/>",
                                        "<strong>Site Location:</strong>", inventory.rec()$site_location, "<br/>",
                                        #"<strong>Watershed:</strong>", inventory.rec()$LATITUDE, "<br/>",
                                        "<strong>Purpose:</strong>", inventory.rec()$purpose, "<br/>",
                                        "<strong>Contact:</strong>", inventory.rec()$contact_name, "<br/>",
                                        "<strong>Website:</strong>", hyperlink_ifelse(inventory.rec()$program_website), "<br/>",
                                        "<strong>Data Link:</strong>", hyperlink_ifelse(inventory.rec()$data_link)),
                          options = markerOptions(
                            riseOnHover = TRUE
                          ),
                          icon = icons(iconWidth = 10, iconHeight = 25)
      )
  }
 
})
#}, ignoreNULL = FALSE, ignoreInit = FALSE, priority = 1)