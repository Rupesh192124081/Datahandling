# Sample data
employee_data <- data.frame(
  Employee_ID = c(1, 2, 3, 4, 5),
  Name = c("John Smith", "Jane Doe", "Robert Brown", "Sarah White", "Michael Lee"),
  Department = c("Sales", "HR", "Marketing", "Sales", "HR"),
  Years_of_Service = c(5, 3, 7, 4, 2),
  Performance_Score = c(85, 92, 78, 90, 76)
)

# Histogram for employee performance scores
histogram <- ggplot(employee_data, aes(x = Performance_Score)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Employee Performance Scores",
       x = "Performance Score",
       y = "Frequency") +
  theme_minimal()

# Display the histogram
print(histogram)

# Pie chart for the distribution of employee satisfaction scores
pie_chart <- ggplot(employee_data, aes(x = "", fill = factor(Performance_Score))) +
  geom_bar(width = 1) +
  coord_polar("y") +
  labs(title = "Distribution of Employee Satisfaction Scores",
       fill = "Performance Score") +
  theme_minimal()

# Display the pie chart
print(pie_chart)
