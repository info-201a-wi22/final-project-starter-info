#library(pacman)

#p_load(
#  rsconnect, dplyr, ggplot2, shiny, reshape2, tidyverse,
#  data.table, mapdata, ggmap, maps, viridis, DT, plotly,
#  gganimate, gifski, shinycssloaders
#)


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
library(mapproj)

source("testing_paragraphs.R")
source("testing_interactive2.R")
source("testing_agg_table.R")
source("testing_expl_first_chart.R")
source("testing_expl_second_chart.R")
source("testing_interactive1.R")

source("testing_ui.R")
source("testing_server.R")

#run_as shiny;

shinyApp(ui, server)


# NOTES ----

# INTRODUCTION PAGE - WORKING
#   no coding variables
# 
# 
# REPORT PAGE - WORKING
#   index & aggregate table
# 
# 
# SUMMARY PAGE - SEMI WORKS
#   takeaways
#   first analysis chart - works
#   
#   second analysis chart - does not work
#     relies on interactive 2:
#       General_Population
#       data_int2
#       
# 
# INTERACTIVE 1 - WORKING
#   mapping GIF cases vs deaths 
#   int1_cases/deaths, plot_int1_cases/deaths, gif_int1_cases/deaths
# 
# 
# INTERACTIVE 2 - NOT WORKING
#   data_int2
#   state_coords
#   General_Population
# 