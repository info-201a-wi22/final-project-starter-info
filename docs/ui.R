# ---------- DEVELOPING PAGES ----------
introductory_page <- tabPanel("Introduction",
  
)

interactive_page_1 <- tabPanel(
  
)

interactive_page_2 <- tabPanel(
  
)

summary_page <- tabPanel(
  
)

report_page <- tabPanel(
  
)


# ---------- FORMING UI ----------

ui <- fluidPage(
  navbarPage("Project Vax",
    introductory_page, interactive_page_1, interactive_page_2, summary_page, report_page
  )
)