inventory <- data.frame(
  Product = c("Laptop A", "Phone B", "Chair C", "Book D"),
  Category = c("Electronics", "Electronics", "Furniture", "Books"),
  Quantity = c(50, 75, 120, 200),
  Price = c(800.00, 500.00, 50.00, 10.00)
)
#1
barplot(inventory$Quantity, names.arg = inventory$Product, 
        col = "skyblue", main = "Product Quantity in Inventory",
        xlab = "Product", ylab = "Quantity")
#2
library(ggplot2)
ggplot(inventory, aes(x = Category, y = Quantity, fill = Product)) +
  geom_bar(stat = "identity") +
  labs(title = "Product Quantity by Category",
       x = "Category", y = "Quantity") +
  scale_fill_manual(values = c("Laptop A" = "skyblue", "Phone B" = "lightgreen", 
                               "Chair C" = "lightcoral", "Book D" = "orange")) +
  theme_minimal()
#3
ggplot(inventory, aes(x = Quantity, y = Price, label = Product)) +
  geom_point() +
  labs(title = "Relationship between Product Price and Quantity",
       x = "Quantity", y = "Price") +
  geom_text(hjust = 0, vjust = 0) + 
  theme_minimal()