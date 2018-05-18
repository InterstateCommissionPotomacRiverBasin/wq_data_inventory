col.vec <- c("source", "site_location", "purpose", "coverage_description",
              "period_of_record_start_date", "period_of_record_end_date",
              "parameter_group")
#------------------------------------------------------------------------------
output$filter.col.1 <- renderUI({
  req(inventory.df)
  selectInput("filter.col.1", "Column:",
              c("None", col.vec),
              selected = "None")
})
#------------------------------------------------------------------------------
output$filter.select.1 <- renderUI({
  req(inventory.df)
  req(input$filter.col.1)
  selectInput("filter.select.1", "Options:",
              c(unique(inventory.df[, names(inventory.df) == input$filter.col.1])),
              multiple = TRUE)
})
#------------------------------------------------------------------------------
output$filter.col.2 <- renderUI({
  req(input$filter.col.1)
  if (input$filter.col.1 != "None") {
    col.vec <- col.vec[!col.vec %in% input$filter.col.1]
  }
  selectInput("filter.col.2", "Column:",
              c("None", col.vec),
              selected = "None")
})
#------------------------------------------------------------------------------
output$filter.select.2 <- renderUI({
  req(inventory.rec.1())
  req(input$filter.col.2)
  options.vec <- unique(inventory.rec.1()[, names(inventory.rec.1()) == input$filter.col.2])
  selectInput("filter.select.2", "Options:",
              options.vec,
              multiple = TRUE)
})
#------------------------------------------------------------------------------
output$filter.col.3 <- renderUI({
  req(input$filter.col.1)
  req(input$filter.col.2)
  if (input$filter.col.1 != "None" | input$filter.col.2 != "None") {
    col.vec <- col.vec[!col.vec %in% c(input$filter.col.1, input$filter.col.2)]
  }
  selectInput("filter.col.3", "Column:",
              c("None", col.vec),
              selected = "None")
})
#------------------------------------------------------------------------------
output$filter.select.3 <- renderUI({
  req(inventory.rec.2())
  req(input$filter.col.3)
  options.vec <- unique(inventory.rec.2()[, names(inventory.rec.2()) == input$filter.col.3])
  selectInput("filter.select.3", "Options:",
              options.vec,
              multiple = TRUE)
})
#------------------------------------------------------------------------------
observeEvent(input$reset, {
  updateSelectInput(session, "filter.col.1", selected = "None")
  updateSelectInput(session, "filter.col.2", selected = "None")
  updateSelectInput(session, "filter.col.3", selected = "None")
})
#------------------------------------------------------------------------------
# output$filter.message <- renderUI({
#   req(inventory.rec())
#   if (nrow(inventory.rec()) == 0)
#     "No data available for this filtering combination."
#   else
#     ""
# })
#------------------------------------------------------------------------------
output$approvalBox <- renderValueBox({
  if (nrow(inventory.rec()) == 0) {
    valueBox(
      "Number of points: 0", "Invalid Filter", icon = icon("thumbs-down", lib = "glyphicon"),
      color = "red"#, fill = TRUE
    )
  } else {
    valueBox(
      paste("Number of points:",
        prettyNum(nrow(inventory.rec()),
                  big.mark = ",",
                  scientific = FALSE)),
      "Valid Filter", 
      icon = icon("thumbs-up", lib = "glyphicon"),
      color = "blue"#, fill = TRUE
    )
  }
})

