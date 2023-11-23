library(ggplot2)
library(dplyr)

# Original data
data <- data.frame(
  Student = c("Student A", "Student B", "Student C", "Student D"),
  Date = c("2023-01-01", "2023-01-01", "2023-01-02", "2023-01-02"),
  Attendance = c("Present", "Absent", "Present", "Present")
)

# Convert Date to a Date object
data$Date <- as.Date(data$Date)

# Plot 1: Bar chart of attendance for each student
ggplot(data, aes(x = Student, fill = Attendance)) +
  geom_bar(position = "dodge", width = 0.7) +
  labs(title = "Attendance of Each Student",
       x = "Student",
       y = "Count") +
  scale_fill_manual(values = c("Present" = "green", "Absent" = "red")) +
  theme_minimal()

# Arrange data to keep only the most recent attendance status for each student
recent_attendance <- data %>%
  arrange(Student, desc(Date)) %>%
  group_by(Student) %>%
  slice(1)

# Plot 2: Stacked bar chart of the most recent attendance status
ggplot(recent_attendance, aes(x = Student, fill = Attendance)) +
  geom_bar(stat = "count", position = "stack") +  # Change position to "stack"
  labs(title = "Most Recent Attendance Status", x = "Student", y = "Count") +
  scale_fill_manual(values = c("Present" = "green", "Absent" = "red"))

# Plot 3: Scatter plot of the relationship between Class Date and Attendance
ggplot(data, aes(x = Date, y = reorder(Student, Date), color = Attendance)) +
  geom_point(size = 3) +
  labs(title = "Relationship Between Class Date and Attendance",
       x = "Class Date",
       y = "Student",
       color = "Attendance") +
  theme_minimal()
