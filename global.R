# Load packages ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinyWidgets)
library(shinycssloaders)
library(leaflet)
library(RColorBrewer)

# read in data
#reach_enriched <- readRDS('../../../../../capstone/netzerohydro/data/cleaned_v1/gdw_test_mekong.RDS')
#out <- readRDS('../../../../../capstone/netzerohydro/data/cleaned_v1/gdw_test_mekong_out.RDS')
results_sf <- readRDS('../../../../../capstone/netzerohydro/data/cleaned_v1/gdw_wsm_dam_practice.rds')
