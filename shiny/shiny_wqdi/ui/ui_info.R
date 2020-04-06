# box(title = "Information", solidHeader = TRUE, status = "primary",
#     width = 12,
tags$div(
  tags$p(
    "Welcome to the Interstate Commission on the Potomac River Basin's",
    'Water Quality Data Inventory!'
  ),       
  tags$p(
    "This interface can help users find existing water quality monitoring",
    "efforts in the Potomac River basin.",  
    "ICPRB periodically updates this information by contacting the many", 
    "agencies that collect the data.", 
    "These agencies monitor water quality for different reasons,", 
    "so the information provided here is for identifying sources of data.", 
    "It is not guaranteed to be complete, nor does it indicate if the data", 
    "are appropriate for a particular use."
  ),
  tags$p(
    'You can visit the',
    tags$a(href = "https://www.potomacriver.org/focus-areas/water-quality/potomac-basin-water-quality-data-inventory/",
           "project page",
           target = "_blank"),
    'to learn more about the',
    'Water Quality Monitoring Inventory Project.'
  ),
  tags$p(
    'Contact', tags$a(href= "mailto:hmoltz@icprb.org", "Dr. Heidi Moltz"),
    'with questions or to submit additional',
    'water quality data sources for inclusion in the inventory.'
  )
)
# )