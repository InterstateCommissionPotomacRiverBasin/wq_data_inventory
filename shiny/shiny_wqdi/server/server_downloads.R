output$download.inv.rec <- downloadHandler(
  filename = function() {
    paste('wqdi_', format(Sys.time(), "%Y_%m_%d_%H%M%S"), '.csv', sep = '')
  },
  content = function(con) {
    write.csv(program.rec(), con)
  }
)

output$download.inv.all <- downloadHandler(
  filename = function() {
    paste('wqdi_all', format(Sys.time(), "%Y_%m_%d"), '.csv', sep = '')
  },
  content = function(con) {
    write.csv(inventory.df, con)
  }
)