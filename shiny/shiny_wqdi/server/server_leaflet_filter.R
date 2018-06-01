leaflet.filter.cols <- c("huc12", "stream_name", "county", "states")
#------------------------------------------------------------------------------
output$filter_leaflet_col_1 <- renderUI({
  req(map.df)
  selectInput("filter_leaflet_col_1", "Column:",
              c("None",  leaflet.filter.cols),
              selected = "None")
})
#------------------------------------------------------------------------------
output$filter_leaflet_select_1 <- renderUI({
  req(map.df)
  req(input$filter_leaflet_col_1)
  selectInput("filter_leaflet_select_1", "Options:",
              unique(map.df[, names(map.df) == input$filter_leaflet_col_1]),
              multiple = TRUE)
})
#------------------------------------------------------------------------------
output$filter_leaflet_col_2 <- renderUI({
  req(input$filter_leaflet_col_1)
  if (input$filter_leaflet_col_1 != "None") {
    leaflet.filter.cols <- leaflet.filter.cols[!leaflet.filter.cols %in% input$filter_leaflet_col_1]
  }
  selectInput("filter_leaflet_col_2", "Column:",
              c("None", leaflet.filter.cols),
              selected = "None")
})
#------------------------------------------------------------------------------
output$filter_leaflet_select_2 <- renderUI({
  req(map.rec.1())
  req(input$filter_leaflet_col_2)
  options.vec <- unique(map.rec.1()[, names(map.rec.1()) == input$filter_leaflet_col_2])
  selectInput("filter_leaflet_select_2", "Options:",
              options.vec,
              multiple = TRUE)
})
#------------------------------------------------------------------------------
output$filter_leaflet_col_3 <- renderUI({
  req(input$filter_leaflet_col_1)
  req(input$filter_leaflet_col_2)
  if (input$filter_leaflet_col_1 != "None" | input$filter_leaflet_col_2 != "None") {
    leaflet.filter.cols <- leaflet.filter.cols[!leaflet.filter.cols %in% c(input$filter_leaflet_col_1,
                                                                     input$filter_leaflet_col_2)]
  }
  selectInput("filter_leaflet_col_3", "Column:",
              c("None", leaflet.filter.cols),
              selected = "None")
})
#------------------------------------------------------------------------------
output$filter_leaflet_select_3 <- renderUI({
  req(map.rec.2())
  req(input$filter_leaflet_col_3)
  options.vec <- unique(map.rec.2()[, names(map.rec.2()) == input$filter_leaflet_col_3])
  selectInput("filter_leaflet_select_3", "Options:",
              options.vec,
              multiple = TRUE)
})
#------------------------------------------------------------------------------
observeEvent(input$reset_leaflet_filter, {
  updateSelectInput(session, "filter_leaflet_col_1", selected = "None")
  updateSelectInput(session, "filter_leaflet_col_2", selected = "None")
  updateSelectInput(session, "filter_leaflet_col_3", selected = "None")
})
#------------------------------------------------------------------------------
output$leaflet_point_count <- renderValueBox({
  valueBox(
    paste("Points:",
          prettyNum(nrow(map.rec()),
                    big.mark = ",",
                    scientific = FALSE)),
    "Count", 
    icon = icon("hashtag"),
    color = "blue"#, fill = TRUE
  )
  # }
})

