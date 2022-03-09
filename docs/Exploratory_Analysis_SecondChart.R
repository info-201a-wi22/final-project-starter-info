
data_chart2 <- 
  read.csv("https://data.cdc.gov/api/views/9mfq-cb36/rows.csv?accessType=DOWNLOAD") %>%
  rename(date = submission_date) %>%
  subset(select = -c(created_at, consent_cases, consent_deaths))
data_chart2$date <- as.Date(data_chart2$date, "%m/%d/%Y")


# ---- Comparing Cases ----
## creating dataframe:
chart2_cases <-
  data_chart2 %>%
  group_by(date) %>%
  summarize(
    `Total Cases` = sum(tot_cases, na.rm = TRUE),
    `Confirmed Cases` = sum(conf_cases, na.rm = TRUE),
    `New Cases` = sum(new_case, na.rm = TRUE)
  ) %>% 
  reshape2::melt(id = "date") %>%
  rename(
    `Case Type` = variable,
    Census = value
  )

## mapping plot:
plot_chart2_cases <- ggplot(
  chart2_cases,
  aes(
    x = date,
    y = Census,
    group = `Case Type`,
    color = `Case Type`
  )
) + geom_line(size = 0.6) + 
  scale_color_manual(values = c("royalblue4", "orangered", "darkgoldenrod1")) +
  transition_reveal(date) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Case Counts Over Time") 

## animating with gganimate (run library code in app.R first):
gif_chart2_cases <- 
  animate(
    plot_chart2_cases, 
    fps = 5, 
    end_pause = 2
  )



# ---- Comparing Deaths ----
## creating dataframe:
chart2_deaths <- 
  data_chart2 %>%
  group_by(date) %>%
  summarize(
    `Total Deaths` = sum(tot_death, na.rm = TRUE),
    `Confirmed Deaths` = sum(conf_death, na.rm = TRUE),
    `New Deaths` = sum(new_death, na.rm = TRUE)
  )%>% 
  reshape2::melt(id = "date") %>%
  rename(
    `Case Type` = variable,
    Census = value
  )

## mapping plot:
plot_chart2_deaths <- ggplot(
  chart2_deaths,
  aes(
    x = date,
    y = Census,
    group = `Case Type`,
    color = `Case Type`
  )
) + geom_line(size = 0.6) + 
  scale_color_manual(values = c("royalblue4", "orangered", "darkgoldenrod1")) +
  transition_reveal(date) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Death Counts Over Time") 

## animating with gganimate (run library code in app.R first):
gif_chart2_deaths <- 
  animate(
    plot_chart2_deaths, 
    fps = 5, 
    end_pause = 2
  )

#------

test_data_chart2 <- 
  data_chart2 %>%
  filter(state == "WA") %>%
  summarize(
    date,
    `New Cases` = new_case,
    `New Deaths` = new_death
  ) %>%
  reshape2::melt(id = "date") %>%
    rename(
      `Case Type` = variable,
      Census = value
    )  

ggplot(test_data_chart2,
  aes(
    x = date,
    y = Census,
    group = `Case Type`,
    color = `Case Type`
  )
) + geom_line(size = 0.6) + 
  scale_color_manual(values = c(
    "royalblue4", "orangered", "darkgoldenrod1", 
    "chartreuse4", "deeppink1"
    )
  ) + ggtitle("WA State COVID-19 Statistics") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

