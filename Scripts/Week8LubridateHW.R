library(tidyverse)
library(lubridate)
mloa <- read_csv("https://raw.githubusercontent.com/ucd-r-davis/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
head(mloa)
mloa2 <- mloa %>%
  filter(rel_humid != -99) %>%  # Remove missing humidity values
  filter(temp_C_2m != -999.9) %>%  # Remove missing temperature values
  filter(windSpeed_m_s != -999.9)  # Remove missing wind speed values
colnames(mloa)