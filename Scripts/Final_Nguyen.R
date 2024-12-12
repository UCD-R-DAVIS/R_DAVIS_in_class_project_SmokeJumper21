# ---- Assignment Code ----
# Question 1: Load Required Libraries and Data
library(tidyverse)

# Load the CSV file
file_url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"
activity_data <- read_csv(file_url)

# ---- Question 2: Filter Non-Running Activities ----
running_data <- activity_data %>%
  filter(sport == "Running")

# ---- Question 3: Filter by Pace and Duration ----
cleaned_data <- running_data %>%
  filter(
    between(minutes_per_mile, 5, 10),  # Filter pace between 5 and 10 minutes/mile
    total_elapsed_time_s > 60          # Eliminate short laps (<= 1 minute)
  )

# ---- Question 4: Add Date and Group by Time Period ----
cleaned_data <- cleaned_data %>%
  mutate(
    date = as.Date(paste(year, month, day, sep = "-")),  # Create a date column
    time_period = case_when(
      date < as.Date("2024-01-01") ~ "Pre-2024",
      date < as.Date("2024-07-01") ~ "Jan-Jun 2024",
      TRUE ~ "Jul-Dec 2024"
    )
  )

# ---- Question 5: Scatter Plot with Modified Aesthetics ----
scatter_plot <- ggplot(cleaned_data, aes(x = minutes_per_mile, y = steps_per_minute)) +
  geom_point(aes(color = time_period), size = 3, alpha = 0.8) +  # Different point size and transparency
  geom_smooth(method = "lm", se = FALSE, aes(color = time_period)) +  # Trendlines by time period
  scale_color_brewer(palette = "Dark2") +  # Use a Brewer color palette
  theme_bw() +  # Switch to a clean black-and-white theme
  labs(
    title = "Relationship Between Speed and SPM",
    subtitle = "Grouped by Running Periods",
    x = "Speed (Minutes per Mile)",
    y = "Steps per Minute (SPM)",
    color = "Time Period"
  ) +
  theme(
    text = element_text(size = 12),  # Increase font size
    plot.title = element_text(hjust = 0.5),  # Center-align the title
    legend.position = "top"  # Place legend on top
  )

print(scatter_plot)

# ---- Question 6: Additional Visualization for Post-Rehab Runs ----
# Focus on post-rehab runs and laps 1-3
post_rehab_data <- cleaned_data %>%
  filter(time_period == "Jul-Dec 2024") %>%
  group_by(date) %>%
  mutate(lap_number = dense_rank(total_elapsed_time_s)) %>%  # Rank laps for each run
  filter(lap_number <= 3)  # Keep only the first 3 laps

lap_plot <- ggplot(post_rehab_data, aes(x = lap_number, y = steps_per_minute, color = Speed)) +
  geom_line(aes(group = date), linewidth = 1) +  # Connect points within runs
  geom_point(size = 4, alpha = 0.7) +  # Highlight points
  scale_color_viridis_c(option = "D") +  # Use viridis color scale for speed
  theme_minimal() +  # Minimalist theme
  labs(
    title = "SPM by Lap Number (Post-Rehab)",
    subtitle = "Highlighting Runs After Intervention",
    x = "Lap Number",
    y = "Steps per Minute (SPM)",
    color = "Speed (mph)"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),  # Bold and center-align title
    legend.position = "right"  # Place legend to the right
  )

print(lap_plot)

