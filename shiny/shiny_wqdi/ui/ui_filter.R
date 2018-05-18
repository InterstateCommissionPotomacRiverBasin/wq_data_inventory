fluidRow(
  column(width = 12, h3("Primary Filter")),
  column(width = 6, uiOutput("filter.col.1")),
  column(width = 6, uiOutput("filter.select.1")),
  br(),
  conditionalPanel('input.filter.select.1 > 0)',
  column(width = 12, h3("Secondary Filter")),
  column(width = 6, uiOutput("filter.col.2")),
  column(width = 6, uiOutput("filter.select.2")),
  br()),
  column(width = 12, h3("Tertiary Filter")),
  column(width = 6, uiOutput("filter.col.3")),
  column(width = 6, uiOutput("filter.select.3")),
  # column(width = 12,
  #        uiOutput("filter.message")),
  column(width = 12,
         actionButton("reset",
                      "Reset Filter",
                      icon = icon("undo"),
                      style = "width:100%;")
  )
)