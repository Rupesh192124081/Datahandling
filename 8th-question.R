# Install and load required libraries
install.packages("ggplot2")
library(ggplot2)

# Sample data
employee_data <- data.frame(
  Employee_ID = c(1, 2, 3),
  Department = c("Sales", "HR", "Marketing"),
  Years_of_Service = c(5, 3, 7),
  Performance_Score = c(85, 92, 78)
)

# Line chart for performance trend over time
performance_line_chart <- ggplot(employee_data, aes(x = Years_of_Service, y = Performance_Score, group = 1)) +
  geom_line() +
  labs(title = "Performance Trend Over Time",
       x = "Years of Service",
       y = "Performance Score") +
  theme_minimal()

# Display the chart
print(performance_line_chart)

# Bar chart for the distribution of employees across departments
department_bar_chart <- ggplot(employee_data, aes(x = Department, y = Years_of_Service, fill = Department)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Employees Across Departments",
       x = "Department",
       y = "Years of Service",
       fill = "Department") +
  theme_minimal()

# Display the chart
print(department_bar_chart)

# Table for performance data
performance_table <- employee_data %>%
  select(Employee_ID, Department, Years_of_Service, Performance_Score) %>%
  rename("Employee ID" = Employee_ID,
         "Years of Service" = Years_of_Service,
         "Performance Score" = Performance_Score)

# Print the table
print(performance_table)

