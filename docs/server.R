server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  
  # ---------- INTERACTIVE PAGE 1 ----------
  
  # ---------- INTERACTIVE PAGE 2 ----------
  genpop_selector <- reactive({
    req(input$date_selector)
    req(input$vax_status_selector)
    validate(
      need(input$vax_status_selector != "Select", "Please select a vaccination status.")
    )
    map <- filter(General_Population, Date %in% input$date_selector) %>%
      select(Date, State, input$vax_status_selector) %>%
      left_join(state_coords, map, by = "State")
  })
  
  output$genpop <- renderPlotly({
    req(input$date_selector)
    req(input$vax_status_selector)
    genpop_selector()
    
    ggplot(genpop_selector()) +
      geom_polygon(
        mapping = aes(
          x = long,
          y = lat,
          group = group,
          fill = input$vax_status_selector #fix error
        )
      ) + coord_map() + scale_fill_viridis(option = "viridis") +
      labs(fill = "Population") +
      ggtitle(paste(input$vax_status_selector, "status on", input$date_selector))
  })
  
  # ---------- SUMMARY PAGE ----------
  
  # ---------- REPORT PAGE ----------
}