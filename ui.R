# user interface
ui <- navbarPage(
  
  # title ----
  title = "DamPlan -- Future Hydropower Assessment",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About",
           
           # intro text fluidRow ----
           fluidRow(
             column(11, includeMarkdown("text goes here"))
           ) # END intro text fluidRow
           
  ), # END intro tabPanel
  
  # (Page 2) map tabPanel
  tabPanel(title = "Map",
           
           # tabPanel ----
           tabPanel(
             
             title = "title here",
             
             # sidebarLayout ----
             sidebarLayout(
               
               # sidebarPanel ----
               sidebarPanel(), # END sidebarPanel
               
               # mainPanel ----
               mainPanel(
                 
                 #plotOutput() 
               ) # END mainPanel
               
               
             ) # END sidebarLayout
             
           ) # END tabPanel 
  ), # END (Page 2) map tabPanel
) # END navbarPage