# for line breaks, do `\n`

# ---------- INTRODUCTORY PAGE ----------


# ---------- REPORT PAGE ----------
index.rmd_report <- "Quote from index here"

agg_table_report1 <- "     Our aggregate table is pulled from a dataset on Kaggle that combines three
datasets, one of which is made by the World Health Organization. This table summarizes the changes
in statistical numbers during COVID-19 in each country, filering out rows of data from the first
most recent dates of recordation. The average time passed between those dates is ~200 days to a 
full year. By columns, the table takes into account total vaccine doses distributed, individuals
who got at least one dose, individuals who completed the series, daily deaths, the total 
population in that country, and the percentage of vaccinated individuals in their respective 
country's population. The numbers in the aggregate table are the differences in those values, 
subtracting the numbers of the first date from the numbers of the most recent date. \n 
     Between 2021-01-24 and 2021-12-25, the country of Malta experienced the biggest change, 
meaning that they were able to vaccinate 95% more individuals in that time frame. They also saw a 
decrease in deaths, with a difference of 3 less people. In 335 days, Malta was able to vaccinate 
1,011,312 more people. \n
     India resides at the top for getting the most vaccinations administered, with a record of 
1,406,679,149 more vaccinated individuals within 316 days. That's 59% more of their population
vaccinated between 2021-02-13 and 2021-12-26."

agg_table_report2 <- "Describle U.S. numbers here"


# ---------- SUMMARY PAGE ----------


# ---------- INTERACTIVE PAGE 1 ----------


# ---------- INTERACTIVE PAGE 2 ----------
int2_helptext <- "Explore numbers of the general population in the U.S. Here, you can check numbers
of various vaccination statuses, such as \"Single Dosed\", \"Fully Vaccinated\", and \"Boosted\". 
Individuals under the category of single dosed are those who have at least one dose of the vaccine. 
Numbers under the fully vaccinated category report the total consensus of people who have completed 
the full series of their vaccination brand (either a two-dose series or one-dose series). The 
booster category shows those who have been fully vaccinated and have also recieved an additional 
(booster) shot."

int2_description <- "     Sourced from the CDC, these numbers are recorded either from Pfizer, Moderna, 
Johnson & Johnson/Janssen, or another manufacturer of the COVID-19 vaccination. \"Data represents 
all vaccine partners including jurisdictional partner clinics, retail pharmacies, long-term care 
facilities, dialysis centers, Federal Emergency Management Agency and Health Resources and 
Services Administration partner sites, and federal entity facilities\" (via CDC website). The 
specific columns selected for this analysis are based on the jurisdiction (state) where recipients 
live."


