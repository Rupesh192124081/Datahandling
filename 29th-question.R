# Install and load necessary libraries
install.packages("ggplot2")
library(ggplot2)

# Create the inventory data frame
inventory <- data.frame(
  Product = c("Widget A", "Widget B", "Widget C", "Widget D"),
  Quantity = c(100, 75, 120, 50),
  Price = c(10.00, 15.00, 8.50, 20.00)
)
#1
# Create a bar chart
bar_chart <- ggplot(inventory, aes(x = Product, y = Quantity, fill = Product)) +
  geom_bar(stat = "identity") +
  labs(title = "Product Inventory",
       x = "Product",
       y = "Quantity") +
  theme_minimal()

# Display the chart
print(bar_chart)
#2
ggplot(inventory, aes(x = "", y = Quantity, fill = Product)) +
  geom_bar(stat = "identity", width = 0.5, color = "white") +
  labs(title = "Product Inventory - Quantity by Product",
       x = "Category",
       y = "Quantity",
       fill = "Product") +
  theme_minimal()
#3
library(kableExtra)
kable(inventory, caption = "iventory") %>%
  kable_styling()
