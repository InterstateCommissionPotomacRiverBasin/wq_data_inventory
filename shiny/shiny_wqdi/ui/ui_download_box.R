fluidRow(
  column(width = 12, h3("Filtered Data")),
  column(width = 12,
         downloadButton('download.program.rec',
                        'Download Program Data',
                        class = "button",
                        style = "width:100%;")
  )
  # column(width = 12,
  #     downloadButton('download.site.rec',
                        #                   'Download Site Data',
  #                    class = "button",
  #                     style = "width:100%;")
  # ),
  #br(),
  #column(width = 12, h3("Metadata")),
  #column(width = 12,
   #      downloadButton('download.colnames',
    #                    'Download Column Name Descriptions',
     #                   class = "button",
      #                  style = "width:100%;")
  #),
  #column(width = 12,
   #      downloadButton('download.acronyms',
    #                    'Download Acronym Descriptions',
     #                   class = "button",
      #                  style = "width:100%;")
  )