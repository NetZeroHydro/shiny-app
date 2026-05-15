# Load packages ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinyWidgets)
library(shinycssloaders)
library(leaflet)
library(RColorBrewer)
library(ggplot2)

# read in data
#reach_enriched <- readRDS('../../../../../capstone/netzerohydro/data/cleaned_v1/gdw_test_mekong.RDS')
#out <- readRDS('../../../../../capstone/netzerohydro/data/cleaned_v1/gdw_test_mekong_out.RDS')
results_sf <- readRDS('../../../../../capstone/netzerohydro/data/GIS_processed_data/reach_enriched_full_all_GIS_v2.rds')
results_sf$connectivity_category <- factor(results_sf$connectivity_category, 
                                         levels=c("cascade_classic", "cascade1", "cascade2+", "downstream", "upstream", "undammed"))

connectivity_cat_pal <- c("cascade_classic" = "#003800",
                          "cascade1" = "#1cbf3a",
                          "cascade2+" = "#b7ffd7",
                          "upstream" = "#ffe500",
                          "downstream" = "#f99b2f",
                          "undammed" = "#c13000")

pal <- colorFactor(palette = connectivity_cat_pal, domain = reach_10$connectivity_category)