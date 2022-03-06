# ---------- DEVELOPING PAGES ----------
introductory_page <- tabPanel("Introduction",
  h3("A Brief Overview"),
  
  # An introductory page.  This page should provide a brief overview of your project: 
  # What major questions are you seeking to answer and what data will you use to answer 
  # those questions? You should include some "additional flare" on this landing page, 
  # such as an image. The key goal: Invite your audience to consider your project.
)


interactive_page_1 <- tabPanel(
  
)


interactive_page_2 <- tabPanel(""
  
)


summary_page <- tabPanel("Summary",
  
)


report_page <- tabPanel("Report",
  
)



# ---------- FORMING UI ----------
ui <- fluidPage(
  navbarPage("Project Vax",
    introductory_page, interactive_page_1, interactive_page_2, summary_page, report_page
  )
)