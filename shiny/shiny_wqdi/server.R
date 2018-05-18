server <- function(input, output, session) {
  load_data()
  hide(id = "loading_content",
       anim = TRUE,
       animType = "fade")
  show("app_content")
  #------------------------------------------------------------------------------
  output$instructions <- renderUI({
    source("ui/ui_instructions.R", local = TRUE)$value
  })
  #------------------------------------------------------------------------------
  source("server/server_filter.R", local = TRUE)
  source("server/server_inventory_rec.R", local = TRUE)
  source("server/server_leaflet.R", local = TRUE)
  callModule(dt_table, "dt", inventory.rec)
  source("server/server_downloads.R", local = TRUE)
  source("server/server_output_options.R", local = TRUE)
  

}