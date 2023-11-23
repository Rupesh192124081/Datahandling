employee<-c("john","alice","bob","sarah")
department<-c("HR","Sales","IT","Finance")
training_hours<-c(10,8,12,6)
df<-data.frame(employee,department,training_hours)
#1
hist(df$training_hours, col = "skyblue", 
     xlab = "Training Hours", ylab = "Frequency",
     main = "Distribution of Training Hours")
#2
total_training_hours <- sum(df$training_hours)
percentage_training_hours <- (df$training_hours / total_training_hours) * 100
pie(percentage_training_hours, labels = paste(df$employee, "\n", df$training_hours, " hours"), col = rainbow(length(employee)))
legend("topright", legend = df$employee, fill = rainbow(length(employee)), title = "Employee")
title(main = "Overall Employee Training Hours")
#3
ggplot(df, aes(x = "", y = training_hours, fill =employee)) +
  geom_bar(stat = "identity", width = 0.2, color = "white") +
  labs(title = "Overall Employee Training Hours",
       x = "employee",
       y = "training_hours",
       fill = "employee") +
  theme_minimal()