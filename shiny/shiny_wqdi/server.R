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
  source("server/server_program_rec.R", local = TRUE)
  callModule(dt_table, "program_dt", program.rec)
  source("server/server_site_rec.R", local = TRUE)
  callModule(dt_table, "site_dt", site.rec)
  source("server/server_leaflet_filter.R", local = TRUE)
  source("server/server_map_rec.R", local = TRUE)
  source("server/server_leaflet.R", local = TRUE)
  source("server/server_downloads.R", local = TRUE)
  source("server/server_output_options.R", local = TRUE)

}