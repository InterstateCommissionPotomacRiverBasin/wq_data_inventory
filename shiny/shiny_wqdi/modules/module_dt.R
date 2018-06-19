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
    data.df <- data.df() %>% 
      rename_all(funs(stringr::str_replace_all(., "_", " "))) %>% 
      rename_all(stringr::str_to_title) 
  DT::datatable(data.df,
                class = 'nowrap cell-border stripe',
                escape = FALSE,
                options = list(
                  dom = "ltip",
                  scrollX = TRUE,
                  scrollY = "600px",
                  pageLength = 50,
                  # autoWidth = TRUE
                  columnDefs = list(list(className = 'dt-center', targets = "_all"))
                )
                )
})
}
