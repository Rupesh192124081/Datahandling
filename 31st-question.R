# Sample Customer Data Frame
customer_data <- data.frame(
  Customer = c("Customer 1", "Customer 2", "Customer 3", "Customer 4"),
  Rating = c(4, 3, 5, 2),
  Feedback = c("Great service!", "Decent but could improve.", "Excellent experience!", "Not satisfied at all.")
)

# a. Histogram
hist(customer_data$Rating, 
     main="Distribution of Customer Ratings",
     xlab="Rating",
     ylab="Frequency",
     col="skyblue",
     border="black")

# b. Pie Chart
rating_labels <- paste(customer_data$Rating, "-", gsub("\\s", "", customer_data$Feedback))
pie(customer_data$Rating, 
    labels=rating_labels,
    main="Overall Distribution of Customer Ratings",
    col=c("lightblue", "lightgreen", "lightcoral", "lightpink"),
    border="white")
#3
# Required libraries
library(dplyr)
library(tidyr)
library(ggplot2)

# Data frame
customer_data <- data.frame(
  Customer = c("Customer 1", "Customer 2", "Customer 3", "Customer 4"),
  Rating = c(4, 3, 5, 2),
  Feedback = c("Great service!", "Decent but could improve.", "Excellent experience!", "Not satisfied at all.")
)

# Stacked bar plot
customer_data %>%
  gather(key, value, -Customer) %>%
  ggplot(aes(x = Customer, y = value, fill = key)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Customer Ratings and Feedback", 
       x = "Customer", 
       y = "feedback/rating", 
       fill = "Category") +
  scale_fill_brewer(palette = "Set2")
# Data frame
customer_data <- data.frame(
  Customer = c("Customer 1", "Customer 2", "Customer 3", "Customer 4"),
  Rating = c(4, 3, 5, 2),
  Feedback = c("Great service!", "Decent but could improve.", "Excellent experience!", "Not satisfied at all.")
)

# Data frame
customer_data <- data.frame(
  Customer = c("Customer 1", "Customer 2", "Customer 3", "Customer 4"),
  Rating = c(4, 3, 5, 2),
  Feedback = c("Great service!", "Decent but could improve.", "Excellent experience!", "Not satisfied at all.")
)

# Add an id column for each row
