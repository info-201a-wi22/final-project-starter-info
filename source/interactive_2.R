# ---- Gathering Data ----

## --- Pulling CSV file & preparing for wrangle
data_int2 <- 
  read.csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD&bom=true&format=true") %>%
  rename(Date = ï..Date)
data_int2$Date <- as.Date(data_int2$Date, "%m/%d/%Y") # setting compatible format for dateInput()

## --- Getting ggplot data for map of U.S. states
state_coords <- 
  map_data("state") %>%
  unite(polyname, region) %>%
  left_join(state.fips, by = "polyname") %>%
  rename(name = polyname, State = abb)
# fixing states with missing abbreviation values:
state_coords[state_coords$name == "massachusetts", "State"] <- "MA"
state_coords[state_coords$name == "michigan", "State"] <- "MI"
state_coords[state_coords$name == "north carolina", "State"] <- "NC"
state_coords[state_coords$name == "new york", "State"] <- "NY"
state_coords[state_coords$name == "virginia", "State"] <- "VA"
state_coords[state_coords$name == "washington", "State"] <- "WA"


# ---- Preparing Data Set For ggplot ----
General_Population <- 
  data_int2 %>%
  summarize(
    Date,
    State = Location, 
    # surrounding spaced words with back tick so it's passed as an object:
    `Total Distributed` = as.numeric(gsub(",", "", Distributed)),
    `Total Administered` = as.numeric(gsub(",", "", Administered)),
    `Single Dosed` = as.numeric(gsub(",", "", Administered_Dose1_Recip)),
    `Fully Vaccinated` = as.numeric(gsub(",", "", Series_Complete_Yes)),
    Boosted = as.numeric(gsub(",", "", Additional_Doses))
    
    # as.numeric(gsub(argument)) removes commas (prevents number conversion error) 
    # & converts class character to numeric
  ) %>%
  right_join(state_coords, by = "State")

