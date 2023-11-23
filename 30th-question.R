student_data <- data.frame(
  Student = c("Student A", "Student B", "Student C", "Student D"),
  Math = c(85, 76, 92, 88),
  Science = c(92, 88, 79, 95),
  History = c(78, 89, 87, 82)
)
library(ggplot2)
library(reshape2)
student_data_long <- melt(student_data, id.vars = "Student", variable.name = "Subject", value.name = "Marks")
student_data_long
#1 
barplot(student_data_long$Marks,  col = c("skyblue", "lightgreen", "lightcoral"),
        names.arg = student_data_long$Student, main = "Student Marks",
        xlab = "Student", ylab = "Marks", ylim = c(0, 100),
        legend.text = colnames(student_data)[-1], args.legend = list(title = "Subjects", x = "topright"))

#2
stacked_bar_chart <- ggplot(student_data_long, aes(x = Student, y = Marks, fill = Subject)) +
  geom_bar(stat = "identity") +
  labs(title = "Subject Scores of Each Student", x = "Student", y = "Marks", fill = "Subject") +
  theme_minimal()
print(stacked_bar_chart)
#3
scatter_plot <- ggplot(student_data, aes(x = Math, y = History)) +
  geom_point(size=3) +
  labs(title = "Scatter Plot: Math vs. History", x = "Math", y = "History") +
  theme_minimal()
print(scatter_plot)



