server <- function(input, output, session) {
  # ---------- INTRODUCTORY PAGE ----------
  
  
  # ---------- REPORT PAGE ----------
  output$agg_table <- DT::renderDataTable({
    DT::datatable(compare_agg_table)
  })
  
  
  # ---------- SUMMARY PAGE ----------
  # Analysis Chart 1:
  output$analysis_1 <- renderPlotly({
    anch1_chart
  })
  
  # Analysis Chart 2:
  output$analysis_2 <- renderPlotly({
    General_Population %>% group_by(Date) %>%
      summarize(
        `Total Distributed` = sum(`Total Distributed`),
        `Total Administered` = sum(`Total Administered`)
      ) %>% reshape2::melt(id = "Date") %>% 
      rename(
        Doses = variable,
        Count = value
      ) %>%
      ggplot(
        aes(
          x = Date,
          y = Count,
          group = Doses,
          color = Doses
        )
      ) + geom_line(size = 0.6) + 
      scale_color_manual(values = c("royalblue4", "orangered")) + 
      ggtitle(paste("COVID-19 Vaccine Distribution Statistics"))
  })
  
  
  # ---------- INTERACTIVE PAGE 1 ----------
  output$int1cases_int <- renderPlotly({
    plot_int1_cases
  })
  
  output$int1cases_gif <- renderImage({
    # rendering gganimate GIF to be embeddable
    anim_save("outfile_cases.gif", gif_int1_cases)
    list(src = "outfile_cases.gif", contentType = 'image/gif')
  }, deleteFile = TRUE)
  
  
  output$int1deaths_int <- renderPlotly({
    plot_int1_deaths
  })
  
  output$int1deaths_gif <- renderImage({
    anim_save("outfile_deaths.gif", gif_int1_deaths)
    list(src = "outfile_deaths.gif", contentType = 'image/gif')
  }, deleteFile = TRUE)
  
  
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

