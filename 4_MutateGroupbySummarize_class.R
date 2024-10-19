library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)
surveys <- surveys %>%
  mutate(weight_kg = weight / 1000)
surveys %>%
  group_by(sex) %>%
  mutate(mean_weight = mean(weight, na.rm = TRUE)) 
surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))
