#setwd("C:/Users/ebaca/Desktop/School/final-project-starter-info/source")

library(pacman) # <- for loading multiple libraries at once

p_load(
  rsconnect, dplyr, ggplot2, shiny, reshape2, tidyverse,
  data.table, mapdata, ggmap, maps, viridis, DT, plotly,
  readxl
)

source("../docs/Exploratory_Analysis_SecondChart.R")
source("interactive_1.R")
source("interactive_2.R")

# source these last:
source("server.R")
source("ui.R")

shinyApp(ui, server)
