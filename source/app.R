# TO RUN SHINY APP, DO THESE STEPS FIRST:
# 1) set working directory to the "Source" folder
# 2) install.packages("pacman") (if you don't have it installed already)
# 3) run all lines of code in "app.R" file

library(pacman)

p_load(
  rsconnect, dplyr, ggplot2, shiny, reshape2, tidyverse,
  data.table, mapdata, ggmap, maps, viridis, DT, plotly,
  gganimate, gifski, shinycssloaders
)

source("server.R")
source("ui.R")

shinyApp(ui = ui, server = server)

deployApp()
