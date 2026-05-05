# ============================================================
# R/about_data.R — About Data tab
# Six dataset cards: GDW, FHReD, FFR, HydroRIVERS,
#                    HydroBASINS, Protected Planet
# ============================================================

about_data_ui <- function(id) {
  ns <- NS(id)

  data_card <- function(icon_class, number, name, abbr = NULL,
                        body, url, url_label) {
    tags$div(
      class = "ad-card",
      tags$div(
        class = "ad-card-top",
        tags$span(class = "ad-number", number),
        tags$i(class = paste(icon_class, "ad-card-icon"))
      ),
      tags$div(
        class = "ad-card-title-wrap",
        tags$h3(class = "ad-card-name", name),
        if (!is.null(abbr)) tags$span(class = "ad-card-abbr", abbr)
      ),
      tags$p(class = "ad-card-body", body),
      tags$div(
        class = "ad-card-footer",
        tags$a(href = url, target = "_blank", class = "ad-link",
               tags$i(class = "fas fa-external-link-alt"), " ", url_label)
      )
    )
  }

  tagList(
    tags$div(
      class = "ad-page",

      tags$div(
        class = "ad-page-header",
        tags$div(
          class = "ad-page-header-left",
          tags$h1(class = "ad-page-title", "About the Data"),
          tags$p(class = "ad-page-subtitle",
            "This project uses six openly available, globally recognized datasets covering existing dams, planned projects, river systems, and protected areas."
          )
        ),
        tags$div(
          class = "ad-page-header-badge",
          tags$span(class = "ad-count-badge", "6"),
          tags$span(class = "ad-count-label", "Datasets")
        )
      ),

      tags$div(
        class = "ad-grid",

        data_card(
          icon_class = "fas fa-database",
          number     = "01",
          name       = "Global Dam Watch",
          abbr       = "GDW",
          body       = "A comprehensive database of existing dams and reservoirs
                        worldwide, standardizing multiple historical datasets into
                        a single resource covering locations, physical characteristics,
                        and operational status. For DamPlan, GDW provides the baseline
                        inventory of current hydropower infrastructure, establishing
                        where dams already exist before evaluating future sites.",
          url        = "https://www.globaldamwatch.org/database",
          url_label  = "globaldamwatch.org/database"
        ),

        data_card(
          icon_class = "fas fa-water",
          number     = "02",
          name       = "Future Hydropower Reservoirs and Dams",
          abbr       = "FHReD",
          body       = "Contains data on over 3,700 planned and future hydropower
                        projects with a capacity of at least 1 MW, including location,
                        hydropower capacity, and proposed construction timelines.
                        This dataset is central to DamPlan, it identifies the future
                        dam sites evaluated for environmental suitability.",
          url        = "https://www.globaldamwatch.org/fhred",
          url_label  = "globaldamwatch.org/fhred"
        ),

        data_card(
          icon_class = "fas fa-stream",
          number     = "03",
          name       = "Free Flowing Rivers",
          abbr       = "FFR",
          body       = "Classifies rivers worldwide by how connected and uninterrupted
                        their flow remains from source to sea, assigning each segment
                        a connectivity status index ranging from fully free-flowing to
                        severely disrupted. Used to flag proposed dam sites that would
                        fragment rivers currently identified as free-flowing, among
                        the most ecologically sensitive locations for new infrastructure.",
          url        = "https://www.nature.com/articles/s41586-019-1111-9",
          url_label  = "nature.com · Grill et al. 2019"
        ),

        data_card(
          icon_class = "fas fa-project-diagram",
          number     = "04",
          name       = "HydroRIVERS",
          abbr       = "HydroRIVER",
          body       = "A global river network dataset mapping waterways at approximately
                        500-metre resolution. Each segment includes hydrological attributes
                        such as flow volume and upstream drainage area. HydroRIVERS
                        provides the spatial river layer for overlaying dam locations
                        and assessing their position within the broader river network.",
          url        = "https://www.hydrosheds.org/products/hydrorivers",
          url_label  = "hydrosheds.org/products/hydrorivers"
        ),

        data_card(
          icon_class = "fas fa-th-large",
          number     = "05",
          name       = "HydroBASINS",
          abbr       = "HydroBASIN",
          body       = "Divides the world's land surface into a hierarchical set of
                        sub-basin units, from large continental basins down to small
                        local catchments. Each unit captures the land draining to a
                        common outlet. Used to organize analysis by watershed, enabling
                        comparisons of dam density and cumulative impacts within
                        shared drainage areas.",
          url        = "https://www.hydrosheds.org/products/hydrobasins",
          url_label  = "hydrosheds.org/products/hydrobasins"
        ),

        data_card(
          icon_class = "fas fa-shield-alt",
          number     = "06",
          name       = "Protected Planet",
          abbr       = "WDPA & OECM",
          body       = "The global database of protected areas and Other Effective
                        Area-based Conservation Measures (OECMs), jointly maintained
                        by UNEP and IUCN through UNEP-WCMC. Includes spatial boundaries,
                        protection category, governance type, and year of establishment.
                        Used to identify locations where proposed dams overlap with
                        legally protected land, treated as critical conflict zones
                        in our suitability assessment.",
          url        = "https://www.protectedplanet.net/en",
          url_label  = "protectedplanet.net"
        )
      )
    )
  )
}

about_data_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
