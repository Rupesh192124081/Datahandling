df <- data.frame(
  Region = c("North", "North", "South", "South"),
  Month = c("Jan", "Feb", "Jan", "Feb"),
  Sales = c(5000, 6200, 4800, 5600)
)
#1
library(ggplot2)
ggplot(df, aes(x = Month, y = Sales, fill = Region)) +
  geom_bar(stat = "identity", position = "dodge", color = "black", width = 0.7) +
  labs(title = "Sales by Region for the First Quarter",
       x = "Month",
       y = "Sales (USD)",
       fill = "Region") +
  theme_minimal()
#2
library(ggplot2)
library(dplyr)
sales_summarized <- sales_data %>%
  group_by(Region, Month) %>%
  summarise(Total_Sales = sum(Sales))

# Create a stacked area chart
ggplot(sales_summarized, aes(x = Month, y = Total_Sales, fill = Region)) +
  geom_area() +
  labs(title = "Overall Sales Trend",
       x = "Month",
       y = "Sales (USD)",
       fill = "Region") +
  theme_minimal()
#3
library(knitr)
# Create a table
sales_table <- table(sales_data$Month, sales_data$Region)
colnames(sales_table) <- unique(sales_data$Region)
rownames(sales_table) <- unique(sales_data$Month)
kable(sales_table, caption = "Monthly Sales Data for Each Product", align = "c", format = "html") %>%
  kable_styling()