library(ggplot2)
website_analytics <- data.frame(
  "Date" = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  "Page.Views" = c(1500, 1600, 1400, 1650, 1800),
  "Click_through_Rate" = c(2.3, 2.7, 2.0, 2.4, 2.6)
)

# b. Bar Chart
top_n_days <- 2  # You can change this to the desired number of top days
top_days <- head(website_analytics[order(website_analytics$Click_through_Rate, decreasing = TRUE), ], top_n_days)

barplot(top_days$Click_through_Rate, names.arg = as.character(top_days$Date),
        col = "skyblue", main = "Top N Days with Highest Click-through Rates",
        xlab = "Date", ylab = "Click-through Rate")

# c. Stacked Area Chart
library(tidyr)

# Assuming you have data for user_interactions
user_interactions <- data.frame(
  "Date" = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  "Likes" = c(100, 120, 80, 90, 110),
  "Shares" = c(30, 40, 25, 35, 45),
  "Comments" = c(50, 60, 40, 45, 55)
)

user_interactions_long <- pivot_longer(user_interactions, cols = c("Likes", "Shares", "Comments"), names_to = "Interaction_Type", values_to = "Number_of_Interactions")

ggplot(user_interactions_long, aes(x = Date, y = Number_of_Interactions, fill = Interaction_Type)) +
  geom_area() +
  labs(title = "User Interactions Distribution",
       x = "Date",
       y = "Number of Interactions",
       fill = "Interaction Type")
