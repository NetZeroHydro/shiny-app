# ============================================================
# R/dams.R — Dams tab (PLACEHOLDER)
# Full-page leaflet map with draggable filter panel
# ============================================================

dams_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    # Expand map to fill entire panel (subtract navbar height)
    tags$style(type = "text/css", "#dam_map_output {height: calc(100vh - 80px) !important;}"),
    # Full-width leaflet map,
    leafletOutput("dam_map_output", width = "100vh", height = "100vh"),
    
    # Draggable control panel
    absolutePanel(draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                  width = 330, height = "auto",
                  selectInput("cascade_threshold", "Cascade Threshold:", 
                              choices = unique(results_sf$threshold_k)
                  ),
                  plotOutput("connectivity_bar", height = 250),
                  plotOutput("capacity_bar", height = 250)
    )
  )
}

dams_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    # ---- Reactive filtered data ----
    filtered_data <- reactive({
      results_sf %>% filter(threshold_k == input$cascade_threshold)
    })
    
    # ---- Base map ----
    output$dam_map_output <- renderLeaflet({
      
      leafletProxy(data = filtered_data()) %>% 
        addProviderTiles(providers$Esri.WorldPhysical) %>% # Tile 
        # Add Markers
        addCircleMarkers(
          radius = 1,
          # color by connectivity category
          color = ~pal(filtered_data()$connectivity_category),
          # Pop up messages
          popup = paste0(
            "<b>Dam_ID: ", filtered_data()$dam_id, "</b><br>", 
            "<b>Connectivity Category: </b>", filtered_data()$connectivity_category, "<br>", 
            "<b>CSI: </b>", filtered_data()$csi, "<br>", 
            "<b>In a PA: </b>", filtered_data()$in_protected_area, "<br>",
            "<b>Capacity: </b>", filtered_data()$capacity_mw, "mw", "<br>",
            "<b> Weighted Sum Model Score: </b>", round(filtered_data()$wsm_scores, 3)
          ))
    })
    
    # ---- ggplots ----
    output$connectivity_bar <- renderPlot({
      filtered_data() %>% 
        filter(dam_type == "future") %>% 
        ggplot(aes(y = connectivity_category, fill = connectivity_category)) + 
        geom_bar() +
        scale_fill_manual(values = connectivity_cat_pal) +
        theme_minimal()
    })
    
    output$capacity_bar <- renderPlot({
      filtered_data() %>% 
        filter(dam_type == "future") %>% 
        ggplot(aes(y = connectivity_category, x = capacity_mw, fill = connectivity_category)) +
        geom_col() +
        scale_fill_manual(values = connectivity_cat_pal) +
        theme_minimal()
    })
  })
}
