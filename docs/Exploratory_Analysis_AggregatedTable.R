library(dplyr)

data <- read.csv("https://github.com/info-201a-wi22/final-project-starter-info/raw/main/data/covid-vaccination-vs-death_ratio.csv")

View(data)

earlycountries <- 
  data %>%
  group_by(country) %>%
  filter(date == min(date)) %>%
  summarize(
    country,
    date,
    total_vaccinations,
    New_deaths,
    ratio
    ) %>%
  rename(early_date = date)

latecountries <- 
  data %>%
  group_by(country) %>%
  filter(date == max(date)) %>%
  summarize(
    country,
    date,
    total_vaccinations,
    New_deaths,
    ratio
  ) %>%
  rename(recent_date = date)

compare <- 
  left_join(latecountries, earlycountries, by = "country") %>%
  mutate(
    time_passed = as.Date(compare$recent_date) - as.Date(compare$early_date),
    ratio_diff = compare$ratio.x - compare$ratio.y,
    vax_change = compare$total_vaccinations.x - compare$total_vaccinations.y,
    death_change = compare$New_deaths.x - compare$New_deaths.y
    ) %>%
  select(
    country,
    early_date,
    recent_date,
    time_passed,
    vax_change,
    death_change,
    ratio_diff
    )
View(compare)

us_info <- compare[(compare$country == "United States of America"), ]
us_info
