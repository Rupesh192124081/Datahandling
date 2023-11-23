
library(ggplot2)
# Sample data
product_data <- data.frame(
  Product_ID = c(1, 2, 3, 4, 5),
  Product_Name = c("Product A", "Product B", "Product C", "Product D", "Product E"),
  Quantity_Available = c(250, 175, 300, 200, 220)
  
)

# Bar chart
ggplot(product_data, aes(x = Product_Name, y = Quantity_Available, fill = Product_Name)) +
  geom_bar(stat = "identity") +
  labs(title = "Quantity of Each Product in Inventory",
       x = "Product Name",
       y = "Quantity Available",
       fill = "Product Name") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
#b

# Sample data with product categories
product_data_with_category <- data.frame(
  Product_ID = c(1, 2, 3, 4, 5),
  Product_Name = c("Product A", "Product B", "Product C", "Product D", "Product E"),
  Quantity_Available = c(250, 175, 300, 200, 220),
  Category = c("Category1", "Category2", "Category1", "Category2", "Category1")
)

# Stacked bar chart
ggplot(product_data_with_category, aes(x = Category, y = Quantity_Available, fill = Product_Name)) +
  geom_bar(stat = "identity") +
  labs(title = "Quantity of Each Product Within Categories",
       x = "Product Category",
       y = "Quantity Available",
       fill = "Product Name") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#c

# Sample data with product prices
product_data_with_price <- data.frame(
  Product_ID = c(1, 2, 3, 4, 5),
  Product_Name = c("Product A", "Product B", "Product C", "Product D", "Product E"),
  Quantity_Available = c(250, 175, 300, 200, 220),
  Product_Price = c(10, 15, 20, 18, 12)
)

# Scatter plot
ggplot(product_data_with_price, aes(x = Product_Price, y = Quantity_Available)) +
  geom_point(size = 3, color = "blue") +
  labs(title = "Relationship between Product Price and Quantity Available",
       x = "Product Price ($)",
       y = "Quantity Available",
       caption = "Each point represents a product") +
  theme_minimal()
