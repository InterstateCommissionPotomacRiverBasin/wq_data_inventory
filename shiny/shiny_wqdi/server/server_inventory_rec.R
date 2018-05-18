inventory.rec.1 <-
  eventReactive(
    c(
      input$filter.select.1
    ),
    {
      req(inventory.df)
      
      final.df <- inventory.df
      
      if (!is.null(input$filter.col.1) &&
          input$filter.col.1 != "None" &
          !is.null(input$filter.select.1)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter.col.1] %in% input$filter.select.1,]
        # col <- rlang::sym(input$filter.col.1)
        # final.df <- filter(final.df, !!col %in% input$filter.select.1)
      }
    
      return(final.df)
    },
    ignoreNULL = FALSE#,
    #ignoreInit = FALSE
  )

inventory.rec.2 <-
  eventReactive(
    c(
      input$filter.select.1,
      input$filter.select.2
    ),
    {
      req(inventory.df)
      
      final.df <- inventory.df
      
      if (!is.null(input$filter.col.1) &&
          input$filter.col.1 != "None" &
          !is.null(input$filter.select.1)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter.col.1] %in% input$filter.select.1,]
        # col <- rlang::sym(input$filter.col.1)
        # final.df <- filter(final.df, !!col %in% input$filter.select.1)
      }
      if (!is.null(input$filter.col.2) &&
          input$filter.col.2 != "None" &
          !is.null(input$filter.select.2)) {
        final.df <- 
          final.df[final.df[, names(final.df) == input$filter.col.2] %in% input$filter.select.2,]
        # col <- rlang::sym(input$filter.col.2)
        # final.df <- filter(final.df, !!col %in% input$filter.select.2)
      }
      
      return(final.df)
    },
    ignoreNULL = FALSE#,
    #ignoreInit = FALSE
  )

inventory.rec <-
  eventReactive(
    c(
      input$filter.select.1,
      input$filter.select.2,
      input$filter.select.3
    ),
    {
      req(inventory.df)
      
      final.df <- inventory.df
      
      if (!is.null(input$filter.col.1) &&
          input$filter.col.1 != "None" &
          !is.null(input$filter.select.1)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter.col.1] %in% input$filter.select.1,]
        # col <- rlang::sym(input$filter.col.1)
        # final.df <- filter(final.df, !!col %in% input$filter.select.1)
      }
      if (!is.null(input$filter.col.2) &&
          input$filter.col.2 != "None" &
          !is.null(input$filter.select.2)) {
        final.df <- 
          final.df[final.df[, names(final.df) == input$filter.col.2] %in% input$filter.select.2,]
        # col <- rlang::sym(input$filter.col.2)
        # final.df <- filter(final.df, !!col %in% input$filter.select.2)
      }
      if (!is.null(input$filter.col.3) &&
          input$filter.col.3 != "None" &
          !is.null(input$filter.select.3)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter.col.3] %in% input$filter.select.3,]
        # col <- rlang::sym(input$filter.col.3)
        # final.df <- filter(final.df, !!col %in% input$filter.select.3)
      }
      
      return(final.df)
    },
    ignoreNULL = FALSE#,
    #ignoreInit = FALSE
  )