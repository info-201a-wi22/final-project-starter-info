server <- function(input, output, session){
  # ---------- INTRODUCTORY PAGE ----------
  
  # ---------- INTERACTIVE PAGE 1 ----------
  
  # ---------- INTERACTIVE PAGE 2 ----------
  get_col <- function(dataframe, column) {
    get <- dataframe[, column]
  }
  
  create_map <- function(chosen_date, age_group) {
    map <- age_group %>% filter(Date == (chosen_date))
    `Fully Vaccinated` <- get_col(map, "Fully Vaccinated")
    ggplot(map) +
      geom_polygon(
        mapping = aes(
          x = long,
          y = lat,
          group = group,
          fill = `Fully Vaccinated`
        )
      ) + coord_map() + scale_fill_viridis(option = "viridis") + 
      labs(fill = `Fully Vaccinated`) +
      ggtitle(paste(age_group, "vaccination status for", chosen_date))
  }
  
  output$genpop <- renderPlotly({
    render <- create_map(input$date, General_Population)
    return(render)
  })
  
  # ---------- SUMMARY PAGE ----------
  
  # ---------- REPORT PAGE ----------
}