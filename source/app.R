library(pacman)

p_load(
  rsconnect, dplyr, ggplot2, shiny, reshape2, tidyverse, data.table, mapdata,
  ggmap, maps, viridis, DT, plotly, gganimate, gifski, shinycssloaders
)

source("interactive_2.R")
source("Exploratory_Analysis_AggregatedTable.R")
source("Exploratory_Analysis_FirstChart.R")
source("Exploratory_Analysis_SecondChart.R")
source("interactive_1.R")
source("shiny_paragraphs.R")

source("server.R")
source("ui.R")

shinyApp(ui = ui, server = server)

