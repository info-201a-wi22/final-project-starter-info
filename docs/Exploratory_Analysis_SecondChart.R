
data <- read.csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
colnames(data)[1] <- "Date"
data$date <- as.Date(data$Date, "%m/%d/%Y")

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
General_Population$Date <- as.Date(General_Population$Date, "%m/%d/%Y")

# ---------- Plotting ----------
state_coords <- 
  map_data("state") %>%
  unite(polyname, region) %>%
  left_join(state.fips, by = "polyname") %>%
  rename(name = polyname, State = abb)



