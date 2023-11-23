# Install and load required libraries
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

# Sample data
customer_data <- data.frame(
  Customer_ID = c(1, 2, 3),
  Age = c(28, 35, 42),
  Gender = c("Female", "Male", "Female"),
  Income = c(50000, 60000, 75000)
)

# Create a bar chart for customer ages
age_bar_chart <- ggplot(customer_data, aes(x = factor(Customer_ID), y = Age, fill = factor(Customer_ID))) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Customer Ages",
       x = "Customer ID",
       y = "Age") +
  theme_minimal()
print(age_bar_chart)
# Create a pie chart for the distribution of customers by gender
gender_pie_chart <- ggplot(customer_data, aes(x = "", fill = Gender)) +
  geom_bar(width = 1, stat = "count") +
  coord_polar("y") +
  labs(title = "Distribution of Customers by Gender",
       fill = "Gender") +
  theme_minimal()
print(gender_pie_chart)
# Create a table for demographic information
demographic_table <- customer_data %>%
  select(Customer_ID, Age, Gender, Income) %>%
  rename("Customer ID" = Customer_ID,
         "Income (in $)" = Income)
print(demographic_table)
