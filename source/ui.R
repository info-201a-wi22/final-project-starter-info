
# Note: pages are individually built starting with tabPanel() which will be combined 
# into fluid UI page on the bottom, please keep format to avoid confusion. Load the
# app to visualize (run the full app.R file & it should open). I'm also planning to 
# separate out longer, non-coding paragraphs into a separate document (then calling 
# them via variables) so that the files are cleaner & the code is easier to read. 
# That file will be located in the docs folder as shiny_paragraphs.R

# ---------- INTRODUCTORY PAGE ----------
introductory_page <- tabPanel("Introduction",
  # An introductory page.  This page should provide a brief overview of your project: 
  # What major questions are you seeking to answer and what data will you use to answer 
  # those questions? You should include some "additional flare" on this landing page, 
  # such as an image. The key goal: Invite your audience to consider your project.
  
  h3("A Brief Overview"),
  
  p("Under Construction")
)


# ---------- REPORT PAGE ----------
report_page <- tabPanel("Report",
  # Report page.  Iterate on your P01 and P02 to present your final report. See below.  
  # The key goal: Write a concise, clear, and interesting summary of your project. 
  
  # Put index.rmd file & aggregate table
  
  h3("Our Process"),
  
  p("Under Construction"),
  
  # p() putting more text here
  DT::dataTableOutput("agg_table"),
  # putting more text here
)


# ---------- SUMMARY PAGE ----------
summary_page <- tabPanel("Summary",
  # Summary takeaways, a page that hones in on at least 3 major takeaways from the 
  # project (which should be related to a specific aspect of your analysis). Feel free 
  # to incorporate tables, graphics, or other elements to convey these conclusions. 
  # The key goal: Present the key takeaways for your audience.
  
  # put exploratory analysis charts

  h3("Major Takeaways"),
  
  p("Under Construction")
)


# ---------- INTERACTIVE PAGE 1 ----------
interactive_page_1 <- tabPanel("Counting Cases",
  
  # let's compare regular count of covid cases &/or mortality rates here, I left
  # a note in the interactive_1.R file for some guidance -Emma
  
  h3("Cases/Deaths in the U.S."),
  
  p("Under Construction")
  
  
)


# ---------- INTERACTIVE PAGE 2 ----------
interactive_page_2 <- tabPanel("Getting Vaccinated",
  
  h3("Vaccination Status Of The General Population"), 
  br(),
  
  fluidPage(
    column(4, 
      selectInput("vax_status_selector", "Select a Vaccination Status",
        choices = c("Select", "Single Dosed", "Fully Vaccinated", "Boosted"),
        selected = "Select"
      ),
      
      dateInput("date_selector", "Select a Date",
        
        # The starting date. Either a Date object, or a string in yyyy-mm-dd format.
        value = as.character(max(General_Population$Date)),
        
        # The minimum allowed date. Either a Date object, or a string in yyyy-mm-dd format.
        min = as.character(min(General_Population$Date)), 
        
        # The maximum allowed date. Either a Date object, or a string in yyyy-mm-dd format.
        max = as.character(max(General_Population$Date)) 
      )
    ),
    
    mainPanel(plotlyOutput("genpop"))
  )
 
)


# ---------- FORMING UI ----------
ui <- fluidPage(
  navbarPage("Project Vax",
    introductory_page, report_page, summary_page,
    navbarMenu("Explore", interactive_page_1, interactive_page_2)
  )
)