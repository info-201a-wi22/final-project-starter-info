library(dplyr)
library(ggplot2)

data <- read.csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
View(data)

colnames(data)[1] <- "Date"
data$date <- as.Date(data$Date, "%m/%d/%Y")
data$date
class(data$date)

colnames(data)

# comparing total numbers ----
data_total <- 
  data %>%
  filter(! Location %in% c(
    "BP2", "DD2", "FM", "IH2","VA2"
  )) %>%
  summarize(
    Date,
    State = Location, 
    `Total Distributed` = Distributed,
    `Total Administered` = Administered,
    
  )

# comparing numbers in age groups based on jurisdiction (state) ----
data_5plus <- 
  data %>%
  filter(! Location %in% c(
    "BP2", "DD2", "FM", "IH2","VA2"
  )) %>%
  summarize(
    Date, 
    State = Location, 
    `Total Administered` = Administered_5Plus,
  )

data_12plus <-
  data %>%
  filter(! Location %in% c(
    "BP2", "DD2", "FM", "IH2","VA2"
  )) %>%
  summarize(
    Date, 
    State = Location, 
    `Total Administered` = Administered_12Plus,
  )

data_18plus <-
  data %>%
  filter(! Location %in% c(
    "BP2", "DD2", "FM", "IH2","VA2"
  )) %>%
  summarize(
    Date, 
    State = Location, 
    `Total Administered` = Administered_18Plus,
  )

data_65plus <-
  data %>%
  filter(! Location %in% c(
    "BP2", "DD2", "FM", "IH2","VA2"
  )) %>%
  summarize(
    Date, 
    State = Location, 
    `Total Administered` = Administered_65Plus,
  )

# `recentdata` compares population of a county and percentage of that population
# with at least 1 dose of the vaccine. Includes general population (i.e. consensus
# population) and general vaccinated percentage, along with statistics by age groups:
# 5+, 12+, 18+, and 65+. 

wa_state_data <-
  recentdata %>%
  filter(state == "WA")
View(wa_state_data)

ggplot(wa_state_data, aes(x=county, y=state_vax_pct)) +
  geom_point(size=2, shape=20)

# This scatter plot compares counties in WA state to the percentages of those county
# populations with at least 1 dose of the vaccine. Data is pulled from the most 
# recent date where vaccinations have been recorded.
