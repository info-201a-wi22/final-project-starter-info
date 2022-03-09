
# ---------- INTRODUCTORY PAGE ----------


# ---------- REPORT PAGE ----------
index.rmd_report <- "Substitute this with stuff from index.rmd"


agg_table_report1 <- "     Our aggregate table is pulled from a dataset on Kaggle that combines three
datasets, one of which is made by the World Health Organization. This table summarizes the changes
in statistical numbers during COVID-19 in each country, filering out rows of data from the first
most recent dates of recordation. The average time passed between those dates is ~200 days to a 
full year. By columns, the table takes into account total vaccine doses distributed, individuals
who got at least one dose, individuals who completed the series, daily deaths, the total 
population in that country, and the percentage of vaccinated individuals in their respective 
country's population. The numbers in the aggregate table are the differences in those values, 
subtracting the numbers of the first date from the numbers of the most recent date." 

agg_table_report2 <- "Explore some of these statistics below." 

agg_table_report3 <- "     Between 2021-01-24 and 2021-12-25, the country of Malta experienced the 
biggest change, meaning that they were able to vaccinate 95% more individuals in that time frame. 
They also saw a decrease in deaths, with a difference of 3 less people. In 335 days, Malta was 
able to vaccinate 1,011,312 more people."

agg_table_report4 <- "     India resides at the top for getting the most vaccinations administered, 
with a record of 1,406,679,149 more vaccinated individuals within 316 days. That's 59% more of 
their population vaccinated between 2021-02-13 and 2021-12-26, and their death count only 
increased by 59. Russia, however, saw a huge increase in deaths, losing 540 individuals to COVID-19 
in just below 300 days. Although, Russia was also able to come in 10th highest for newly vaccinated 
individuals from 2021-03-02 to 2021-12-25, overall increasing their vaccinated percentage by 47%."

agg_table_report5 <- "     Behind India, the U.S. comes in second for highest increase in vaccinations. 
On 2020-12-13 through 2021-12-23, the U.S. was able to vaccinate 500,198,183 individuals. They also 
experienced the third lowest changes in death, decreasing by 1,025 individuals. As for the total 
percentage of individuals that are vaccinated in the population, the U.S. was able to get 72% more 
doses administered, leaving them at 37th for highest increases in percent."


# ---------- SUMMARY PAGE ----------
summary_takeaways <- "As time has continued to pass while we are in the pandemic their are still many people 
around the world who refuse to get vaccinated. Within our team, Project Vax, we wanted to look at 
how vaccines have had an impact on public health and COVID-19 itself. We wanted to observe the benefits that the 
vaccination has been able to bring to the table and how it has had a positive effect amongst the virus to help
combat and constrain it from getting any worse than it once was."

summary_takeaways2 <- "In the first chart we wanted to analyze the amount of fatalities that have occured since
the pandemic had first officially started up until now. Looking at it you are able to analyze that one the vaccine
had finally been released to the public that there was a major dip in new fatalities, it had only gone back up recently 
with the new variants that have been coming."

summary_takeaways3 <- "The second chart that was created highlights different aspects of vaccination statuses across the country.
It includes the amount of single dosed, fully vaccinated, and boosted individuals ranging from a various amount of ages. The general
trend that we were able to witness is that the more vaccinated people their are, the more it will be less likely to have a 
new fatality caused by covid."


# ---------- INTERACTIVE PAGE 1 ----------


# ---------- INTERACTIVE PAGE 2 ----------
int2_helptext <- "Explore numbers of the general population in the U.S. Here, you can check numbers
of various vaccination statuses, such as \"Single Dosed\", \"Fully Vaccinated\", and \"Boosted\". 
Individuals under the category of single dosed are those who have at least one dose of the vaccine. 
Numbers under the fully vaccinated category report the total census of people who have completed 
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


