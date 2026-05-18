# ============================================================
# R/helpers_ui.R
# Bootstrap card/box/valuebox — no shinydashboard needed
# ============================================================

# ---------- bs_box ----------
bs_box <- function(..., title = NULL, status = "default",
                   width = 12, collapsible = FALSE) {
  
  header_bg <- switch(status,
                      success = COL_AMALFI, primary = COL_AMALFI,
                      warning = COL_CITRUS, danger  = "#c0392b",
                      info    = COL_AMALFI, COL_AMALFI
  )
  border_top <- switch(status,
                       success = COL_CITRUS, primary = COL_AMALFI,
                       warning = COL_CITRUS, danger  = "#e74c3c",
                       info    = COL_BREEZE, COL_AMALFI
  )
  
  header_html <- if (!is.null(title)) {
    tags$div(
      class = "bs-box-header",
      style = paste0("background:", header_bg, "; color:white;",
                     "padding:10px 14px; border-radius:6px 6px 0 0;",
                     "font-weight:600; font-size:14px; letter-spacing:0.2px;"),
      title
    )
  }
  
  tags$div(
    style = paste0("border-radius:8px; margin-bottom:18px;",
                   "box-shadow:0 2px 10px rgba(46,90,167,0.10);",
                   "border-top:3px solid ", border_top, ";",
                   "background:#fff;"),
    header_html,
    tags$div(style = "padding:12px 14px;", ...)
  )
}

# ---------- bs_tab_box ----------
bs_tab_box <- function(tabs, id = "tabs", width = 12) {
  tab_names <- names(tabs)
  rand_id   <- paste0(id, "_", sample(1000:9999, 1))
  
  nav_items <- lapply(seq_along(tabs), function(i) {
    tags$li(
      class = if (i == 1) "active" else "",
      tags$a(`data-toggle` = "tab",
             href = paste0("#", rand_id, "_", i),
             tab_names[i])
    )
  })
  
  panes <- lapply(seq_along(tabs), function(i) {
    tags$div(
      class = paste0("tab-pane", if (i == 1) " active" else ""),
      id    = paste0(rand_id, "_", i),
      style = "padding-top:10px;",
      tabs[[i]]
    )
  })
  
  tags$div(
    style = paste0("border-radius:8px; margin-bottom:18px;",
                   "box-shadow:0 2px 10px rgba(46,90,167,0.10);",
                   "border-top:3px solid ", COL_CITRUS, ";",
                   "background:#fff;"),
    tags$div(
      style = "padding:0 14px;",
      tags$ul(class = "nav nav-tabs", style = "margin-bottom:0;", nav_items)
    ),
    tags$div(class = "tab-content", style = "padding:0 14px 12px;", panes)
  )
}

# ---------- bs_value_box ----------
bs_value_box <- function(value, subtitle, icon_tag = NULL, color = "blue") {
  bg <- switch(color,
               blue   = COL_AMALFI, teal   = COL_AMALFI,
               green  = "#27ae60",  yellow = COL_CITRUS,
               orange = COL_CITRUS, red    = "#c0392b",
               COL_AMALFI
  )
  tags$div(
    style = paste0("background:", bg, "; color:white; border-radius:8px;",
                   "padding:16px 18px; margin-bottom:16px; position:relative;",
                   "box-shadow:0 2px 10px rgba(46,90,167,0.15);",
                   "transition:transform 0.15s ease;"),
    tags$div(style = "font-size:26px; font-weight:700; line-height:1.2;", value),
    tags$div(style = "font-size:12px; opacity:0.88; margin-top:4px;", subtitle),
    if (!is.null(icon_tag))
      tags$div(style = "position:absolute; right:14px; top:50%;
                        transform:translateY(-50%); font-size:36px; opacity:0.22;",
               icon_tag)
  )
}

# ---------- icon_link ----------
icon_link <- function(href, icon_class, label) {
  tags$a(href = href, target = "_blank", class = "team-icon-link team-icon-only",
         title = label,
         tags$i(class = icon_class))
}

# ---------- student_card ----------
student_card <- function(img, name, email = NULL, github_url = NULL,
                         website_url = NULL, linkedin_url = NULL) {
  tags$div(
    class = "team-card",
    tags$div(class = "team-photo-wrap",
             tags$img(src = img, class = "team-photo", alt = name)),
    tags$h3(class = "team-name", name),
    tags$div(
      class = "team-links",
      if (!is.null(email))
        icon_link(paste0("mailto:", email), "fas fa-envelope", "Email"),
      if (!is.null(github_url))
        icon_link(github_url, "fab fa-github", "GitHub"),
      if (!is.null(website_url))
        icon_link(website_url, "fas fa-globe", "Website"),
      if (!is.null(linkedin_url))
        icon_link(linkedin_url, "fab fa-linkedin", "LinkedIn")
    )
  )
}

# ---------- advisor_card ----------
advisor_card <- function(img, name, title, affiliation, bio, url,
                         email = NULL, github_url = NULL,
                         website_url = NULL, linkedin_url = NULL) {
  tags$div(
    class = "advisor-card",
    tags$div(class = "advisor-photo-wrap",
             tags$img(src = img, class = "advisor-photo", alt = name)),
    tags$div(
      class = "advisor-info",
      tags$h3(class = "advisor-name",
              tags$a(href = url, target = "_blank", class = "advisor-name-link", name)),
      tags$p(class = "advisor-title", title),
      tags$p(class = "advisor-affiliation", affiliation),
      tags$p(class = "advisor-bio", bio),
      tags$div(
        class = "team-links",
        style = "margin-top: 14px;",
        if (!is.null(email))
          icon_link(paste0("mailto:", email), "fas fa-envelope", "Email"),
        if (!is.null(github_url))
          icon_link(github_url, "fab fa-github", "GitHub"),
        if (!is.null(website_url))
          icon_link(website_url, "fas fa-globe", "Website"),
        if (!is.null(linkedin_url))
          icon_link(linkedin_url, "fab fa-linkedin", "LinkedIn")
      )
    )
  )
}