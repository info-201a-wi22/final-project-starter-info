server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  
  # ---------- INTERACTIVE PAGE 1 ----------
  
  # ---------- INTERACTIVE PAGE 2 ----------
  genpop_selector <- reactive({
    req(input$vax_status_selector)
    req(input$date_selector)
    
    validate(
      need(input$vax_status_selector != "Select", "Please select a vaccination status.")
    )
    
    General_Population %>%
      filter(Date == as.Date(input$date_selector))
  })
  
  output$genpop <- renderPlotly({
    ggplot(genpop_selector()) +
      geom_polygon(
        mapping = aes(
          x = long,
          y = lat,
          group = group,
          fill = input$vax_status_selector
        )
      ) + coord_map() + scale_fill_viridis(option = "viridis") +
      labs(fill = "Population")
  })
  
  # FIX: 
  # Warning: Error in : Aesthetics must be either length 1 
  # or the same as the data (1): x, y and group
  
  # ---------- SUMMARY PAGE ----------
  
  # ---------- REPORT PAGE ----------
}