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
