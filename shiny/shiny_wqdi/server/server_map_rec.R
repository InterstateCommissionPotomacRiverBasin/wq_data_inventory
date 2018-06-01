map.rec.1 <-
  eventReactive(
    c(
      input$filter_leaflet_select_1
    ),
    {
      req(map.df)
      
      final.df <- map.df
      
      if (!is.null(input$filter_leaflet_col_1) &&
          input$filter_leaflet_col_1 != "None" &
          !is.null(input$filter_leaflet_select_1)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter_leaflet_col_1] %in% input$filter_leaflet_select_1,]
        # col <- rlang::sym(input$filter_leaflet_col_1)
        # final.df <- filter(final.df, !!col %in% input$filter_leaflet_select_1)
      }
      
      return(final.df)
    },
    ignoreNULL = FALSE#,
    #ignoreInit = FALSE
  )

map.rec.2 <-
  eventReactive(
    c(
      input$filter_leaflet_select_1,
      input$filter_leaflet_select_2
    ),
    {
      req(map.df)
      
      final.df <- map.df
      
      if (!is.null(input$filter_leaflet_col_1) &&
          input$filter_leaflet_col_1 != "None" &
          !is.null(input$filter_leaflet_select_1)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter_leaflet_col_1] %in% input$filter_leaflet_select_1,]
        # col <- rlang::sym(input$filter_leaflet_col_1)
        # final.df <- filter(final.df, !!col %in% input$filter_leaflet_select_1)
      }
      if (!is.null(input$filter_leaflet_col_2) &&
          input$filter_leaflet_col_2 != "None" &
          !is.null(input$filter_leaflet_select_2)) {
        final.df <- 
          final.df[final.df[, names(final.df) == input$filter_leaflet_col_2] %in% input$filter_leaflet_select_2,]
        # col <- rlang::sym(input$filter_leaflet_col_2)
        # final.df <- filter(final.df, !!col %in% input$filter_leaflet_select_2)
      }
      
      return(final.df)
    },
    ignoreNULL = FALSE#,
    #ignoreInit = FALSE
  )

map.rec <-
  eventReactive(
    c(
      input$filter_leaflet_select_1,
      input$filter_leaflet_select_2,
      input$filter_leaflet_select_3
    ),
    {
      req(map.df)
      
      final.df <- map.df
      
      if (!is.null(input$filter_leaflet_col_1) &&
          input$filter_leaflet_col_1 != "None" &
          !is.null(input$filter_leaflet_select_1)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter_leaflet_col_1] %in% input$filter_leaflet_select_1,]
        # col <- rlang::sym(input$filter_leaflet_col_1)
        # final.df <- filter(final.df, !!col %in% input$filter_leaflet_select_1)
      }
      if (!is.null(input$filter_leaflet_col_2) &&
          input$filter_leaflet_col_2 != "None" &
          !is.null(input$filter_leaflet_select_2)) {
        final.df <- 
          final.df[final.df[, names(final.df) == input$filter_leaflet_col_2] %in% input$filter_leaflet_select_2,]
        # col <- rlang::sym(input$filter_leaflet_col_2)
        # final.df <- filter(final.df, !!col %in% input$filter_leaflet_select_2)
      }
      if (!is.null(input$filter_leaflet_col_3) &&
          input$filter_leaflet_col_3 != "None" &
          !is.null(input$filter_leaflet_select_3)) {
        final.df <-
          final.df[final.df[, names(final.df) == input$filter_leaflet_col_3] %in% input$filter_leaflet_select_3,]
        # col <- rlang::sym(input$filter_leaflet_col_3)
        # final.df <- filter(final.df, !!col %in% input$filter_leaflet_select_3)
      }
      
      return(final.df)
    },
    ignoreNULL = FALSE#,
    #ignoreInit = FALSE
  )