#------------------------------------------------------------------------------
# Prevent map from reloading when switching to the filter tab.
lapply(c(
  "filter_col_1",
  "filter_col_2",
  "filter_col_3",
  "filter_select_1",
  "filter_select_2",
  "filter_select_3",
  "mymap"
),
function(x)
  outputOptions(output, x, suspendWhenHidden = FALSE, priority = 2))
#------------------------------------------------------------------------------