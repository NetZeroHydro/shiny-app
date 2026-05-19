# ============================================================
# global.R — DamPlan 
# ============================================================

library(shiny)
library(leaflet)
library(leaflet.extras)
library(DT)
library(dplyr)
library(RColorBrewer)
library(htmlwidgets)
library(tidyverse)
library(shinyWidgets)
library(shinycssloaders)
library(ggplot2)

# ---- Palette ----
COL_AMALFI      <- "#2E5AA7"
COL_AMALFI_DARK <- "#1e3f7a"
COL_CITRUS      <- "#FFA62B"
COL_BREEZE      <- "#86C5FF"
COL_CREAM       <- "#F8E6A0"

# ---- Source modules ----
source("R/helpers_ui.R")
source("R/introduction.R")   # Introduction
source("R/about_data.R")     # About Data
source("R/workflow.R")       # Workflow
source("R/team.R")           # Team
source("R/dams.R")           # Dams

# ---- Read in data ----
results_sf <- readRDS('../../../../../capstone/netzerohydro/data/GIS_processed_data/reach_enriched_full_all_GIS_v2.rds')
# re-factor connectivity categories
results_sf$connectivity_category <- factor(results_sf$connectivity_category, 
                                           levels=c("cascade_classic", 
                                                    "cascade1", 
                                                    "cascade2+", 
                                                    "downstream", 
                                                    "upstream", 
                                                    "undammed"))

# ---- Connectivity palette ----
connectivity_cat_pal <- c("cascade_classic" = "#003800",
                          "cascade1" = "#1cbf3a",
                          "cascade2+" = "#b7ffd7",
                          "upstream" = "#ffe500",
                          "downstream" = "#f99b2f",
                          "undammed" = "#c13000")
pal <- colorFactor(palette = connectivity_cat_pal, domain = results_sf$connectivity_category)




