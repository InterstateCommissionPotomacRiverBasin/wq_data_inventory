# UI---------------------------------------------------------------------------
ui <- fluidPage(useShinyjs(),
                includeCSS("www/styles.css"),
                source("ui/ui_loading.R", local = TRUE)$value,
                hidden(div(
                  id = "app_content",
                  dashboardPage(
                    dashboardHeader(title = "Water Quality Data Inventory",
                                    titleWidth = 300),
                    # dashboardSidebar(disable = TRUE),
                    dashboardSidebar(width = 200,
                                     sidebarMenu(
                                       menuItem(
                                         "Information",
                                         tabName = "info_tab",
                                         icon = icon("info-circle")
                                       ),
                                       menuItem("Tabular", tabName = "tabular_tab", icon = icon("table"))#,
                                       # menuItem("Map", tabName = "map_tab", icon = icon("globe"))
                                     )),
                    dashboardBody(tabItems(
                      tabItem(tabName = "info_tab",
                              fluidPage(fluidRow(
                                column(width = 12,
                                       fluidRow(
                                         box(
                                           width = 12,
                                           title = tagList(shiny::icon("inco-circle"), "Information"),
                                           solidHeader = TRUE,
                                           status = "primary",
                                           source("ui/ui_info.R", local = TRUE)$value
                                         ),
                                         box(
                                           width = 12,
                                           title = tagList(shiny::icon("graduation-cap"), "Instructions"),
                                           solidHeader = TRUE,
                                           status = "primary",
                                           source("ui/ui_instructions.R", local = TRUE)$value
                                         )
                                       ))
                              ))),
                      tabItem(tabName = "tabular_tab",
                              fluidPage(fluidRow(
                                column(
                                  width = 4,
                                  tabBox(width = 12,
                                    tabPanel("Filter", icon = icon("filter"),
                                             source("ui/ui_filter.R", local = TRUE)$value),
                                    tabPanel("Download", icon = icon("download"),
                                             source("ui/ui_download_box.R", local = TRUE)$value)
                                  ),
                                  # box(width = 12,
                                  #     title = tagList(shiny::icon("filter"), "Filter"),
                                  #     solidHeader = TRUE,
                                  #     status = "primary",
                                  #     source("ui/ui_filter.R", local = TRUE)$value),
                                  # br(),
                                  # box(width = 12,
                                  #     title = tagList(shiny::icon("download"), "Download"),
                                  #     solidHeader = TRUE,
                                  #     status = "primary",
                                  #     source("ui/ui_download_box.R", local = TRUE)$value
                                  #     ),
                                  valueBoxOutput("program_count", width = 12)
                                ),
                                column(width = 8,
                                       tabBox(
                                         width = 12,
                                         height = 700,
                                         tabPanel("Program", icon = icon("table"),
                                                  dt_output("program_dt"))
                                       #  tabPanel("Site", icon = icon("table"),
                                        #          dt_output("site_dt"))
                                       ))
                              )))#,
                    #   tabItem(tabName = "map_tab",
                    #           fluidPage(fluidRow(
                    #             column(width = 4,
                    #                    box(width = 12,
                    #                        source("ui/ui_leaflet_filter.R", local = TRUE)$value),
                    #                    br(),
                    #                    valueBoxOutput("leaflet_point_count", width = 12)),
                    #             column(width = 8,
                    #                    box(width = 12,
                    #                        leaflet::leafletOutput("mymap",
                    #                                               height = "590px",
                    #                                               width = "100%")
                    #                    ))
                    #           ))
                    # 
                    # )
                    ))
                )))
)

