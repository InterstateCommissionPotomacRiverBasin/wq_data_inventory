# Module UI function
dt_output <- function(id) {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
      DT::dataTableOutput(ns("dt_table"))
  )
  
}

# Module Server function
dt_table <- function(input, output, session, data.df) {
  output$dt_table <- DT::renderDataTable({
  validate(need(data.df(), "data.df not found"))
    validate(need(nrow(data.df()) > 0, "No data available for this filtering combination."))
    
  DT::datatable(data.df(),
                class = 'cell-border stripe',
                filter = 'top',
                options = list(
                  scrollX = TRUE,
                  scrollY = "500px",
                  pageLength = 10,
                  autoWidth = TRUE
                )
                )
})
}
