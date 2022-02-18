library(dplyr)

data <- read.csv("https://data.cdc.gov/api/views/8xkx-amqh/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
View(data)

colnames(data)[1] <- "Date"

recentdata <-
  data %>%
  filter(date == max(date)) %>%
  summarize( 
    date,
    recip_county,
    recip_state,
    Census2019, #census population
    Administered_Dose1_Pop_Pct, #% w/ at least 1 dose by state
    Census2019_5PlusPop, #census population age group 5
    Administered_Dose1_Recip_5PlusPop_Pct, #% at least 1 dose age group 5
    Census2019_12PlusPop, #census population age group 12
    Administered_Dose1_Recip_12PlusPop_Pct, #% at least 1 dose age group 12
    Census2019_18PlusPop, #census population age group 18
    Administered_Dose1_Recip_18PlusPop_Pct, #% at least 1 dose age group 18
    Census2019_65PlusPop, #census population age group 65
    Administered_Dose1_Recip_65PlusPop_Pct #% at least 1 dose age group 65
  ) %>%
  rename(
    county = recip_county,
    state = recip_state,
    totpop_2019 = Census2019,
    state_vax_pct = Administered_Dose1_Pop_Pct,
    age5_pop2019 = Census2019_5PlusPop,
    age5_pctvax = Administered_Dose1_Recip_5PlusPop_Pct,
    age12_pop2019 = Census2019_12PlusPop,
    age12_pctvax = Administered_Dose1_Recip_12PlusPop_Pct,
    age18_pop2019 = Census2019_18PlusPop,
    age18_pctvax = Administered_Dose1_Recip_18PlusPop_Pct,
    age65_pop2019 = Census2019_65PlusPop,
    age65_pctvax = Administered_Dose1_Recip_65PlusPop_Pct
  )
View(recentdata)
  