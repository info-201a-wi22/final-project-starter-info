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