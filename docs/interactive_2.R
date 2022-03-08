
data <- read.csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
colnames(data)[1] <- "Date"
data$date <- as.Date(data$Date, "mm/dd/yyyy")

General_Population <- 
  data %>%
  filter(! Location %in% c(
    "BP2", "DD2", "FM", "IH2","VA2"
  )) %>%
  summarize(
    Date,
    State = Location, 
    `Total Distributed` = as.numeric(str_replace(Distributed, ",", "")),
    `Total Administered` = as.numeric(str_replace(Administered, ",", "")),
    `Single Dose` = as.numeric(str_replace(Administered_Dose1_Recip, ",", "")),
    `Full Vaccination` = as.numeric(str_replace(Series_Complete_Yes, ",", "")),
    Booster = as.numeric(str_replace(Additional_Doses, ",", ""))
  )

state_coords <- 
  map_data("state") %>%
  unite(polyname, region) %>%
  left_join(state.fips, by = "polyname") %>%
  rename(name = polyname, State = abb)

General_Population <-
  state_coords %>%
  left_join(General_Population, by = "State") 



