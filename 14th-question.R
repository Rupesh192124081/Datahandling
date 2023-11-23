# Load required libraries
library(ggplot2)
library(fmsb)
library(knitr)

# Survey response data
survey_data <- data.frame(
  Respondent = c(1, 2, 3),
  Question_1 = c("A", "B", "C"),
  Question_2 = c("B", "A", "A"),
  Question_3 = c("C", "D", "B")
)

# a. Stacked bar chart for Question 1
stacked_bar_chart <- ggplot(survey_data, aes(x = as.factor(Question_1))) +
  geom_bar(stat = "count", fill = "skyblue") +
  labs(title = "Distribution of Answers for Question 1", x = "Answer", y = "Count") +
  theme_minimal()

# b. Radar chart for overall pattern of responses
radar_data <- data.frame(
  id = "Overall",
  survey_data[, -1]
)

radar_chart <- radarchart(radar_data, axistype = 1, pcol = "skyblue", plwd = 2, pfcol = "lightblue", title = "Overall Pattern of Responses")

# c. Table for survey response data
response_table <- knitr::kable(survey_data, col.names = c("Respondent", "Q1", "Q2", "Q3"), caption = "Survey Response Data")

# Display charts and table
print(stacked_bar_chart)
print(radar_chart)
cat(response_table)
