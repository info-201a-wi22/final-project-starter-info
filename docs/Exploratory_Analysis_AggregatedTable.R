load_agg_table <- read.csv("https://github.com/info-201a-wi22/final-project-starter-info/raw/main/data/covid-vaccination-vs-death_ratio.csv")

earlycountries <- 
  load_agg_table %>%
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
  load_agg_table %>%
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

compare_agg_table <- 
  left_join(latecountries, earlycountries, by = "country") %>%
  mutate(
    time_passed = as.Date(recent_date) - as.Date(early_date),
    ratio_diff = ratio.x - ratio.y,
    vax_change = total_vaccinations.x - total_vaccinations.y,
    death_change = New_deaths.x - New_deaths.y
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
View(compare_agg_table)

us_info <- compare_agg_table[(compare_agg_table$country == "United States of America"), ]
us_info
