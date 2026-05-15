# server
server <- function(input, output) {
  
  # build leaflet map ----
  output$dam_map_output <- renderLeaflet({
    
    leaflet(data = results_sf) %>% 
      addProviderTiles(providers$Esri.WorldPhysical) %>% # Tile 
      # Add Markers
      addCircleMarkers(
        radius = 6,
        
        # Pop up messages
        popup = paste0(
          "<b>Dam_ID: ", results_sf$dam_id, "</b><br>", 
          "<b>Connectivity Category: </b>", results_sf$connectivity_category, "<br>", 
          "<b>CSI: </b>", results_sf$csi, "<br>", 
          "<b>In a PA: </b>", results_sf$in_protected_area, "<br>",
          "<b>Capacity: </b>", results_sf$capacity_mw, "mw", "<br>",
          "<b> Weighted Sum Model Score: </b>", round(results_sf$wsm_scores, 3)
        ))
  })
  
  # ggplot renderPlot
  output$barplot <- renderPlot({
    results_sf %>% 
      filter(!is.na(connectivity_category)) %>% 
      ggplot(aes(x = connectivity_category)) + 
      geom_bar() +
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
