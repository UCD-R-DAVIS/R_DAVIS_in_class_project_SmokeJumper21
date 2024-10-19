surveys <- read.csv("data/portal_data_joined.csv")
surveys_base <- surveys[1:5000, c("species_id", "weight", "plot_type")]
surveys_base <- surveys_base[complete.cases(surveys_base$weight), ]
surveys_base$species_id <- factor(surveys_base$species_id)
surveys_base$plot_type <- factor(surveys_base$plot_type)
levels(surveys_base$species_id)
typeof(surveys_base$species_id)
class(surveys_base$species_id)  
challenge_base <- surveys_base[surveys_base$weight > 150, ]


# Explanation: Factors vs. Characters
# Factors are different from characters in that they are used to represent 
# categorical data and store the data as integers with corresponding levels. 