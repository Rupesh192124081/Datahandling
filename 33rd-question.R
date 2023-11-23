employee_data <- data.frame(
  Employee = c("John", "Alice", "Bob", "Sarah"),
  Age = c(32, 28, 35, 29),
  Gender = c("Male", "Female", "Male", "Female"),
  Department = c("HR", "Sales", "IT", "Finance"),
  Salary = c(60000, 70000, 75000, 68000)
)
#1
library(ggplot2)
age_chart <- ggplot(employee_data, aes(x = Employee, y = Age, fill = Employee)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Employee Ages",
       x = "Employee",
       y = "Age")
print(age_chart)
#2
gender_pie <- ggplot(employee_data, aes(x = "", fill = Gender)) +
  geom_bar(width = 1, stat = "count") +
  coord_polar(theta = "y") +
  labs(title = "Distribution of Customers by Gender") +
  theme_void()
print(gender_pie)
#3
library(knitr)
library(kableExtra)
demographic_table <- kable(employee_data, caption = "Demographic Information for Each Employee") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# Show the table
print(demographic_table)
