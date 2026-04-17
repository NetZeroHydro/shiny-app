# ---- dashboardHeader ----
header <- dashboardHeader(
  
  # title ----
  title = "DamPlan"
  
) # END header

# ---- dashboardSidebar ----
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    menuItem(text = "About", tabName = "about", icon = icon("star")),
    menuItem(text = "Map", tabName = "map", icon = icon("water")),
    menuItem(text = "Data Exploration", tabName = "data_exploration", icon = icon("star"))
    
  ) # END sidebarMenu
) # END dashboardSidebar

# ---- dashboardBody ----
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
    # About tabItem ----
    tabItem(
      tabName = "about",
      
      # left-hand column ----
      column(width = 6)
      
    ), # END about tabItem
    
    # map tabItem ----
    tabItem(
      tabName = "map",
      
      # leaflet box ----
      tags$style(type = "text/css", "#dam_map_output {height: calc(100vh - 80px) !important;}"), # expand map to whole page
      leafletOutput("dam_map_output") # END leaflet box
      
    ) # END map tabItem
    
  )# END tabItems
  
) # END dashboardBody

# ---- combine all into dashboardPage ----
dashboardPage(header, sidebar, body)