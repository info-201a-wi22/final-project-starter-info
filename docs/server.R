server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  
  # ---------- INTERACTIVE PAGE 1 ----------
  
  # ---------- INTERACTIVE PAGE 2 ----------
  output$genpop <- renderPlotly({
    render <- create_map(input$date, input$vax_status)
    return(render)
  })
  
  # ---------- SUMMARY PAGE ----------
  
  # ---------- REPORT PAGE ----------
}