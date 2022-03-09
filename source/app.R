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

source("interactive_2.R")
source("../docs/Exploratory_Analysis_AggregatedTable.R")
source("../docs/Exploratory_Analysis_FirstChart.R")
source("../docs/Exploratory_Analysis_SecondChart.R")
source("interactive_1.R")
source("../docs/shiny_paragraphs.R")


# source these last (or there will be errors):
source("server.R")
source("ui.R")

shinyApp(ui = ui, server = server)

