# box(title = "Information", solidHeader = TRUE, status = "primary",
#     width = 12,
    tags$div(
      tags$p(
        'Welcome to the Potomac River basin Water',
        'Quality Monitoring Inventory!'
      ), 
      tags$p(
        'This mapping interface is available to assist users in identifying',
        'monitoring locations of interest.',
        'The map displays water quality data monitoring locations that are',
        'currently included in the inventory.',
        'To use this tool, click on the "Agency/Organization" or "Watershed"',
        'tabs above to filter water quality monitoring locations by',
        'agency/organization, sub-watershed, or both.',
        'To view information about each monitoring location,',
        'click on the point of interest to open a pop-up window.',
        'The pop-up window includes key information about the',
        'agency/organization responsible for maintaining the',
        'monitoring location, a link to the monitoring program website,',
        'and a link to access monitoring data for that location.',
        'Use the search function in the top-right to search for a',
        'specific street address in the basin.'),
      tags$p(
        'To access the full water quality inventory dataset,',
        'users can download the datasheet here.',
        'The datasheet includes additional information about',
        'monitoring sites displayed in the mapping interface.',
        'Monitoring locations on the map are linked to the', 
        'spreadsheet inventory via the Source_No field.'
      ),
      tags$p(
        'Efforts are made by ICPRB to keep this information up-to-date.', 
        'As water quality data collection efforts in the basin are extensive,',
        'however, the information provided here is for informational purposes',
        'only and is not guaranteed to be complete or appropriate for any particular use.'
      ),
      tags$p('Visit the',
             tags$a(href = "https://www.potomacriver.org/focus-areas/water-quality/potomac-basin-water-quality-data-inventory/",
                    "project page"),
             'project page to learn more about the',
             'Water Quality Monitoring Inventory Project.'
      ),
      tags$p(
        'Contact', tags$a(href= "mailto:hmoltz@icprb.org", "Dr. Heidi Moltz"),
        'with questions or to submit additional',
        'water quality data sources for inclusion in the inventory.'
      )
    )
# )