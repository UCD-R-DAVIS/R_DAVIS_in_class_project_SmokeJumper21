# Mean Life Expectancy by Continent with Facets
gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp, na.rm = TRUE), .groups = 'drop') %>% 
  ggplot(aes(x = year, y = mean_lifeExp, color = continent)) +
  geom_point() +  # scatter plot
  geom_line() +   # line plot
  labs(x = "Year", y = "Mean Life Expectancy", 
       title = "Mean Life Expectancy Over Time by Continent") +
  theme_minimal() +
  facet_wrap(~ continent)  # adding facet wrap for separate panels per continent

# Life Expectancy vs GDP per Capita with Population Size
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop), alpha = 0.7) +  # added transparency
  scale_x_log10() +
  scale_size_continuous(range = c(1, 10)) +  # Adjust the point size range
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw() +
  labs(x = "GDP per Capita (log scale)", y = "Life Expectancy",
       title = "Life Expectancy vs. GDP per Capita by Continent")
