
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
    `Full Vaccination` = Series_Complete_Yes,
    Booster = Additional_Doses
  )


# ---------- Plotting ----------
get_col <- function(dataframe, column) {
  get <- dataframe[, column]
}

create_map <- function(chosen_date, vaccination_status) {
  get_date <- as.Date(chosen_date, "%m/%d/%Y")
  map <- General_Population %>% 
    filter(Date == get_date)
  status <- get_col(map, substitute(vaccination_status))
  ggplot(map) +
    geom_polygon(
      mapping = aes(
        x = long,
        y = lat,
        group = group,
        fill = status
      )
    ) + coord_map() + scale_fill_viridis(option = "viridis") + 
    labs(fill = "Amount") +
    ggtitle(paste("General Population with", vaccination_status, "on", chosen_date))
}

state_coords <- 
  map_data("state") %>%
  unite(polyname, region) %>%
  left_join(state.fips, by = "polyname") %>%
  rename(name = polyname, State = abb)

General_Population <-state_coords %>% left_join(General_Population, by = "State")

create_map("03/06/2022", "Booster")

test <- General_Population %>% 
  filter(Date == max(Date))
View(test)

class(General_Population$Date)

ggplot(test) +
  geom_polygon(
    mapping = aes(
      x = long,
      y = lat,
      group = group,
      fill = Booster
    )
  ) + coord_map() + scale_fill_viridis(option = "viridis") + 
  labs(fill = "Booster") +
  ggtitle(paste("General Population with"))


ggplot(test) +
  geom_polygon(
    mapping = aes(
      x = long,
      y = lat,
      group = group,
      fill = 
    )
  )
