library(pacman) # <- for loading multiple libraries at once

p_load(
  rsconnect, dplyr, ggplot2, shiny, reshape2, tidyverse,
  data.table, mapdata, ggmap, maps, viridis, DT, plotly,
  gganimate, gifski
)

# set working directory to "Source" folder
source("interactive_1.R")
source("interactive_2.R")
source("../docs/Exploratory_Analysis_AggregatedTable.R")
source("../docs/Exploratory_Analysis_FirstChart.R")
source("../docs/Exploratory_Analysis_SecondChart.R")
source("../docs/shiny_paragraphs.R")


# source these last (or there will be errors):
source("server.R")
source("ui.R")

shinyApp(ui = ui, server = server)
