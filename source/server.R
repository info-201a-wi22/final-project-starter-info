# ------ DELETING LATER, PLEASE READ:
# This is for functions only, all UI goes in ui.R file. (please see ui note)

# TO RUN FULL APP, RUN ALL LINES IN "app.R" FILE.

server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  
  
  # ---------- REPORT PAGE ----------
  output$agg_table <- DT::renderDataTable({
    DT::datatable(compare_agg_table)
  })
  
  
  # ---------- SUMMARY PAGE ----------
  chart2_state_selector <- reactive({
    validate(need(input$anch2_state != "Select", "Please select a state."))
    
    data_chart2 %>%
      filter(state == input$anch2_state) %>%
      summarize(
        date,
        `New Cases` = new_case,
        `New Deaths` = new_death
      ) %>%
      reshape2::melt(id = "date") %>%
      rename(
        `Case Type` = variable,
        Census = value
      )  
  })
  
  output$analysis_2 <- renderPlotly({
    ggplot(chart2_state_selector(),
           aes(
             x = date,
             y = Census,
             group = `Case Type`,
             color = `Case Type`
           )
    ) + geom_line(size = 0.6) + 
      scale_color_manual(values = c(
        "royalblue4", "orangered", "darkgoldenrod1", 
        "chartreuse4", "deeppink1"
        )
      ) + ggtitle(paste(input$anch2_state, "COVID-19 Statistics")) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  
  # ---------- INTERACTIVE PAGE 1 ----------
  detect_selector_casedeath <- reactive({
    validate(need(input$case_or_death != "Select", "Please select a statistic."))
  })
  
  output$int1cases_int <- renderPlotly({
    plot_int1_cases
  })
  
  output$int1cases_gif <- renderPlot({
    gif_int1_cases
  })
  
  output$int1deaths_int <- renderPlotly({
    plot_int1_deaths
  })
  
  output$int1deaths_gif <- renderPlot({
    gif_int1_deaths
  })
  
  
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