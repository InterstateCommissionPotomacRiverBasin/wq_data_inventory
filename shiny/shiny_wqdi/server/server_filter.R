clean_filter_labels <- function(x) {
  y <- stringr::str_replace_all(x, "_", " ") %>% 
    stringr::str_to_title()
  
  sapply(y, function(i) {
    stringr::str_replace_all(i, " ", "_") %>% 
      stringr::str_to_lower()
  })
}

table.filter.cols <- c("none", "parameter_group", "metric_parameter",
                       "organization", "program_name", "site_location",
                       "purpose", "collection_method", "spatial_coverage",
                       "period_of_record_start_date", "period_of_record_end_date",
                       "fall_line", "lat_long", "frequency_sampled",
                       "data_type", "public_or_restricted_data",
                       "dataset_fees") %>% 
  clean_filter_labels()
#------------------------------------------------------------------------------
output$filter_col_1 <- renderUI({
  req(inventory.df)
  selectInput("filter_col_1", "Column:",
              choices = table.filter.cols,
              selected = "none")
})
#------------------------------------------------------------------------------
output$filter_select_1 <- renderUI({
  req(inventory.df)
  req(input$filter_col_1)
  selectInput("filter_select_1", "Options:",
              # c(clean_filter_labels(
              #   unique(inventory.df[, names(inventory.df) == input$filter_col_1])
              # )),
               c(unique(inventory.df[, names(inventory.df) == input$filter_col_1])),
              multiple = TRUE)
})
#------------------------------------------------------------------------------
output$filter_col_2 <- renderUI({
  req(input$filter_col_1)
  if (input$filter_col_1 != "none") {
    table.filter.cols <- table.filter.cols[!table.filter.cols %in% input$filter_col_1]
  }
  selectInput("filter_col_2", "Column:",
              choices = table.filter.cols,
              selected = "none")
})
#------------------------------------------------------------------------------
output$filter_select_2 <- renderUI({
  req(program.rec.1())
  req(input$filter_col_2)
  options.vec <- unique(program.rec.1()[, names(program.rec.1()) == input$filter_col_2])
  selectInput("filter_select_2", "Options:",
              options.vec,
              multiple = TRUE)
})
#------------------------------------------------------------------------------
output$filter_col_3 <- renderUI({
  req(input$filter_col_1)
  req(input$filter_col_2)
  if (input$filter_col_1 != "none" | input$filter_col_2 != "none") {
    table.filter.cols <- table.filter.cols[!table.filter.cols %in% c(input$filter_col_1,
                                                                     input$filter_col_2)]
  }
  selectInput("filter_col_3", "Column:",
              choices = table.filter.cols,
              selected = "none")
})
#------------------------------------------------------------------------------
output$filter_select_3 <- renderUI({
  req(program.rec.2())
  req(input$filter_col_3)
  options.vec <- unique(program.rec.2()[, names(program.rec.2()) == input$filter_col_3])
  selectInput("filter_select_3", "Options:",
              options.vec,
              multiple = TRUE)
})
#------------------------------------------------------------------------------
observeEvent(input$reset, {
  updateSelectInput(session, "filter_col_1", selected = "none")
  updateSelectInput(session, "filter_col_2", selected = "none")
  updateSelectInput(session, "filter_col_3", selected = "none")
})
#------------------------------------------------------------------------------
# output$filter.message <- renderUI({
#   req(program.rec())
#   if (nrow(program.rec()) == 0)
#     "No data available for this filtering combination."
#   else
#     ""
# })
#------------------------------------------------------------------------------
output$organization_count <- renderValueBox({
    valueBox(
      paste("Number of organizations:",
            prettyNum(length(unique(program.rec()$organization)),
                      big.mark = ",",
                      scientific = FALSE)),
      " ", 
      icon = icon("thumbs-up", lib = "glyphicon"),
      color = "blue"#, fill = TRUE
    )
  })
#------------------------------------------------------------------------------
output$program_count <- renderValueBox({
  # if (length(unique(program.rec()$program_name)) == 0) {
  #   valueBox(
  #     "Number of programs: 0", "Invalid Filter", icon = icon("thumbs-down", lib = "glyphicon"),
  #     color = "red"#, fill = TRUE
  #   )
  # } else {
    valueBox(
      paste("Programs:",
        prettyNum(length(unique(program.rec()$program_name)),
                  big.mark = ",",
                  scientific = FALSE)),
      "Count", 
      icon = icon("hashtag"),
      color = "blue"#, fill = TRUE
    )
  # }
})

