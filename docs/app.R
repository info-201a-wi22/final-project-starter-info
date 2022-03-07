library(pacman) # <- for loading multiple libraries at once

p_load(
  rsconnect, dplyr, ggplot2, shiny, reshape2, tidyverse,
  data.table, mapdata, ggmap, maps, viridis, DT, plotly
)

source("Exploratory_Analysis_SecondChart.R")
source("server.R")
source("ui.R")

shinyApp(ui, server)