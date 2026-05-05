# ============================================================
# R/team.R — Team tab
# Layout: 4 student cards → Acknowledgements → Legal Disclaimer
# ============================================================

team_ui <- function(id) {
  ns <- NS(id)

  icon_link <- function(href, icon_class, label) {
    tags$a(href = href, target = "_blank", class = "team-icon-link team-icon-only",
           title = label,
           tags$i(class = icon_class))
  }

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

  tagList(
    tags$div(
      class = "team-page",

      # ---- Team ----
      tags$div(class = "team-section-header",
               tags$h2(class = "team-section-title team-section-title-lg", "Team")),

      tags$div(
        class = "team-grid",
        student_card(
          img          = "img/aakriti.png",
          name         = "Aakriti Poudel",
          email        = "poudelaakriti@gmail.com",
          github_url   = "https://github.com/aakriti-poudel-chhetri",
          website_url  = "https://aakriti-poudel-chhetri.github.io/",
          linkedin_url = "https://www.linkedin.com/in/aakritipoudel/"
        ),
        student_card(
          img          = "img/leela.png",
          name         = "Leela Dixit",
          email        = "dixitleela@gmail.com",
          github_url   = "https://github.com/lsdixit",
          website_url  = "https://lsdixit.github.io/",
          linkedin_url = "https://www.linkedin.com/in/leela-dixit/"
        ),
        student_card(
          img          = "img/megan.png",
          name         = "Megan Hessel",
          email        = "meghessel11@gmail.com",
          github_url   = "https://github.com/meganhessel",
          website_url  = "https://meganhessel.github.io/",
          linkedin_url = "https://www.linkedin.com/in/meganhessel"
        ),
        student_card(
          img          = "img/lucian.png",
          name         = "Lucian Scher",
          github_url   = "https://github.com/lucianbluescher",
          website_url  = "https://lucianbluescher.com/",
          linkedin_url = "https://www.linkedin.com/in/lucianscher/"
        )
      ),

      # ---- Acknowledgements ----
      tags$div(
        class = "team-ack-section",
        tags$h2(class = "team-section-title team-section-title-lg", "Acknowledgements"),
        tags$div(
          class = "team-ack-box",
          tags$p(class = "team-ack-body",
            "We would like to thank our clients and advisors for their guidance
             and support throughout this project. ", tags$strong("Dr. Jeff Opperman"),
            ", Global Freshwater Lead Scientist at the World Wildlife Fund, provided
             the project vision and contributed invaluable knowledge in freshwater
             conservation. ", tags$strong("Dr. Rafael Schmitt"),
            " of the UCSB Department of Environmental Studies served as our faculty
             advisor, offering direction and feedback from the earliest stages of the
             project through to its completion."
          ),
          tags$p(class = "team-ack-body",
            "We also extend our gratitude to our Capstone Instructor ",
            tags$strong("Dr. Carmen Galaz García"), " and Capstone Teaching Assistant ",
            tags$strong("Allie Caughman"),
            " at the Bren School of Environmental Science & Management for their
             mentorship and continued support throughout this work."
          ),
          tags$p(class = "team-ack-body",
            "This project was completed as part of the Bren School MEDS Capstone
             Program, in partnership with the ",
            tags$strong("World Wildlife Fund"), " and the ",
            tags$strong("Schmitt Lab for River System Science and Sustainability"), "."
          )
        )
      ),

      # ---- Legal Disclaimer ----
      tags$div(
        class = "team-disclaimer-section",

        # Header: scale icon + title + badge
        tags$div(
          class = "disclaimer-header",
          tags$div(
            class = "disclaimer-icon-wrap",
            tags$i(class = "fas fa-balance-scale disclaimer-icon")
          ),
          tags$div(
            class = "disclaimer-title-wrap",
            tags$h2(class = "disclaimer-title", "Legal Disclaimer"),
            tags$span(class = "disclaimer-badge", "For Informational Use Only")
          )
        ),

        # Content
        tags$div(
          class = "disclaimer-body",

          tags$p(class = "disclaimer-text",
            "This dashboard was developed as part of a capstone project for the
             Master of Environmental Data Science program at the ",
            tags$strong("Bren School of Environmental Science & Management,
             University of California, Santa Barbara."),
            " All data were sourced from publicly available and established
             datasets. Analyses were conducted objectively, without bias toward
             any particular outcome."
          ),

          tags$p(class = "disclaimer-text",
            "The suitability scores and dam classifications presented here are
             intended solely for ", tags$strong("informational and research purposes."),
            " They do not represent official assessments, legal determinations,
             or policy recommendations. The categorization of dam sites reflects
             computational outputs based on geospatial and environmental data, ",
            tags$strong("it should not be interpreted as labeling any dam as
             inherently good or bad.")
          ),

          tags$p(class = "disclaimer-text",
            "The developers, the Bren School of Environmental Science & Management,
             the World Wildlife Fund (WWF), and the Schmitt Lab for River System
             Science and Sustainability bear ", tags$strong("no legal responsibility"),
            " for any decisions, actions, or outcomes resulting from the use of
             this dashboard. Users are encouraged to exercise their own judgment
             and consult appropriate experts before drawing conclusions or
             taking action."
          ),

          # Footer strip
          tags$div(
            class = "disclaimer-footer-strip",
            tags$i(class = "fas fa-info-circle"),
            " © 2026 NetZeroHydro · Bren School of Environmental Science & Management · UC Santa Barbara"
          )
        )
      )

    ) # end team-page
  )
}

team_server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
