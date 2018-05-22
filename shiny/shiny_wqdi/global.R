#Libraries-----------------------------------------------------------------------
library(shiny)
library(shinydashboard)
library(leaflet)
library(DT)
library(dplyr)
#Modules-----------------------------------------------------------------------
source("modules/module_dt.R")
#Functions---------------------------------------------------------------------
load_data <- function() {
  Sys.sleep(2)
  hide("loading_page")
  show("main_content")
}
#Data--------------------------------------------------------------------------
inventory.df <- suppressWarnings(data.table::fread("data/wqdi.csv",
                                                   showProgress = FALSE)) %>% 
  dplyr::rename_all(funs(tolower(.) %>% trimws() %>% gsub("  | ", "_", .))) %>% 
  dplyr::rename(source_no = "monitoring_station_\n(source_no)") %>% 
  select(source_no, lat, long)

meta.df <- suppressWarnings(data.table::fread("data/icprb_metadata.csv",
                                              showProgress = FALSE)) %>%               
  dplyr::rename_all(funs(tolower(.) %>% trimws() %>% gsub("  | ", "_", .))) %>% 
  dplyr::rename(organization = "originator")

inventory.df <- left_join(inventory.df, meta.df, by = c("source_no"))
inventory.df[inventory.df == "N/A"] <- "Unavailable"
inventory.df[is.na(inventory.df)] <- "Unavailable"
rm(meta.df)



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

leaflet.filter.cols <- c("huc_12", "stream_name", "county", "state")
#leaflet.df <- inventory.df[, names(inventory.df) %in% leaflet.filter.cols]
