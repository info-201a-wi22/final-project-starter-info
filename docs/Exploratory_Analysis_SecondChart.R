library(dplyr)
library(ggplot2)

data <- read.csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
View(data)

colnames(data)[1] <- "Date"
data$date <- as.Date(data$Date, "%m/%d/%Y")

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
    `1+ Dose` = Administered_Dose1_Recip,
    `Pct 1+ Dose` = Administered_Dose1_Pop_Pct,
    `Fully Vaccinated` = Series_Complete_Yes,
    `Pct Fully Vaccinated`= Series_Complete_Pop_Pct,
    Boosted = Additional_Doses,
    `Pct Boosted`= Additional_Doses_Vax_Pct
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
    `1+ Dose` = Administered_Dose1_Recip_5Plus,
    `Pct 1+ Dose` = Administered_Dose1_Recip_5PlusPop_Pct,
    `Fully Vaccinated` = Series_Complete_5Plus,
    `Pct Fully Vaccinated` = Series_Complete_5PlusPop_Pct
    # Boosted not authorized for ages 5+
    # `Pct Boosted` not available
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
    `1+ Dose` = Administered_Dose1_Recip_12Plus,
    `Pct 1+ Dose` = Administered_Dose1_Recip_12PlusPop_Pct,
    `Fully Vaccinated` = Series_Complete_12Plus,
    `Pct Fully Vaccinated` = Series_Complete_12PlusPop_Pct,
    Boosted = Additional_Doses_12Plus,
    `Pct Boosted` = Additional_Doses_12Plus_Vax_Pct
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
    `1+ Dose` = Administered_Dose1_Recip_18Plus,
    `Pct 1+ Dose` = Administered_Dose1_Recip_18PlusPop_Pct,
    `Fully Vaccinated` = Series_Complete_18Plus,
    `Pct Fully Vaccinated` = Series_Complete_18PlusPop_Pct,
    Boosted = Additional_Doses_18Plus,
    `Pct Boosted` = Additional_Doses_18Plus_Vax_Pct
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
    `1+ Dose` = Administered_Dose1_Recip_65Plus,
    `Pct 1+ Dose` = Administered_Dose1_Recip_65PlusPop_Pct,
    `Fully Vaccinated` = Series_Complete_65Plus,
    `Pct Fully Vaccinated` = Series_Complete_65PlusPop_Pct,
    Boosted = Additional_Doses_65Plus,
    `Pct Boosted` = Additional_Doses_65Plus_Vax_Pct
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
