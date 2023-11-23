library(ggplot2)
data <- data.frame(
  Store = c("Store A", "Store B", "Store A", "Store C"),
  Product = c("Widget X", "Widget Y", "Widget Y", "Widget X"),
  Quantity_Sold = c(100, 75, 50, 80),
  Revenue = c(500.00, 1125.00, 750.00, 400.00)
)
#1
total_quantity <- aggregate(Quantity_Sold ~ Product, data = data, sum)
ggplot(total_quantity, aes(x = Product, y = Quantity_Sold, fill = Product)) +
  geom_bar(stat = "identity") +
  labs(title = "Quantity of Each Product in Inventory",
       x = "Product",
       y = "Quantity Sold")

#2
ggplot(data, aes(x = Store, y = Quantity_Sold, fill = Product)) +
  geom_bar(stat = "identity") +
  labs(title = "Quantity of Each Product in Different Stores",
       x = "Store",
       y = "Quantity Sold") +
  theme_minimal()
#3
ggplot(data, aes(x = Quantity_Sold, y = Revenue, color = Store)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Revenue vs. Quantity Sold",
       x = "Quantity Sold",
       y = "Revenue (USD)",
       color = "Store")