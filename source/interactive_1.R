# ---- Comparing Cases ----
int1_cases <-
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

plot_int1_cases <- 
  ggplot(int1_cases,
  aes(
    x = date,
    y = Census,
    group = `Case Type`,
    color = `Case Type`
  )
) + geom_line(size = 0.6) + 
  scale_color_manual(values = c("royalblue4", "orangered", "darkgoldenrod1")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Case Counts Over Time") 

gif_int1_cases <-
  ggplot(int1_cases,
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


# ---- Comparing Deaths ----
int1_deaths <- 
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

plot_int1_deaths <- 
  ggplot(int1_deaths,
         aes(
           x = date,
           y = Census,
           group = `Case Type`,
           color = `Case Type`
         )
  ) + geom_line(size = 0.6) + 
  scale_color_manual(values = c("royalblue4", "orangered", "darkgoldenrod1")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Death Counts Over Time") 

gif_int1_deaths <-
  ggplot(int1_deaths,
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

