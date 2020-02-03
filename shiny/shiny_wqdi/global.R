#print(pryr::mem_used())

#Libraries-----------------------------------------------------------------------
source("global/load_packages.R", local = TRUE)
#Modules-----------------------------------------------------------------------
source("modules/module_dt.R")
#Functions---------------------------------------------------------------------

# Function enables the loading page feature of this app.
load_data <- function() {
  Sys.sleep(2)
  hide("loading_page")
  show("main_content")
}
#print(pryr::mem_used())

# Standardize data frame column names.
standard_names <- function(x) {
  x %>% 
    dplyr::rename_all(list(~tolower(.) %>% trimws() %>% gsub("  | ", "_", .)))
}
#Import Data--------------------------------------------------------------------------

colnames.df <- suppressWarnings(
  data.table::fread("data/wqdi_colnames.csv",showProgress = FALSE,
                    data.table = FALSE, header = TRUE)) %>% 
  standard_names()
#------------------------------------------------------------------------------
acronyms.df <- suppressWarnings(
  data.table::fread("data/wqdi_acronyms.csv",showProgress = FALSE,
                    data.table = FALSE, header = TRUE)) %>% 
  standard_names()
#------------------------------------------------------------------------------
inventory.df <- suppressWarnings(
  data.table::fread("data/wqdi.csv", showProgress = FALSE,
                    data.table = FALSE, header = TRUE)) %>% 
  standard_names() %>% 
  #dplyr::rename(source_no = "monitoring_station") %>% 
  select(source_no, lat, long)
#------------------------------------------------------------------------------
meta.df <- suppressWarnings(
  data.table::fread("data/icprb_metadata.csv",
                                              showProgress = FALSE,
                    data.table = FALSE, header = TRUE)) %>%               
  standard_names() #%>% 
  #dplyr::rename(organization = "originator")
#------------------------------------------------------------------------------
inventory.df <- full_join(inventory.df, meta.df, by = c("source_no"))
inventory.df[inventory.df == "N/A"] <- "Unavailable"
inventory.df[is.na(inventory.df)] <- "Unavailable"
rm(meta.df)
#------------------------------------------------------------------------------
program.cols <- c("organization", "program_name", "site_location",
                  "purpose", "metric_parameter", "parameter_group",
                  "spatial_coverage", "fall_line", "lat_long",
                  "number_of_sites_sampled", "frequency_sampled",
                  "period_of_record_start_date", "period_of_record_end_date",
                  "collection_method", "update_frequency",
                  "public_or_restricted_data", "dataset_fees",
                  "data_type", "program_website", "data_link",
                  "contact_name", "contact_phone", "contact_email")
program.df <- inventory.df[, names(inventory.df) %in% program.cols]

site.cols <- c("organization", "program name", "station_id", "lat", "long")
site.df <- inventory.df[, names(inventory.df) %in% site.cols]
#------------------------------------------------------------------------------
# map.df <- suppressWarnings(
#   data.table::fread("data/WQ_Map_Points_052218HUC_St_Cnty_nam.csv",
#                     showProgress = FALSE,
#                     data.table = FALSE)) %>%               
#   standard_names() %>% 
#   rename(county = "county_1",
#          huc12 = "huc12_1", 
#          subwatershed = "name",
#          stream_name = "gnis_name") %>% 
#   mutate(huc12 = paste0("0", huc12))

#leaflet.df <- inventory.df[, names(inventory.df) %in% leaflet.filter.cols]

#print(pryr::mem_used())