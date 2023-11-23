# Load required libraries
library(ggplot2)
library(dplyr)
library(knitr)

# Website traffic data
traffic_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03")),
  Page_Views = c(1500, 1600, 1400),
  Click_Through_Rate = c(2.3, 2.7, 2.0)
)

# Convert Click-through Rate to numeric
traffic_data$Click_Through_Rate <- as.numeric(sub("%", "", traffic_data$Click_Through_Rate))/100

# a. Line chart for daily page views over time
line_chart <- ggplot(traffic_data, aes(x = Date, y = Page_Views)) +
  geom_line() +
  labs(title = "Trend in Daily Page Views Over Time", x = "Date", y = "Page Views") +
  theme_minimal()

# b. Bar chart for the top N days with the highest click-through rates
top_days <- 2  # Specify the number of top days to display
bar_chart <- traffic_data %>%
  arrange(desc(Click_Through_Rate)) %>%
  head(top_days) %>%
  ggplot(aes(x = Date, y = Click_Through_Rate)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = paste("Top", top_days, "Days with Highest Click-through Rates"), x = "Date", y = "Click-through Rate") +
  theme_minimal()

# c. Table for website traffic data
traffic_table <- kable(traffic_data, col.names = c("Date", "Page Views", "Click-through Rate"), caption = "Website Traffic Data")

# Display charts and table
print(line_chart)
print(bar_chart)
print(traffic_table)
