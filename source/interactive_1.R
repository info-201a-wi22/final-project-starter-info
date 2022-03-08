# let's compare regular count of covid cases &/or mortality rates here, 
# maybe plot a line chart with population, deaths, & new covid cases in US?

data_int1 <- 
  read.csv("https://github.com/info-201a-wi22/final-project-starter-info/raw/main/data/covid-vaccination-vs-death_ratio.csv") %>%
  filter(country == "United States of America") # filtering since we're only doing U.S.
data_int1$date <- as.Date(data_int1$date) # converting to class date

View(data_int1)

# To make it more interactive, make a selectInput() in UI under "INTERACTIVE PAGE 1"
# & have it so user can select which line is displayed (i.e. choosing between 
# population, deaths, new cases, or all). Look at interactive 2 to see what I mean.
# There isn't a column for new cases, so that's up for debate if it's included but I 
# think we should so that there's a more accurate comparison between the numbers in 
# interactive 2. If it's included just look for another data set that includes new 
# case numbers as well & go from there. If you need help making the chart reactive,
# follow my code in the server for interactive 2 (you may need to reference the 
# interactive_2.R file to understand the variables), or just shoot me a text. Thanks!
#    - Emma