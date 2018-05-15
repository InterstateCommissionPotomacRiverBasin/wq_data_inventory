server <- function(input, output, session) {
  #------------------------------------------------------------------------------
  output$param.col.1 <- renderUI({
    req(inventory.df)
    selectInput("param.col.1", "Column:",
                c("None", unique(names(inventory.df))),
                selected = "None")
  })
  #------------------------------------------------------------------------------
  output$param.select.1 <- renderUI({
    req(inventory.df)
    req(input$param.col.1)
    selectInput("param.select.1", "Parameter:",
                c("All", unique(inventory.df[, names(inventory.df) == input$param.col.1])),
                selected = "All")
  })
  #------------------------------------------------------------------------------
  output$param.col.2 <- renderUI({
    req(inventory.df)
    req(input$param.col.1)
    if (input$param.col.1 == "None") {
      cols.vec <- unique(names(inventory.df))
    } else {
      cols.vec <- unique(names(inventory.df))
      cols.vec <- cols.vec[!cols.vec %in% input$param.col.1]
    }
    selectInput("param.col.2", "Column:",
                c("None", cols.vec),
                selected = "None")
  })
  #------------------------------------------------------------------------------
  output$param.select.2 <- renderUI({
    req(inventory.df)
    req(input$param.col.2)
    selectInput("param.select.2", "Parameter:",
                c("All", unique(inventory.df[, names(inventory.df) == input$param.col.2])),
                selected = "All")
  })
  #------------------------------------------------------------------------------
  output$param.col.3 <- renderUI({
    req(inventory.df)
    req(input$param.col.1)
    req(input$param.col.2)
    if (input$param.col.1 == "None" | input$param.col.2 == "None") {
      cols.vec <- unique(names(inventory.df))
    } else {
      cols.vec <- unique(names(inventory.df))
      cols.vec <- cols.vec[!cols.vec %in% c(input$param.col.1, input$param.col2)]
    }
    selectInput("param.col.3", "Column:",
                c("None", cols.vec),
                selected = "None")
  })
  #------------------------------------------------------------------------------
  output$param.select.3 <- renderUI({
    req(inventory.df)
    req(input$param.col.3)
    selectInput("param.select.3", "Parameter:",
                c("All", unique(inventory.df[, names(inventory.df) == input$param.col.3])),
                selected = "All")
  })
  #------------------------------------------------------------------------------
  inventory.rec <- eventReactive(c(input$param.select.1, input$param.select.2, input$param.select.3), {
    req(inventory.df)
    req(input$param.col.1)
    req(input$param.col.2)
    req(input$param.col.3)
    req(input$param.select.1)
    req(input$param.select.2)
    req(input$param.select.3)
    
    final.df <- inventory.df
    
    if (input$param.col.1 != "None" &
        input$param.select.1 != "All") {
      col <- rlang::sym(input$param.col.1)
      final.df <- filter(final.df, !!col %in% input$param.select.1)
    }
    if (input$param.col.2 != "None" &
        input$param.select.2 != "All") {
      col <- rlang::sym(input$param.col.2)
      final.df <- filter(final.df, !!col %in% input$param.select.2)
    }
    if (input$param.col.3 != "None" &
        input$param.select.3 != "All") {
      col <- rlang::sym(input$param.col.3)
      final.df <- filter(final.df, !!col %in% input$param.select.3)
    }
    
    return(final.df)
  })
  
  output$filter.message <- renderUI({
    req(inventory.rec())
    if (nrow(inventory.rec()) == 0) "No data available for this filtering combination."
    else ""
  })
  #------------------------------------------------------------------------------
  #callModule(leaflet_plot, "leaflet", inventory.rec, input$param.select.1)
  source("server/server_leaflet.R", local = TRUE)
  callModule(dt_table, "dt", inventory.rec)
  
}