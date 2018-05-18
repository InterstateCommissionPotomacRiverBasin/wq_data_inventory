library(shinyjs)

# UI---------------------------------------------------------------------------
ui <- fluidPage(useShinyjs(),
                includeCSS("www/styles.css"),
                source("ui/ui_loading.R", local = TRUE)$value,
                hidden(div(
                  id = "app_content",
                  dashboardPage(
                    dashboardHeader(title = "Water Quality Data Inventory: Beta",
                                    titleWidth = 400),
                    dashboardSidebar(disable = TRUE),
                    dashboardBody(fluidPage(fluidRow(
                      column(width = 4,
                             fluidRow(
                               tabBox(
                                 width = 12,
                                 tabPanel("Information",
                                          icon = icon("info-circle"),
                                          source("ui/ui_info.R", local = TRUE)$value),
                                 tabPanel(
                                   "Instructions",
                                   icon = icon("graduation-cap"),
                                   div(style = 'height: 610px; overflow-y: scroll;',
                                       uiOutput('instructions'))
                                 ),
                                 tabPanel("Filter",
                                          id = "filter",
                                          value = 1,
                                          icon = icon("filter"),
                                          source("ui/ui_filter.R", local = TRUE)$value)
                               ),
                                 br(),
                                 valueBoxOutput("approvalBox", width = 12)
                               
                             )),
                      column(width = 8,
                             tabBox(
                               width = 12,
                               height = 700,
                               tabPanel("Table", icon = icon("table"),
                                        source("ui/ui_download_btn.R", local = TRUE)$value
                               ),
                               tabPanel(
                                 "Map",
                                 icon = icon("globe"),
                                 fluidRow(column(
                                   width = 12,
                                   tagList(
                                     leaflet::leafletOutput("mymap",
                                                            height = "590px",
                                                            width = "100%")
                                   )
                                 ))
                               )
                               
                               )
                             ))
                    )))
                  )
                ))