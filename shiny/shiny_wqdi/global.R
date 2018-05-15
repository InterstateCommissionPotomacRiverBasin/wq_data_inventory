#Libraries-----------------------------------------------------------------------
library(shiny)
library(shinydashboard)
library(leaflet)
library(DT)
library(dplyr)
#Modules-----------------------------------------------------------------------
source("modules/module_leaflet.R")
source("modules/module_dt.R")
#Data--------------------------------------------------------------------------
inventory.df <- data.table::fread("data/wqdi.csv") %>% 
  dplyr::rename_all(tolower) %>% 
  dplyr::rename(source_no = "monitoring station \n(source_no)") %>% 
  select(source_no, lat, long)

meta.df <- data.table::fread("data/icprb_metadata.csv") %>%               
  dplyr::rename_all(tolower)

inventory.df <- left_join(inventory.df, meta.df, by = c("source_no"))
inventory.df[inventory.df == "N/A"] <- "Unavailable"
inventory.df[is.na(inventory.df)] <- "Unavailable"

rm(meta.df)

