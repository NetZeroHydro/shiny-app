# ============================================================
# ui.R — DamPlan Dashboard
# ============================================================

ui <- fluidPage(

  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/custom.css"),
    tags$link(rel = "stylesheet",
              href = "https://fonts.googleapis.com/css2?family=Cormorant:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400&display=swap"),
    tags$link(rel = "stylesheet",
              href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1")
  ),

  # ---- Top Navbar ----
  tags$nav(
    class = "vis-navbar",
    tags$div(class = "vis-brand",
             tags$span(class = "brand-dam",  "Dam"),
             tags$span(class = "brand-plan", "Plan")),
    tags$div(style = "flex: 1;"),
    tags$ul(
      class = "vis-nav-tabs", id = "main_nav",
      tags$li(class = "vis-nav-item active", id = "nav_intro",
              tags$a("Introduction", onclick = "switchTab('intro')")),
      tags$li(class = "vis-nav-item", id = "nav_aboutdata",
              tags$a("About Data",   onclick = "switchTab('aboutdata')")),
      tags$li(class = "vis-nav-item", id = "nav_workflow",
              tags$a("Workflow",     onclick = "switchTab('workflow')")),
      tags$li(class = "vis-nav-item", id = "nav_dams",
              tags$a("Dams",         onclick = "switchTab('dams')")),
      tags$li(class = "vis-nav-item", id = "nav_glossary",
              tags$a("Glossary",     onclick = "switchTab('glossary')")),
      tags$li(class = "vis-nav-item", id = "nav_team",
              tags$a("Team",         onclick = "switchTab('team')")),
      tags$li(class = "vis-nav-item vis-nav-github",
              tags$a(tags$i(class = "fab fa-github"),
                     href = "https://github.com/NetZeroHydro",
                     target = "_blank", title = "NetZeroHydro on GitHub"))
    )
  ),

  # ---- Content Panels ----
  tags$div(
    class = "vis-content",
    tags$div(id = "panel_intro",     class = "vis-panel active-panel",
             introduction_ui("intro")),
    tags$div(id = "panel_aboutdata", class = "vis-panel",
             about_data_ui("aboutdata")),
    tags$div(id = "panel_workflow",  class = "vis-panel",
             workflow_ui("workflow")),
    tags$div(id = "panel_dams",      class = "vis-panel vis-panel-map",
             dams_ui("dams")),
    tags$div(id = "panel_glossary",  class = "vis-panel",
             tags$div(style = "padding:60px 40px; color:#718096;",
                      tags$h2("Glossary"), tags$p("Glossary coming soon."))),
    tags$div(id = "panel_team",      class = "vis-panel",
             team_ui("team"))
  ),

  tags$footer(
    class = "vis-footer",
    "\u00a9 2026 NetZeroHydro \u00b7 Bren School of Environmental Science & Management \u00b7 UC Santa Barbara"
  ),

  tags$script(HTML("
    function switchTab(tab) {
      document.querySelectorAll('.vis-panel').forEach(function(p){
        p.classList.remove('active-panel');
      });
      document.querySelectorAll('.vis-nav-item').forEach(function(li){
        li.classList.remove('active');
      });
      document.getElementById('panel_' + tab).classList.add('active-panel');
      document.getElementById('nav_'   + tab).classList.add('active');
      Shiny.setInputValue('active_tab', tab, {priority:'event'});
    }
  "))
)
