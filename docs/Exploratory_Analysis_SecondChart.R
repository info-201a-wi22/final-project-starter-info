library(dplyr)
library(ggplot2)

data_chart2 <- 
  read.csv("https://data.cdc.gov/api/views/9mfq-cb36/rows.csv?accessType=DOWNLOAD") %>%
  rename(date = submission_date) %>%
  subset(select = -c(created_at, consent_cases, consent_deaths))
data_chart2$date <- as.Date(data_chart2$date, "%m/%d/%Y")

View(data_chart2)

recentdata <- data_chart2 %>% filter(date == (max(date)))
View(recentdata)


# ---------- OLD CHART ----------
#data_chart2 <- read.csv("https://data.cdc.gov/api/views/8xkx-amqh/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
#View(data_chart2)
#colnames(data_chart2)[1] <- "Date"
#data_chart2$date <- as.Date(data_chart2$Date, "%m/%d/%Y")
#data_chart2$date
#class(data_chart2$date)

#recentdata <-
#  data_chart2 %>%
#  filter(date == (max(date))) %>%
#  summarize(
#    Date,
#    county = Recip_County,
#    state = Recip_State,
#    totpop_2019 = Census2019, # census population
#    state_vax_pct = Administered_Dose1_Pop_Pct, # % w/ at least 1 dose by state
#    age5_pop2019 = Census2019_5PlusPop, # census population age group 5
#    age5_pctvax = Administered_Dose1_Recip_5PlusPop_Pct, # % at least 1 dose age group 5
#    age12_pop2019 = Census2019_12PlusPop, # census population age group 12
#    age12_pctvax = Administered_Dose1_Recip_12PlusPop_Pct, # % at least 1 dose age group 12
#    age18_pop2019 = Census2019_18PlusPop, # census population age group 18
#    age18_pctvax = Administered_Dose1_Recip_18PlusPop_Pct, # % at least 1 dose age group 18
#    age65_pop2019 = Census2019_65PlusPop, # census population age group 65
#    age65_pctvax = Administered_Dose1_Recip_65PlusPop_Pct # % at least 1 dose age group 65
#  )
#View(recentdata)

# `recentdata` compares population of a county and percentage of that population
# with at least 1 dose of the vaccine. Includes general population (i.e. consensus
# population) and general vaccinated percentage, along with statistics by age groups:
# 5+, 12+, 18+, and 65+.


#wa_state_data <-
#  recentdata %>%
#  filter(state == "WA")
#View(wa_state_data)
#ggplot(wa_state_data, aes(x=county, y=state_vax_pct)) +
#  geom_point(size=2, shape=20)

# This scatter plot compares counties in WA state to the percentages of those county
# populations with at least 1 dose of the vaccine. Data is pulled from the most
# recent date where vaccinations have been recorded.