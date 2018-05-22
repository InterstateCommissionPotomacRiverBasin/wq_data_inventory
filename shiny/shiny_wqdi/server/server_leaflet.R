
output$mymap <- leaflet::renderLeaflet({
  icprb.map <- "https://api.mapbox.com/styles/v1/skaisericprb/citvqu6qb002p2jo1ig5hnvtk/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic2thaXNlcmljcHJiIiwiYSI6ImNpa2U3cGN1dDAwMnl1cm0yMW94bWNxbDEifQ.pEG_X7fqCAowSN8Xr6rX8g"
  #validate(need(nrow(program.rec()) > 0, "No data available for this filtering combination."))
  leaflet::leaflet(options = leaflet::leafletOptions(maxBoundsViscosity = 1)) %>%
    leaflet::addTiles(urlTemplate = icprb.map, options = leaflet::tileOptions(minZoom = 8, maxZoom = 18)) %>%
    # leaflet::addTiles(options = leaflet::tileOptions(minZoom = 7, maxZoom = 18)) %>% 
    leaflet::setMaxBounds(lng1 = -81, lat1 = 37.75, lng2 = -75, lat2 = 40.50) %>%
    leaflet::setView(-78.110291, lat = 39.029230, zoom = 8) 
}) # End output$MAP
#------------------------------------------------------------------------------
hyperlink_ifelse <- function(spec.column) {
  if_else(spec.column == "Unavailable", spec.column, 
          paste('<a href =', spec.column,'target="_blank"> Click Here </a>'))
}
#------------------------------------------------------------------------------
observeEvent(c(input$filter_select_1, input$filter_select_2, input$filter_select_3), {
#  observeEvent(program.rec(), {
#observe({
  #req(program.rec())
  #validate(need(nrow(program.rec()) > 0, "No data available for this filtering combination."))
  inv.df <- program.rec() %>% 
    filter(lat != "Unavailable",
           long != "Unavailable")
  if (nrow(inv.df) == 0) {
    leafletProxy("mymap") %>%
      clearMarkerClusters() %>%
      clearMarkers()
  } else {
    leafletProxy("mymap", data = inv.df) %>%
      clearMarkerClusters() %>%
      clearMarkers() %>%
      leaflet::addCircleMarkers(lng = inv.df$long, lat = inv.df$lat,
                                stroke = FALSE,
                                color = "#3C8DBC",
                                fillOpacity = 0.75,
                                radius = 5,
                          #clusterOptions = leaflet::markerClusterOptions(),
                          label = ~as.character(station_id),
                          popup = paste("<strong>Monitoring Station:</strong>", program.rec()$source_no, "<br/>",
                                        "<strong>Agency:</strong>", program.rec()$source, "<br/>",
                                        "<strong>Site Location:</strong>", program.rec()$site_location, "<br/>",
                                        #"<strong>Watershed:</strong>", program.rec()$LATITUDE, "<br/>",
                                        "<strong>Purpose:</strong>", program.rec()$purpose, "<br/>",
                                        "<strong>Contact:</strong>", program.rec()$contact_name, "<br/>",
                                        "<strong>Website:</strong>", hyperlink_ifelse(program.rec()$program_website), "<br/>",
                                        "<strong>Data Link:</strong>", hyperlink_ifelse(program.rec()$data_link))#,
                          #icon = icons(iconWidth = 10, iconHeight = 25)
      )
  }
 
#})
}, ignoreNULL = FALSE, ignoreInit = FALSE, priority = 2)
#------------------------------------------------------------------------------
  # output$map.point.count <- renderUI({
  #   req(program.rec())
  #   paste(
  #     "Number of points:",
  #     prettyNum(nrow(program.rec()),
  #               big.mark = ",",
  #               scientific = FALSE)
  #   )
  #   
  # })