# UI---------------------------------------------------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Water Quality Data Inventory: Beta",
                  titleWidth = 400),
  dashboardSidebar(disable = TRUE),
  dashboardBody(fluidPage(fluidRow(
    column(width = 4,
           fluidRow(tabBox(
             width = 12,
             tabPanel("Information",
                      source("ui/info_box.R", local = TRUE)$value,
                      icon = icon("info-circle")),
             tabPanel("Filter",
                      icon = icon("filter"),
                      fluidRow(
                        column(
                          width = 6,
                          h3("Primary Filter"),
                          uiOutput("param.col.1"),
                          h3("Secondary Filter"),
                          uiOutput("param.col.2"),
                          h3("Tertiary Filter"),
                          uiOutput("param.col.3")
                        ),
                        column(
                          width = 6,
                          h3("Primary Filter", style = "color:white"),
                          uiOutput("param.select.1"),
                          h3("Secondary Filter", style = "color:white"),
                          uiOutput("param.select.2"),
                          h3("Tertiary Filter", style = "color:white"),
                          uiOutput("param.select.3")
                        ),
                        column(width = 12,
                               uiOutput("filter.message"))
                      ))
           ))),
    column(width = 8,
           tabBox(
             width = 12,
             height = 905,
             tabPanel("Map",
                      tagList(
                        leaflet::leafletOutput("mymap",
                                               height = "800px",
                                               width = "100%")
                      ),
                      icon = icon("globe")),
             tabPanel("Table", dt_output("dt"), icon = icon("table"))
           ))
  )))
)