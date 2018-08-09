# Load packages using script copied from:
# https://www.r-bloggers.com/install-and-load-missing-specifiedneeded-packages-on-the-fly/
# needed packages for a job

suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(shinydashboard))
suppressPackageStartupMessages(library(leaflet))
suppressPackageStartupMessages(library(DT))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(shinyjs))
need <- c("shiny",
          "shinydashboard",
          "leaflet",
          "DT",
          "data.table",
          "dplyr",
          "shinyjs") 
# find out which packages are installed
ins <- installed.packages()[, 1] 
# check if the needed packages are installed
(Get <-
    need[which(is.na(match(need, ins)))]) 
# install the needed packages if they are not-installed
if (length(Get) > 0) {
  install.packages(Get)
} 
# load the needed packages
eval(parse(text = paste("suppressPackageStartupMessages(library(", need, "))")))
rm(Get, ins, need)