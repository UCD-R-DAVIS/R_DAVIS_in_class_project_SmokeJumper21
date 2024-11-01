library (tidyverse)
tail <- read_csv('data/tail_length.csv')
surveys <- read_csv('data/portal_data_joined.csv')


dim(tail)
dim(surveys)
head(tail)

tail<- tail[sample(1:nrow(tail))]

surveys_inner <- inner_join(x = surveys, y = tail)
dim(surveys_inner)
head(surveys_inner)

all(surveys$record_id %in% tail$record_id)
all(tail$record_id %in% surveys$record_id)

