# Load required libraries
library(ggplot2)
library(knitr)

# Sales data
sales_data <- data.frame(
  Category = c("Electronics", "Clothing", "Appliances"),
  Sales = c(50000, 35000, 40000)
)

# Funnel conversion data
conversion_data <- data.frame(
  Category = c("Electronics", "Clothing", "Appliances"),
  Stage1 = c(100, 80, 90),
  Stage2 = c(80, 60, 70),
  Stage3 = c(60, 40, 50),
  Stage4 = c(40, 20, 30)
)

# Create a pie chart
pie_chart <- ggplot(sales_data, aes(x = "", y = Sales, fill = Category)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  labs(title = "Distribution of Sales Across Product Categories", fill = "Category") +
  theme_minimal()

# Create a funnel chart
funnel_chart <- ggplot(conversion_data, aes(x = Category)) +
  geom_col(aes(y = Stage1), fill = "skyblue", width = 0.5) +
  geom_col(aes(y = Stage2), fill = "lightblue", width = 0.5) +
  geom_col(aes(y = Stage3), fill = "lightcyan", width = 0.5) +
  geom_col(aes(y = Stage4), fill = "lightgreen", width = 0.5) +
  labs(title = "Sales Conversion Funnel by Product Category", x = "Category", y = "Conversion Rate") +
  theme_minimal()

# Create a table
sales_table <- kable(sales_data, col.names = c("Category", "Sales"), caption = "Sales Data by Category")

# Display charts and table
print(pie_chart)
print(funnel_chart)
print(sales_table)
