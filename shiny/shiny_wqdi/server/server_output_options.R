#------------------------------------------------------------------------------
# Prevent map from reloading when switching to the filter tab.
lapply(c(
  "filter.col.1",
  "filter.col.2",
  "filter.col.3",
  "filter.select.1",
  "filter.select.2",
  "filter.select.3",
   "mymap"
),
function(x)
  outputOptions(output, x, suspendWhenHidden = FALSE, priority = 2))
#------------------------------------------------------------------------------