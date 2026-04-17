# server
server <- function(input, output) {
  
  # build leaflet map ----
  output$dam_map_output <- renderLeaflet({
    
    leaflet() %>% 
      
      addTiles() %>% setView(42, 16, 4)
    
  })
}
