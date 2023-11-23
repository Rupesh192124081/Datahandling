# Employee data
employee_data <- data.frame(
  Employee_ID = 1:5,
  Department = c("Sales", "HR", "Marketing", "Sales", "HR"),
  Years_of_Service = c(5, 3, 7, 4, 2),
  Performance_Score = c(85, 92, 78, 90, 76)
)

# a. Bar chart for distribution of employees across different departments
barplot(table(employee_data$Department), col = rainbow(length(unique(employee_data$Department))),
        main = "Distribution of Employees Across Departments",
        xlab = "Department", ylab = "Count")


# b. Line chart for performance trend over time
plot(employee_data$Years_of_Service, employee_data$Performance_Score, type = "o", col = "blue",
     xlab = "Years of Service", ylab = "Performance Score",
     main = "Performance Trend Over Time",
     legend.text = "Employee",
     pch = 16)
legend("bottomright", legend = employee_data$Employee_ID, col = "blue", pch = 16, title = "Employee ID")

#c

library(kableExtra)

# Display the table
kable(employee_data, caption = "Employee Performance") %>%
  kable_styling()