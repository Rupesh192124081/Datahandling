students <- data.frame(
  Student = c("Student A", "Student B", "Student C", "Student D"),
  Grade_Level = c(9, 10, 11, 9),
  Enrollment_Date = as.Date(c("2023-08-15", "2023-09-02", "2023-07-20", "2023-08-30"))
)
#1
library(ggplot2)
average_grade <- mean(students$Grade_Level)
ggplot(students, aes(x = Student, y = Grade_Level, fill = Student)) +
  geom_bar(stat = "identity") +
  geom_hline(yintercept = average_grade, linetype = "dashed", color = "red") +
  labs(title = "Average Grade Level of Students",
       x = "Student",
       y = "Grade Level") +
  theme_minimal()
#2
ggplot(students, aes(x = Grade_Level, fill = factor(Student))) +
  geom_bar() +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Enrollment Dates by Grade Level",
       x = "Grade Level",
       y = "Number of Students") +
  theme_minimal() +
  theme(legend.position = "bottom") +
  guides(fill = guide_legend(nrow = 2))
#3
library(ggplot2)
ggplot(students, aes(x = Grade_Level, y = Enrollment_Date, color = Grade_Level)) +
  geom_point(size = 3) +
  labs(title = "Relationship between Grade Level and Enrollment Date",
       x = "Grade Level",
       y = "Enrollment Date") +
  theme_minimal() 

