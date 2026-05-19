# ============================================================
# server.R — DamPlan Dashboard
# ============================================================

server <- function(input, output, session) {
  introduction_server("intro")
  about_data_server("aboutdata")
  workflow_server("workflow")
  dams_server("dams")
  team_server("team")
}