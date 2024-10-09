set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
prob1 <- hw2[!is.na(hw2)]  # Removes all `NA` values from `hw2`
prob1 <- prob1[prob1 >= 14 & prob1 <= 38]  # Keep only values >= 14 and <= 38
times3 <- prob1 * 3
plus10 <- times3 + 10
final <- plus10[c(TRUE, FALSE)]  # Selects every other number
final
