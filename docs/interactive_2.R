
data <- read.csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
colnames(data)[1] <- "Date"
data$date <- as.Date(data$Date, "mm/dd/yyyy")

state_coords <- 
  map_data("state") %>%
  unite(polyname, region) %>%
  left_join(state.fips, by = "polyname") %>%
  rename(name = polyname, State = abb)
state_coords[state_coords$name == "massachusetts", "State"] <- "MA"
state_coords[state_coords$name == "michigan", "State"] <- "MI"
state_coords[state_coords$name == "north carolina", "State"] <- "NC"
state_coords[state_coords$name == "new york", "State"] <- "NY"
state_coords[state_coords$name == "virginia", "State"] <- "VA"
state_coords[state_coords$name == "washington", "State"] <- "WA"

General_Population <- 
  data %>%
  filter(! Location %in% c(
    "BP2", "DD2", "FM", "IH2","VA2"
  )) %>%
  summarize(
    Date,
    State = Location, 
    `Total Distributed` = as.numeric(gsub(",", "", Distributed)),
    `Total Administered` = as.numeric(gsub(",", "", Administered)),
    `Single Dose` = as.numeric(gsub(",", "", Administered_Dose1_Recip)),
    `Full Vaccination` = as.numeric(gsub(",", "", Series_Complete_Yes)),
    Booster = as.numeric(gsub(",", "", Additional_Doses)),
  ) %>%
  right_join(state_coords, by = "State")

