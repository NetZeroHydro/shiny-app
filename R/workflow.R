# ============================================================
# R/workflow.R — Workflow tab
# Primary: netzerohydro_workflow_final.png with 3-phase text
# Secondary: cascade.png with caption
# ============================================================

workflow_ui <- function(id) {
  ns <- NS(id)

  tagList(
    tags$div(
      class = "wf-page",

      # ---- Page header ----
      tags$div(
        class = "wf-page-header",
        tags$h1(class = "wf-page-title", "Workflow"),
        tags$p(class = "wf-page-subtitle",
          "A three-phase approach: small-scale model development, global scale-up,
           and interactive dashboard deployment."
        )
      ),

      # ============================================================
      # PRIMARY SECTION: workflow diagram + phase descriptions
      # ============================================================
      tags$div(
        class = "wf-primary-section",

        # Diagram — full width, prominent
        tags$div(
          class = "wf-diagram-wrap",
          tags$img(
            src   = "img/netzerohydro_workflow_final.png",
            class = "wf-diagram-img",
            alt   = "NetZeroHydro Workflow Diagram"
          )
        ),

        # Three phase cards below the diagram
        tags$div(
          class = "wf-phase-grid",

          # Phase 1
          tags$div(
            class = "wf-phase-card",
            tags$div(class = "wf-phase-badge", "Phase 1"),
            tags$h3(class = "wf-phase-title", "Small-Scale Model Development"),
            tags$p(class = "wf-phase-body",
              "The model was developed and tested at a small scale using Nepal as a
               case study. Data was accessed from several global sources including
               HydroRIVERS, HydroBASINS, Free-Flowing Rivers, Global Dam Watch,
               Protected Planet, and WorldPop and stored on the Bren server. A river
               network was built by combining dam locations with river connectivity
               data. From this, dam cascades were calculated and each site was
               assigned a connectivity category. The model took combined connectivity
               metrics as inputs and produced a sustainability score for each dam
               site. The model was then tested and validated through sensitivity
               testing, and results were visualized in a dam suitability map."
            )
          ),

          # Phase 2
          tags$div(
            class = "wf-phase-card",
            tags$div(class = "wf-phase-badge wf-phase-badge-2", "Phase 2"),
            tags$h3(class = "wf-phase-title", "Global Scale-Up"),
            tags$p(class = "wf-phase-body",
              "The validated model was scaled up to the global level, applying the
               same analytical approach to future dams globally. This phase extended
               the Nepal case study to all river basins worldwide, generating
               connectivity categories and sustainability scores for over 3,700
               planned dam sites across every continent."
            )
          ),

          # Phase 3
          tags$div(
            class = "wf-phase-card",
            tags$div(class = "wf-phase-badge wf-phase-badge-3", "Phase 3"),
            tags$h3(class = "wf-phase-title", "Interactive Web Dashboard"),
            tags$p(class = "wf-phase-body",
              "An interactive web dashboard was built using R and the Shiny package.
               The dashboard was developed in three steps: building the layout,
               integrating the model outputs, and deploying the final tool. The
               project was finalized by creating metadata, organizing all materials
               on GitHub, and publishing technical documentation."
            )
          )
        )
      ),

      # ============================================================
      # SECONDARY SECTION: cascade diagram + caption
      # ============================================================
      tags$div(
        class = "wf-secondary-section",

        tags$div(
          class = "wf-secondary-header",
          tags$span(class = "wf-secondary-badge",
                    tags$i(class = "fas fa-sitemap"), " Connectivity Categories"),
          tags$h2(class = "wf-secondary-title", "Dam Cascade Classification")
        ),

        tags$div(
          class = "wf-cascade-wrap",

          # Cascade image
          tags$div(
            class = "wf-cascade-img-col",
            tags$img(
              src   = "img/cascade.png",
              class = "wf-cascade-img",
              alt   = "Cascade Classification Diagram"
            )
          ),

          # Caption / legend
          tags$div(
            class = "wf-cascade-caption-col",

            tags$p(class = "wf-cascade-caption",
              "Schematic illustration of how future dams are categorized based on
               their position within a river network. Red triangles represent future
               dams and purple triangles represent existing dams."
            ),

            # Legend items
            tags$div(
              class = "wf-legend",

              tags$div(class = "wf-legend-item",
                tags$span(class = "wf-legend-dot wf-legend-cascade1"),
                tags$div(
                  tags$strong("Classic Cascade"),
                  tags$span(class = "wf-legend-desc",
                    "Dams placed on the main river channel between existing dams.")
                )
              ),
              tags$div(class = "wf-legend-item",
                tags$span(class = "wf-legend-dot wf-legend-cascade2"),
                tags$div(
                  tags$strong("Classic Cascade Level 1"),
                  tags$span(class = "wf-legend-desc",
                    "Dams on the first level of tributaries adjacent to existing infrastructure.")
                )
              ),
              tags$div(class = "wf-legend-item",
                tags$span(class = "wf-legend-dot wf-legend-cascade3"),
                tags$div(
                  tags$strong("Classic Cascade Level 2+"),
                  tags$span(class = "wf-legend-desc",
                    "Dams on more distant tributaries, two or more trunks from existing dams.")
                )
              ),
              tags$div(class = "wf-legend-item",
                tags$span(class = "wf-legend-dot wf-legend-protected"),
                tags$div(
                  tags$strong("Fatal Flaw"),
                  tags$span(class = "wf-legend-desc",
                    "The green polygon represents a protected area, overlap triggers a fatal flaw flag.")
                )
              ),
              tags$div(class = "wf-legend-item",
                tags$span(class = "wf-legend-dot wf-legend-ffr"),
                tags$div(
                  tags$strong("Free-Flowing River (FFR)"),
                  tags$span(class = "wf-legend-desc",
                    "Dams with no existing dams within a set distance threshold, highest ecological sensitivity.")
                )
              )
            )
          )
        )
      )
    ) # end wf-page
  )
}

workflow_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Static page — no server logic needed
  })
}
