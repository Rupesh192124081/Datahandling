# Install and load required libraries
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

# Sample data
survey_data <- data.frame(
  Survey_ID = c(1, 2, 3),
  Question_1 = c("A", "B", "C"),
  Question_2 = c("B", "A", "A"),
  Question_3 = c("C", "D", "B")
)

# a. Grouped bar chart to visualize the distribution of answers for Question 1
grouped_bar_chart_q1 <- survey_data %>%
  ggplot(aes(x = Question_1, fill = Question_1)) +
  geom_bar(stat = "count") +
  labs(title = "Distribution of Answers for Question 1",
       x = "Response",
       y = "Count") +
  theme_minimal()

# b. Stacked bar chart to represent the overall distribution of responses for all three questions
stacked_bar_chart <- survey_data %>%
  gather(Question, Response, -Survey_ID) %>%
  ggplot(aes(x = Response, fill = Question)) +
  geom_bar(stat = "count") +
  labs(title = "Overall Distribution of Responses",
       x = "Response",
       y = "Count",
       fill = "Question") +
  theme_minimal()

# c. Table to show the survey response data for each survey
response_table <- survey_data %>%
  gather(Question, Response, -Survey_ID) %>%
  arrange(Survey_ID) %>%
  rename("Survey ID" = Survey_ID,
         "Question" = Question,
         "Response" = Response)

# Display the visualizations and table
print(grouped_bar_chart_q1)
print(stacked_bar_chart)
print(response_table)
