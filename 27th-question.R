# Sample data
sales_data <- data.frame(
  Employee = c("John", "Alice", "Bob", "Sarah"),
  Sales = c(5000, 6200, 4500, 7400),
  Advertising_Budget = c(2000, 2500, 1500, 3000)
)
library(ggplot2)

# Create a line chart
line_chart <- ggplot(sales_data, aes(x = Employee, y = Sales, group = 1)) +
  geom_line() +
  geom_point() +
  labs(title = "Monthly Sales",
       x = "Employee",
       y = "Sales (in dollars)") +
  theme_minimal()
print(line_chart)
#2
sales_data <- sales_data[order(-sales_data$Sales),]
# Generate a bar chart
bar_chart <- ggplot(sales_data, aes(x = reorder(Employee, -Sales), y = Sales, fill = Employee)) +
  geom_bar(stat = "identity") +
  labs(title = "Top-Selling Employees for the Year",
       x = "Employee",
       y = "Sales (in dollars)",
       fill = "Employee") +
  theme_minimal()
# Display the chart
print(bar_chart)
#3
scatter_plot <- ggplot(sales_data, aes(x = Advertising_Budget, y = Sales, label = Employee)) +
  geom_point() +
  geom_text(vjust = -0.5) +  # Add labels above the points
  labs(title = "Scatter Plot: Advertising Budget vs. Monthly Sales",
       x = "Advertising Budget",
       y = "Monthly Sales") +
  theme_minimal()
# Print the plot
print(scatter_plot)
