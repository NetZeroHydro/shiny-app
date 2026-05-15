# server
server <- function(input, output) {
  
  # Filter data based on cascade threshold
  filtered_data <- reactive({
    results_sf %>% filter(threshold_k == input$cascade_threshold)
  })
  
  # build leaflet map ----
  output$dam_map_output <- renderLeaflet({
    
    leaflet(data = filtered_data()) %>% 
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
  
  # ggplot renderPlot
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

  # 
  
  # Precalculate the breaks we'll need for the two histograms
  # centileBreaks <- hist(plot = FALSE, allzips$centile, breaks = 20)$breaks
  # 
  # output$histCentile <- renderPlot({
  #   # If no zipcodes are in view, don't plot
  #   if (nrow(zipsInBounds()) == 0)
  #     return(NULL)
  #   
  #   hist(zipsInBounds()$centile,
  #        breaks = centileBreaks,
  #        main = "SuperZIP score (visible zips)",
  #        xlab = "Percentile",
  #        xlim = range(allzips$centile),
  #        col = '#00DD00',
  #        border = 'white')
  # })
  
  # output$scatterCollegeIncome <- renderPlot({
  #   # If no zipcodes are in view, don't plot
  #   if (nrow(zipsInBounds()) == 0)
  #     return(NULL)
  #   
  #   print(xyplot(income ~ college, data = zipsInBounds(), xlim = range(allzips$college), ylim = range(allzips$income)))
  # })
}
