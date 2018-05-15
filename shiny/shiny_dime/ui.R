# UI---------------------------------------------------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Water Quality Data Inventory: Beta",
                  titleWidth = 400),
   dashboardSidebar(disable = TRUE),
  ## Body content
  dashboardBody(
    #fluidPage(
    fluidPage(
      fluidRow(
        # column(width = 8,
        #        tabBox(title = "First tabBox", #solidHeader = TRUE, status = "primary",
        #          # tags$style(type = "text/css", ".box-body {height:90vh}"),
        #          width = 12,  height = "100%",
        #          #tabPanel("Tab1", dt_output("dt"))#,
        #          tabPanel("Map", leaflet_output("leaflet"), icon = icon("globe")),
        #          #tabPanel("Table", dt_output("dt"), icon = icon("table"))
        #        )),
        
        column(width = 4,
               fluidRow(
                 tabBox(
                   width = 12, 
                   tabPanel("Information",
                            source("ui/info_box.R", local = TRUE)$value,
                            icon = icon("info-circle")),
                   tabPanel("Filter", 
                            icon = icon("filter"),
                            fluidRow(
                              column(width = 6,
                                     uiOutput("param.col.1"),
                                     uiOutput("param.col.2"),
                                     uiOutput("param.col.3")
                              ),
                              column(width = 6, 
                                     uiOutput("param.select.1"),
                                     uiOutput("param.select.2"),
                                     uiOutput("param.select.3")
                              ),
                              column(width = 12,
                                     uiOutput("filter.message"))
                            )
                   )
                     
                   )
                 )
                 # column(width = 12,
                 #        box(title = "Filter", solidHeader = TRUE, status = "primary",
                 #            width = 12, height = 325,
                 #            fluidRow(
                 #              column(width = 6,
                 #                     uiOutput("param.col.1"),
                 #                     uiOutput("param.col.2"),
                 #                     uiOutput("param.col.3")
                 #              ),
                 #              column(width = 6, 
                 #                     uiOutput("param.select.1"),
                 #                     uiOutput("param.select.2"),
                 #                     uiOutput("param.select.3")
                 #              ),
                 #              column(width = 12,
                 #                     uiOutput("filter.message"))
                 #            )
                 #        )
                 # )
               #)
        ),
        column(width = 8,
                      tabBox(
                        width = 12, height = 905,
                        #tabPanel("Tab1", dt_output("dt"))#,
                        tabPanel("Map",
                                 tagList(
                                   leaflet::leafletOutput("mymap",
                                                          height = "800px",
                                                          width = "100%")
                                 ),
                                 icon = icon("globe")),
                        tabPanel("Table", dt_output("dt"), icon = icon("table"))
                      )#,
               # tabBox(title = "Map", solidHeader = TRUE, status = "primary",
               #     width = 12, height = 905,
               #     #leaflet_output("leaflet")
               #     tagList(
               #         leaflet::leafletOutput("mymap",
               #                                height = "800px",#"80vh",
               #                                width = "100%")
               #     )
               # )
        )
      )#,
      # fluidRow(
      #   column(width = 12,
      #          box(title = "Table", solidHeader = TRUE, status = "primary",
      #              width = 12,
      #              dt_output("dt"), icon = icon("table")
      #          )
      #   )
      # )
    )
  )
)