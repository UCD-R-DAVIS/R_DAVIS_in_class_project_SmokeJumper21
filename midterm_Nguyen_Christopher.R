install.packages("tidyverse")
library(tidyverse)
url <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv'
lap_dt <- read_csv(url)
running_laps <- lap_dt %>%
  filter(sport == "running") %>%                   # Keep only running activities
  filter(total_elapsed_time_s > 60) %>%            # Remove records with elapsed time ≤ 1 minute
  filter(minutes_per_mile > 5 & minutes_per_mile < 10) # Remove walking and abnormally fast laps
running_laps <- running_laps %>%
  mutate(
    pace_cat = case_when(
      minutes_per_mile < 6 ~ "fast",
      minutes_per_mile >= 6 & minutes_per_mile < 8 ~ "medium",
      TRUE ~ "slow"
    ),
    form = if_else(year == 2024, "new", "old")
  )
head(running_laps)
