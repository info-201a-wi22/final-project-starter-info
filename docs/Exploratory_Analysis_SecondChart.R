
data_chart2 <- 
  read.csv("https://data.cdc.gov/api/views/9mfq-cb36/rows.csv?accessType=DOWNLOAD") %>%
  rename(date = submission_date) %>%
  subset(select = -c(created_at, consent_cases, consent_deaths))
data_chart2$date <- as.Date(data_chart2$date, "%m/%d/%Y")

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

plot_wa_chart2 <- ggplot(test_data_chart2,
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

