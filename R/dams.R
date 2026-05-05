# ============================================================
# R/dams.R — Dams tab (PLACEHOLDER)
# Full-page leaflet map with draggable filter panel
# ============================================================

dams_ui <- function(id) {
  ns <- NS(id)

  tagList(
    # Expand map to fill entire panel (subtract navbar height)
    tags$style(type = "text/css",
      paste0("#", ns("dam_map_output"),
             " {height: calc(100vh - 62px) !important;}")),

    # Full-width leaflet map
    leafletOutput(ns("dam_map_output"), width = "100%", height = "100%"),

    # Draggable control panel
    absolutePanel(
      draggable = TRUE,
      top    = 70,
      left   = "auto",
      right  = 20,
      bottom = "auto",
      width  = 330,
      height = "auto",
      class  = "dam-control-panel",

      tags$h4(class = "dam-panel-title",
              tags$i(class = "fas fa-filter"), " Filter Dams"),

      sliderInput(
        ns("range"),
        label = "Magnitude Range",
        min   = min(quakes$mag),
        max   = max(quakes$mag),
        value = range(quakes$mag),
        step  = 0.1
      ),

      selectInput(
        ns("colors"),
        label   = "Color Scheme",
        choices = rownames(subset(brewer.pal.info,
                                  category %in% c("seq", "div")))
      ),

      checkboxInput(ns("legend"), "Show legend", TRUE),

      plotOutput(ns("histCentile"),          height = 200),
      plotOutput(ns("scatterCollegeIncome"), height = 250)
    )
  )
}

dams_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # ---- Reactive filtered data ----
    filteredData <- reactive({
      quakes[quakes$mag >= input$range[1] &
               quakes$mag <= input$range[2], ]
    })

    # ---- Colour palette ----
    colorpal <- reactive({
      colorNumeric(input$colors, quakes$mag)
    })

    # ---- Base map ----
    output$dam_map_output <- renderLeaflet({
      leaflet(quakes) %>%
        addProviderTiles(providers$CartoDB.Positron) %>%
        fitBounds(~min(long), ~min(lat), ~max(long), ~max(lat))
    })

    # ---- Update circles on filter change ----
    observe({
      pal <- colorpal()
      leafletProxy(ns("dam_map_output"), data = filteredData()) %>%
        clearShapes() %>%
        addCircles(
          radius      = ~10^mag / 10,
          weight      = 1,
          color       = "#333",
          fillColor   = ~pal(mag),
          fillOpacity = 0.7,
          popup       = ~paste0("<b>Magnitude:</b> ", mag,
                                "<br/><b>Depth:</b> ", depth, " km")
        )
    })

    # ---- Legend ----
    observe({
      proxy <- leafletProxy(ns("dam_map_output"), data = quakes)
      proxy %>% clearControls()
      if (input$legend) {
        pal <- colorpal()
        proxy %>% addLegend(
          position = "bottomleft",
          pal      = pal,
          values   = ~mag,
          title    = "Magnitude"
        )
      }
    })

    # ---- Histogram ----
    output$histCentile <- renderPlot({
      if (nrow(filteredData()) == 0) return(NULL)
      mag <- filteredData()$mag
      par(mar = c(3, 3, 1, 1), bg = "white")
      hist(mag,
           col    = "#2E5AA7",
           border = "white",
           main   = "",
           xlab   = "Magnitude",
           breaks = 12)
      abline(v = mean(mag), col = "#FFA62B", lwd = 2, lty = 2)
    }, bg = "white")

    # ---- Scatter ----
    output$scatterCollegeIncome <- renderPlot({
      if (nrow(filteredData()) == 0) return(NULL)
      d <- filteredData()
      par(mar = c(4, 4, 1, 1), bg = "white")
      plot(d$depth, d$mag,
           pch   = 19,
           col   = adjustcolor("#2E5AA7", alpha.f = 0.5),
           xlab  = "Depth (km)",
           ylab  = "Magnitude",
           main  = "")
    }, bg = "white")
  })
}
