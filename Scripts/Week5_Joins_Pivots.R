library(tidyverse)

tail <- read_csv('data/tail_length.csv')
head(tail)
dim(tail)

surveys <- read_csv('data/portal_data_joined.csv')

dim(inner_join(x = surveys,y = tail,by = 'record_id'))

dim(surveys)
dim(tail)

surveys_left_joined <- left_join(x = surveys, y = tail, by = 'record_id')
surveys_right_joined <- right_join(y = surveys, x = tail, by = 'record_id')

dim(surveys_left_joined)
dim(surveys_right_joined)