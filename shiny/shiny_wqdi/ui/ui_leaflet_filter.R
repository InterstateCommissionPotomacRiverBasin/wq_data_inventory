fluidRow(
  column(width = 12, h3("Primary Filter")),
  column(width = 6, uiOutput("filter_leaflet_col_1")),
  column(width = 6, uiOutput("filter_leaflet_select_1")),
  br(),
  conditionalPanel(condition = 'input.filter_leaflet_col_1 != "None"',
                   column(width = 12, h3("Secondary Filter")),
                   column(width = 6, uiOutput("filter_leaflet_col_2")),
                   column(width = 6, uiOutput("filter_leaflet_select_2")),
                   br(),
                   conditionalPanel(condition = 'input.filter_leaflet_col_2 != "None"',
                                    column(width = 12, h3("Tertiary Filter")),
                                    column(width = 6, uiOutput("filter_leaflet_col_3")),
                                    column(width = 6, uiOutput("filter_leaflet_select_3"))
                   )),

  column(width = 12,
         actionButton("reset_leaflet_filter",
                      "Reset Filter",
                      icon = icon("undo"),
                      style = "width:100%;")
  )
)