server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  
  # ---------- INTERACTIVE PAGE 1 ----------
  
  # ---------- INTERACTIVE PAGE 2 ----------
  genpop_selector <- reactive({
    req(input$date_selector)
    req(input$vax_status_selector)
    filter(General_Population, Date %in% input$date_selector) %>%
      select(Date, State, input$vax_status_selector)
  })
  
  output$genpop <- renderPlotly({
    input$date_selector
    input$vax_status_selector
    genpop_selector()
    genpop_selector() <- state_coords %>% left_join(genpop_selector(), by = "State")
    
    ggplot(genpop_selector()) +
      geom_polygon(
        mapping = aes(
          x = long,
          y = lat,
          group = group,
          fill = genpop_selector()[, input$vax_status_selector]
        )
      ) + coord_map() + scale_fill_viridis(option = "viridis") +
      labs(fill = "Population") +
      ggtitle(paste(input$vax_status_selector, "status on", input$date_selector))
  })
  
  # ---------- SUMMARY PAGE ----------
  
  # ---------- REPORT PAGE ----------
}