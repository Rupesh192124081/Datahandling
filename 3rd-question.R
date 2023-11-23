# Employee data
employee_data <- data.frame(
  Employee_ID = 1:5,
  Department = c("Sales", "HR", "Marketing", "Sales", "HR"),
  Years_of_Service = c(5, 3, 7, 4, 2),
  Performance_Score = c(85, 92, 78, 90, 76)
)

# a. Line chart for performance trend over time
plot(employee_data$Years_of_Service, employee_data$Performance_Score, type = "o", col = "blue",
     xlab = "Years of Service", ylab = "Performance Score",
     main = "Performance Trend Over Time",
     legend.text = "Employee",
     pch = 16)
legend("bottomright", legend = employee_data$Employee_ID, col = "blue", pch = 16, title = "Employee ID")

# b. Bar chart for distribution of employees across different departments
barplot(table(employee_data$Department), col = rainbow(length(unique(employee_data$Department))),
        main = "Distribution of Employees Across Departments",
        xlab = "Department", ylab = "Count")

# c. Scatter plot for correlation between years of service and performance scores
plot(employee_data$Years_of_Service, employee_data$Performance_Score, col = "green",
     xlab = "Years of Service", ylab = "Performance Score",
     main = "Scatter Plot: Years of Service vs Performance Score")

# Add a trendline (linear regression line)
abline(lm(employee_data$Performance_Score ~ employee_data$Years_of_Service), col = "red")

# Add correlation coefficient to the plot
cor_coef <- cor(employee_data$Years_of_Service, employee_data$Performance_Score)
text(1, max(employee_data$Performance_Score), paste("Correlation:", round(cor_coef, 2)), col = "blue")
