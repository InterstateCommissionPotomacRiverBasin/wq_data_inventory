output$download.inv.rec <- downloadHandler(
  filename = function() {
    paste('wqdi_', format(Sys.time(), "%Y_%m_%d_%H%M%S"), '.csv', sep = '')
  },
  content = function(con) {
    write.csv(program.rec(), con, row.names = FALSE)
  }
)

output$download.inv.all <- downloadHandler(
  filename = function() {
    paste('wqdi_all', format(Sys.time(), "%Y_%m_%d"), '.csv', sep = '')
  },
  content = function(con) {
    write.csv(inventory.df, con, row.names = FALSE)
  }
)

program.final.rec <- reactive({
  program.final <- program.rec() %>% 
    mutate(
      data_link = stringr::str_extract(data_link, "'([^']*)'"),
      data_link = stringr::str_replace_all(data_link, "'", ""),
      data_link = if_else(is.na(data_link), "Unavailable", data_link),
      program_website = stringr::str_extract(program_website, "'([^']*)'"),
      program_website = stringr::str_replace_all(program_website, "'", ""),
      program_website = if_else(is.na(program_website), "Unavailable", program_website)
    )
})

# write_2_sheets <- function(x, y, con = con) {
#   xlsx::write.xlsx(
#     x,
#     file = con,
#     sheetName = "program",
#     row.names = FALSE
#   )
#   # xlsx::write.xlsx(
#   #   y,
#   #   file = con,
#   #   sheetName = "site",
#   #   append = TRUE,
#   #   row.names = FALSE
#   # )
# }
output$download.program.rec <- downloadHandler(
  filename = function() {
    paste0('wqdi_program_',
           format(Sys.time(), "%Y_%m_%d_%H%M%S"),
           '.csv')
  },
  content = function(con) {
    # xlsx::write.xlsx(program.final.rec(), con, row.names = FALSE)
    write.csv(program.final.rec(), con, row.names = FALSE)
  }
)

output$download.site.rec <- downloadHandler(
  filename = function() {
    paste0('wqdi_site_', format(Sys.time(), "%Y_%m_%d_%H%M%S"), '.csv')
  },
  content = function(con) {
    write.csv(site.rec(), con, row.names = FALSE)
  }
)

output$download.colnames <- downloadHandler(
  filename = function() {
    paste0('wqdi_colnames_', format(Sys.time(), "%Y_%m_%d_%H%M%S"), '.csv')
  },
  content = function(con) {
    write.csv(colnames.df, con, row.names = FALSE)
  }
)

output$download.acronyms <- downloadHandler(
  filename = function() {
    paste0('wqdi_acronyms_', format(Sys.time(), "%Y_%m_%d_%H%M%S"), '.csv')
  },
  content = function(con) {
    write.csv(acronyms.df, con, row.names = FALSE)
  }
)