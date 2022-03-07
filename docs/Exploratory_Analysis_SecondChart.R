library(dplyr)
library(ggplot2)

data <- read.csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
View(data)

colnames(data)[1] <- "Date"
data$date <- as.Date(data$Date, "%m/%d/%Y")

# Comparing vaccination status numbers by general population and age groups:

# comparing total numbers ----
General_Population <- 
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
Age_5plus <- 
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

Age_12plus <-
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

Age_18plus <-
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

Age_65plus <-
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

# ---------- Plotting ----------
get_col <- function(dataframe, column) {
  get <- dataframe[, column]
}
create_map <- function(chosen_date, age_group) {
  map <- age_group %>% filter(Date == as.character(chosen_date))
  `Fully Vaccinated` <- get_col(map, "Fully Vaccinated")
  ggplot(map) +
    geom_polygon(
      mapping = aes(
        x = long,
        y = lat,
        group = group,
        fill = `Fully Vaccinated`
      )
    ) + coord_map() + scale_fill_viridis(option = "viridis") + 
    labs(fill = `Fully Vaccinated`) +
    ggtitle(paste(age_group, "vaccination status for", chosen_date))
}

state_coords <- 
  map_data("state") %>%
  unite(polyname, region) %>%
  left_join(state.fips, by = "polyname") %>%
  rename(name = polyname, State = abb)

General_Population <-state_coords %>% left_join(General_Population, by = "State")

Age_5plus <- state_coords %>% left_join(General_Population, by = "State")

Age_12plus <- state_coords %>% left_join(General_Population, by = "State")

Age_18plus <- state_coords %>% left_join(General_Population, by = "State")

Age_65plus <- state_coords %>% left_join(General_Population, by = "State")

create_map("03/06/2022", General_Population)
