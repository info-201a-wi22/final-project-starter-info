
# hi, checkout if you want to use this code- I had it for the second exploratory
# analysis chart but I thought it's probably better suited for the first interactive
# (i recommend running the library code in app.R before this file or you might get
# a spam of png downloads in your local files)

# feel free to use it & to make it more interactive- I guess j make it so the 
# user can decide which states or group of lines are being plotted (cases or deaths)
# & if they want the plotly line graph displayed or the gganimate

# if you need help just shoot me a text! or I can just finish this off while you
# work on something else, whatever works idrc

# thanks! -E



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
