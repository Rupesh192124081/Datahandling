library(ggplot2)
library(dplyr)

# Sample data
customer_data <- data.frame(
  Customer_ID = c(1, 2, 3),
  Age = c(28, 35, 42),
  Gender = c("Female", "Male", "Female"),
  Income = c(50000, 60000, 75000)
)

# a. Bar chart to visualize the distribution of customer ages
age_bar_chart <- ggplot(customer_data, aes(x = factor(Customer_ID), y = Age, fill = factor(Customer_ID))) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Customer Ages",
       x = "Customer ID",
       y = "Age") +
  theme_minimal()

# b. Pie chart for the distribution of customers by gender
gender_pie_chart <- ggplot(customer_data, aes(x = "", fill = Gender)) +
  geom_bar(width = 1, stat = "count") +
  coord_polar("y") +
  labs(title = "Distribution of Customers by Gender",
       fill = "Gender") +
  theme_minimal()

# c. Table for demographic information
demographic_table <- customer_data %>%
  rename("Customer ID" = Customer_ID,
         "Income (in $)" = Income)

# Display the visualizations and table
print(age_bar_chart)
print(gender_pie_chart)
print(demographic_table)
