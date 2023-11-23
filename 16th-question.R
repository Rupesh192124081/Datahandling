# load required libraries
library(ggplot2)
library(tidyr)

# Sample data
sales_data <- data.frame(
  Product_ID = c(1, 2, 3),
  Product_Name = c("Product A", "Product B", "Product C"),
  January_Sales = c(2000, 1500, 1200),
  February_Sales = c(2200, 1800, 1400),
  March_Sales = c(2400, 1600, 1100)
)

# a. Grouped bar chart to visualize the sales of each product for the first quarter
grouped_bar_chart <- sales_data %>%
  gather(Month, Sales, -Product_ID, -Product_Name) %>%
  ggplot(aes(x = Product_Name, y = Sales, fill = Month)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Sales of Each Product for the First Quarter",
       x = "Product Name",
       y = "Sales",
       fill = "Month") +
  theme_minimal()

# b. Stacked area chart to represent the overall sales trend for all products over the three months
stacked_area_chart <- sales_data %>%
  gather(Month, Sales, -Product_ID, -Product_Name) %>%
  ggplot(aes(x = as.factor(Product_ID), y = Sales, fill = Month)) +
  geom_area() +
  labs(title = "Overall Sales Trend for All Products",
       x = "Product ID",
       y = "Sales",
       fill = "Month") +
  theme_minimal()

# c. Table to show the monthly sales data for each product
sales_table <- sales_data %>%
  gather(Month, Sales, -Product_ID, -Product_Name) %>%
  arrange(Product_ID)

# Rename the columns
colnames(sales_table) <- c("Product ID", "Product Name", "Month", "Monthly Sales")

# Display the visualizations and table
print(grouped_bar_chart)
print(stacked_area_chart)
print(sales_table)
