server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  intro_view <- tabPanel(
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
  output$agg_table <- DT::renderDataTable({
    DT::datatable(compare_agg_table)
  })
  
  
  # ---------- SUMMARY PAGE ----------
  output$analysis_2 <- renderPlotly({
    
  })
  
  
  # ---------- INTERACTIVE PAGE 1 ----------
  
  
  # ---------- INTERACTIVE PAGE 2 ----------
  # creating reactive function that will change with user input:
  genpop_selector <- reactive({
    # validate() substitutes as a friendly prompt/error message for input value
    # need() (often used with validate) searches for value of input & reacts accordingly
    validate(
      need(input$vax_status_selector != "Select", "Please select a vaccination status.")
    )
    
    # filtering General_Population with selected date, which will be returned to function
    General_Population %>%
      filter(Date == input$date_selector)
  })
  
  output$genpop <- renderPlotly({
    # to call filtered data frame, pass reactive function as an object with parenthesis
    ggplot(genpop_selector()) +
      geom_polygon(
        mapping = aes(
          x = long,
          y = lat,
          group = group,
          
          # fill with user input, passing a string as data frame column name to .data[[x]]
          fill = .data[[input$vax_status_selector]] 
        )
      ) + coord_map() + scale_fill_viridis(option = "magma") +
      labs(fill = "Census") +
      ggtitle(paste(input$vax_status_selector, "Population For", input$date_selector))
  })
}