# Sample data
sales_data <- data.frame(
  Month = c("January", "February", "March", "April", "May"),
  Sales = c(15000, 18000, 22000, 20000, 23000)
)

# Convert Month to a factor with ordered levels
sales_data$Month <- factor(sales_data$Month, levels = c("January", "February", "March", "April", "May"))

# Plot the time series line chart
plot(sales_data$Month, sales_data$Sales, type = "b", 
     xlab = "Month", ylab = "Sales (in $)",
     main = "Monthly Sales Trend")

# Convert Month to a numeric variable for autocorrelation plot
sales_data$Month_numeric <- as.numeric(sales_data$Month)

# Autocorrelation plot
acf(sales_data$Sales, main = "Autocorrelation Plot for Monthly Sales")

