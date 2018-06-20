fluidRow(
column(
  width = 12,
  dt_output("program_dt"),
  br(),
  column(width = 6,
         div(p(
           downloadButton('download.inv.all',
                          'Download All Available Data', class = "button")
         ),
         style = "text-align: center;")),
  column(width = 6,
         div(
           p(
             downloadButton('download.inv.rec',
                            'Download Filtered Data',
                            class = "button"),
             style = "text-align: center;"
           )
         ))
)
)