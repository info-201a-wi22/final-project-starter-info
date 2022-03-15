# TO RUN SHINY APP, DO THESE STEPS FIRST:
# 1) set working directory to the "Source" folder
# 2) install.packages("pacman") (if you don't have it installed already)
# 3) run all lines of code in "app.R" file

library(rsconnect)
library(dplyr)
library(ggplot2)
library(shiny)
library(reshape2)
library(tidyverse)
library(data.table)
library(mapdata)
library(ggmap)
library(maps)
library(viridis)
library(DT)
library(plotly)
library(gganimate)
library(gifski)
library(shinycssloaders)

source("interactive_2.R")
source("Exploratory_Analysis_AggregatedTable.R")
source("Exploratory_Analysis_FirstChart.R")
source("Exploratory_Analysis_SecondChart.R")
source("interactive_1.R")
source("shiny_paragraphs.R")

source("server.R")
source("ui.R")

shinyApp(ui = ui, server = server)

