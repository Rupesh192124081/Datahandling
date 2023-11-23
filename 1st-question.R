#1

# Data
month <- c("January", "February", "March", "April", "May")
sales <- c(15000, 18000, 22000, 20000, 23000)
# Scatter plot
plot(sales, main = "Sales Data", xlab = "Month", ylab = "Sales", pch = 16, col = "blue")
# Data
month <- c("January", "February", "March", "April", "May")
sales <- c(15000, 18000, 22000, 20000, 23000)
# Bar plot
barplot(sales, names.arg = month, col = "green", main = "Sales Data", xlab = "Month", ylab = "Sales")
# Data
month <- c("January", "February", "March", "April", "May")
sales <- c(15000, 18000, 22000, 20000, 23000)
# Line plot
plot(sales, type = "l", col = "red", lty = 2, main = "Sales Data", xlab = "Month", ylab = "Sales")
