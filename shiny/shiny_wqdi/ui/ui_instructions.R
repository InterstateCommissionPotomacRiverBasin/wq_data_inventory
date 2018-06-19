tags$div(
  h4("Filter Tab"),
  p(
    'The "Filter" tab allows the user to select a column in the',
    "inventory and a feature or multiple features of that column to filter the data.",
    'The filters will update data displayed in the "Map" and "Table" tabs.',
    'If no filters are selected, then all the data will be displayed',
    "(i.e., the data is not subset by a filter)."),
  p(
    "It is possible to apply multiple filters that yield no data.",
    'For example, if the "Primary Filter" acts on the program name column',
    'and the "Secondary Filter" acts on the contact name column,',
    'then it is very easy to select a contact name in the "Secondary Filter"',
    'that does not belong to the program name selected in the "Primary Filter:"',
    'ultimately resulting in no data to display.',
    "When this happens, several text-boxes will appear informing the",
    "user that there is no data available for that particular filter."
  ),
  br(),
  # h4("Map Tab"),
  # p(
  #   'The map displays water quality monitoring locations that are',
  #   'currently included in the inventory.',
  #   "This is a subset of all the information included in the", 
  #   "inventory's table view."
  # ),
  # p(
  #   'By double-clicking, the user can zoom in to an area of interest.',
  #   'Additionally, the user can hold shift, then click and drag to',
  #   'create a zoom extent.',
  #   'This enables the user to draw a box around an area of',
  #   'interest and subsequently zoom in to that area.'
  # ),
  # p(
  #   "Clicking on a point will provide a pop-up window with information",
  #   "related to the selected point.",
  #   "Some of the points have hyperlinks to the data provider's website."
  # ),
  # br(),
  h4("Table Tab"),
  p(
    "This tab enables the user to view the data in a tabular format.",
    "The table is interactive.",
    "Each of the columns can be sorted by clicking on the column header",
    "and each column can be filtered by entering values into the text-boxes",
    "located below the column headers.",
    "A global table filter is available in the top right corner, which enables",
    "the user to filter all columns using text or numeric values entered into this",
    "text-box."
  ),
  p(
    "Located below the table are two download buttons.",
    'The "Download All Available Data" button allows the user to download all of the',
    'data in the Water Quality Data Inventory.',
    'The "Download Filtered Data" button allows the user to download the data',
    'filtered by the "Filter" tab.',
    tags$b('The data downloaded with this button is not influenced by the filters',
           'applied in the "Table" tab.'),
    "Those filters are just for exploring the tabular data."
  )
)
