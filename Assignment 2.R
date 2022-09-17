library(dplyr)
Temp <- getwd()
setwd("./covid-19-data/")
US <- read.csv("us-states.csv")
View(US )

Penn <- filter(US, state == "Pennsylvania")

Pennewcase <- Penn %>% select(date, state, fips, cases, deaths) %>% mutate(incr_cases = cases - lag(cases))
Pennewcasedeath <- Pennewcase %>% mutate(incr_deaths = deaths - lag(deaths))
Pennewcasedeath <- na.omit(Pennewcasedeath)
View(Pennewcasedeath)

sd <- Pennewcasedeath$incr_cases
sd(sd)