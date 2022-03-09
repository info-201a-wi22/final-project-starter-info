library("tidyverse")
library("ggplot2")

dataset <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-info/main/data/covid-vaccination-vs-death_ratio.csv")
dataset$date <- as.Date(dataset$date, "%Y-%m-%d")

anch1_chart <-
  dataset %>%
  filter(country == "United States of America") %>%
  ggplot(aes(x = date, y = New_deaths, colour = country)) +
  geom_point(size = 5, alpha = 0.2) +
  geom_line(size = 1) +
  theme_minimal() +
  labs(title = "COVID Fatalities in The US")
