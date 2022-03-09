# ------ DELETING LATER, PLEASE READ ALL:
# Note: pages are individually built starting with tabPanel() which will be combined 
# into fluid UI page on the bottom, please keep format to avoid confusion. Load the
# app to visualize (run the full app.R file & it should open). 

# ALSO: PLEASE PUT LONGER PARAGRAPHS IN "shiny_paragraphs.R" FILE TO MAINTAIN CLEANLINESS
# OF CODING 
# THANKS

# please read ALL COMMENTS within code as well.

# ---------- INTRODUCTORY PAGE ----------
introductory_page <- tabPanel(
  "Introduction", 
  titlePanel("Project Introduction: the Impact of Vaccines"),
  HTML('<center><img src = "https://github.com/info-201a-wi22/final-project-starter-info/blob/9d960dbb4146f8b3dd06e2c8fc195ad3d427b521/Visualization%20for%20Intro.png" width = "500"></center>'),
  p("Project Vax describes the impact of vaccinations on public health through datasets gathered from (datasets). 
       The dataset(s) we are analyzing shows us the rate of vaccinations throughout the world and the mortality rate among 
       those vaccinated and unvaccinated due to COVID-19. Our group was interested in exploring the effectiveness the COVID-19 
       vaccines have on public health  whether the statistics support or oppose the use of the COVID-19 vaccines in the fight 
       against the virus and its variants. The outbreak of the COVID-19 pandemic has greatly disrupted modern life for the past few years. 
       These vaccines can be the key to normality in the near future."),
  p("The dataset(s) we are analyzing shows us the rate of vaccinations across the United States and the infection/mortality rate among 
    those vaccinated and unvaccinated due to COVID-19. Our group is interested in exploring the effectiveness of the COVID-19 vaccines 
    and how the data either supports or opposes the current iterations of the COVID-19 vaccines in the fight against the virus and its variants. 
    The outbreak of the Coronavirus vaccine has greatly disrupted modern life the past few years and these vaccines can be the key to normality within the near future.")
)

# ---------- REPORT PAGE ----------
report_page <- tabPanel("Report",
  
  # PLS FINISH INDEX TAB PANEL AND PUT PARAGRAPH UNDER VARIABLE index.rmd_report
  # IN shiny_paragraphs.R FILE 
  # IF MORE THAN 1 PARAGRAPH IS NECESSARY, PUT EACH PARAGRAPH UNDER A VARIABLE,
  # SHINY DOES NOT AUTOMATICALLY ACCOUNT FOR LINE BREAKS
  
  h3("Our Process"), br(),
  
  tabsetPanel(
    tabPanel("Index", br(), br(),
      p(index.rmd_report) 
    ),
    
    tabPanel("Aggregate Table", br(), br(),
      p(agg_table_report1), br(),
      p(agg_table_report2), br(), br(),
      DT::dataTableOutput("agg_table"),
      br(),
      br(),
      p(agg_table_report3), br(),
      p(agg_table_report4), br(),
      p(agg_table_report5), 
      br(), 
      br()
    )
  )
)


# ---------- SUMMARY PAGE ----------
summary_page <- tabPanel("Summary",
  
  # FINISH CHARTS TABPANELS & MAIN TAKEAWAYS TABPANEL

  h3("Major Takeaways"), br(),
  
  tabsetPanel(
    tabPanel("Takeaways",
      
    ),
    
    tabPanel("Analysis Chart 1",
      # jayden, check the rubric for p02 - samuel left some comments
    ),
    
    tabPanel("Analysis Chart 2",
      fluidPage(
        column(4,
          selectInput("anch2_state", "Select a State",
            choices = c("Select", unique(data_chart2$state)),
            selected = "Select"
          )
        ),
        
        mainPanel(
          plotlyOutput("analysis_2"),
          br(),
          p()
        )
      )
    )
  )
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
      ),
      
      br(),
      
      p(int2_helptext)
    ),
    
    mainPanel(
      plotlyOutput("genpop"),
      br(),
      p(int2_description)
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