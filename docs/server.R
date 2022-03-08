server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  
  # ---------- INTERACTIVE PAGE 1 ----------
  
  # ---------- INTERACTIVE PAGE 2 ----------
  genpop_selector <- reactive({
    validate(
      need(input$vax_status_selector != "Select", "Please select a vaccination status.")
    )
    
    General_Population %>%
      filter(Date == input$date_selector)
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
      ) + coord_map() + scale_fill_viridis(option = "magma") +
      labs(fill = "Census") +
      ggtitle(paste(input$vax_status_selector, "Population For", input$date_selector))
  })
  
  # FIX: 
  # Warning: Error in : Discrete value supplied to continuous scale
  
  # ---------- SUMMARY PAGE ----------
  
  # ---------- REPORT PAGE ----------
}