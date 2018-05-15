# Plot the Site on the map.
test <- function(input, output, session) {
  output$mymap <- leaflet::renderLeaflet({
    icprb.map <- "https://api.mapbox.com/styles/v1/skaisericprb/cizok18ny00302spia5zhre3o/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic2thaXNlcmljcHJiIiwiYSI6ImNpa2U3cGN1dDAwMnl1cm0yMW94bWNxbDEifQ.pEG_X7fqCAowSN8Xr6rX8g"
    leaflet::leaflet() %>%
      leaflet::addTiles(urlTemplate = icprb.map, options = tileOptions(minZoom = 7, maxZoom = 18)) %>%
      leaflet::setMaxBounds(lng1 = -90, lat1 = 34, lng2 = -64, lat2 = 45) %>%
      leaflet::setView(lng = -78.110291, lat = 39.029230, zoom = 7)
  }) # End output$MAP
}

