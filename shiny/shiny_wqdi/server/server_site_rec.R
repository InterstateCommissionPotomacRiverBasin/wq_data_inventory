site.rec <-eventReactive(
    c(
      input$filter_select_1,
      input$filter_select_2,
      input$filter_select_3
    ),
    {
      req(program.rec())
      req(site.df)
      
      site.df %>% 
        filter(organization %in% unique(program.rec()$organization)) %>% 
        distinct()
    },
    ignoreNULL = FALSE#,
    #ignoreInit = FALSE
)
      