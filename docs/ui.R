# ---------- INTRODUCTORY PAGE ----------
introductory_page <- tabPanel("Introduction",
  # An introductory page.  This page should provide a brief overview of your project: 
  # What major questions are you seeking to answer and what data will you use to answer 
  # those questions? You should include some "additional flare" on this landing page, 
  # such as an image. The key goal: Invite your audience to consider your project.
  
  h3("A Brief Overview"),
)


# ---------- REPORT PAGE ----------
report_page <- tabPanel("Report",
  # Report page.  Iterate on your P01 and P02 to present your final report. See below.  
  # The key goal: Write a concise, clear, and interesting summary of your project. 
  
  # Put index.rmd file here
  
  h3("Our Process"),
)


# ---------- SUMMARY PAGE ----------
summary_page <- tabPanel("Summary",
  # Summary takeaways, a page that hones in on at least 3 major takeaways from the 
  # project (which should be related to a specific aspect of your analysis). Feel free 
  # to incorporate tables, graphics, or other elements to convey these conclusions. 
  # The key goal: Present the key takeaways for your audience.

  h3("Major Takeaways"),
)


# ---------- INTERACTIVE PAGE 1 ----------
interactive_page_1 <- tabPanel("Counting Cases",
  
  # Three interactive pages.  Each of these pages will consider a different aspect of 
  # your data, addressing specific questions. Each page should have sufficient 
  # interactivity (e.g., Shiny widgets + 1 or more reactive charts) for exploring the 
  # question of interest. If you would prefer to make fewer pages with more complexity, 
  # check with your TA/professor. The key goal: Present visualizations that help your 
  # audience understand your datasets.
  
  # ^^ I talked to Samuel & he said we only need to do two because of our situation
  
  h3("Title"),
  
  p("Insert covid cases data here")
)


# ---------- INTERACTIVE PAGE 2 ----------
interactive_page_2 <- tabPanel("Getting Vaccinated",
  
  # Three interactive pages.  Each of these pages will consider a different aspect of 
  # your data, addressing specific questions. Each page should have sufficient 
  # interactivity (e.g., Shiny widgets + 1 or more reactive charts) for exploring the 
  # question of interest. If you would prefer to make fewer pages with more complexity, 
  # check with your TA/professor. The key goal: Present visualizations that help your 
  # audience understand your datasets.
  
  # ^^ I talked to Samuel & he said we only need to do two because of our situation
  
  h3("Vaccination Status By Age Group"),
  
  fluidPage(
    tabsetPanel(
      tabPanel("General Population"
        # take dataset, filter map by chosen date
      ),
      
      tabPanel("Ages 5+"
        
      ),
      
      tabPanel("Ages 12+"
        
      ),
      
      tabPanel("Ages 18+"
        
      ),
      
      tabPanel("Ages 65+"
        
      )
    )
  )
 
)


# ---------- FORMING UI ----------
ui <- fluidPage(
  navbarPage("Project Vax",
    introductory_page, report_page, summary_page,
    navbarMenu("Explore", interactive_page_1, interactive_page_2)
  )
)