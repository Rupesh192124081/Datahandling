library(ggplot2)
library(dplyr)

# Sample data
product_data <- data.frame(
  Product_ID = c(1, 2, 3),
  Product_Name = c("Product A", "Product B", "Product C"),
  Quantity_Available = c(250, 175, 300),
  Price = c(20, 15, 18)
)

# a. Bar chart to visualize the quantity of each product in the inventory
quantity_bar_chart <- ggplot(product_data, aes(x = Product_Name, y = Quantity_Available, fill = Product_Name)) +
  geom_bar(stat = "identity") +
  labs(title = "Quantity of Each Product in Inventory",
       x = "Product Name",
       y = "Quantity Available") +
  theme_minimal()

# b. Stacked bar chart to show the quantity of each product within different product categories
# Assuming there's a Product_Category column in the data
product_data$Product_Category <- c("Category X", "Category Y", "Category Z")

stacked_bar_chart <- ggplot(product_data, aes(x = Product_Category, y = Quantity_Available, fill = Product_Name)) +
  geom_bar(stat = "identity") +
  labs(title = "Quantity of Each Product within Categories",
       x = "Product Category",
       y = "Quantity Available") +
  theme_minimal()

# c. Table to show the inventory data for each product
inventory_table <- product_data %>%
  select(Product_ID, Product_Name, Quantity_Available, Price) %>%
  rename("Product ID" = Product_ID,
         "Quantity Available" = Quantity_Available,
         "Price (in $)" = Price)

# Display the visualizations and table
print(quantity_bar_chart)
print(stacked_bar_chart)
print(inventory_table)
