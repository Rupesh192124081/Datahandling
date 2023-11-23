# Product data
product_data <- data.frame(
  Product_ID = 1:5,
  Product_Name = c("Product A", "Product B", "Product C", "Product D", "Product E"),
  Quantity_Available = c(250, 175, 300, 200, 220)
)

# a. Bar chart for quantity of each product in the inventory
barplot(product_data$Quantity_Available, names.arg = product_data$Product_Name,
        col = "skyblue", main = "Quantity of Each Product in Inventory",
        xlab = "Product Name", ylab = "Quantity Available")

# b. Stacked bar chart for quantity of each product within different product categories
# Assuming there's a category column in your data (e.g., Product_Category), modify as needed
product_data$Product_Category <- c("Category A", "Category B", "Category A", "Category B", "Category A")

stacked_bar_data <- table(product_data$Product_Category, product_data$Product_Name)
barplot(as.matrix(stacked_bar_data), beside = TRUE, col = rainbow(ncol(stacked_bar_data)),
        main = "Quantity of Each Product Within Different Categories",
        xlab = "Product Category", ylab = "Quantity Available",
        legend.text = rownames(stacked_bar_data), args.legend = list(x = "topright", bty = "n"))

# c. Scatter plot for relationship between product price and quantity available
# Assuming there's a Price column in your data (e.g., Product_Price), modify as needed
product_data$Product_Price <- c(10, 15, 20, 18, 25)

plot(product_data$Product_Price, product_data$Quantity_Available, col = "green",
     xlab = "Product Price", ylab = "Quantity Available",
     main = "Scatter Plot: Product Price vs Quantity Available")

# Add labels for each point
text(product_data$Product_Price, product_data$Quantity_Available, labels = product_data$Product_Name, pos = 3, col = "blue")
