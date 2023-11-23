
library(ggplot2)
data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03")),
  StockA = c(100, 105, 110),
  StockB = c(150, 152, 148),
  StockC = c(120, 118, 122)
)

# Create a line chart
ggplot(data, aes(x = Date)) +
  geom_line(aes(y = StockA, color = "Stock A"), size = 1) +
  geom_line(aes(y = StockB, color = "Stock B"), size = 1) +
  geom_line(aes(y = StockC, color = "Stock C"), size = 1) +
  labs(title = "Stock Prices Over Time",
       x = "Date",
       y = "Stock Price") +
  scale_color_manual(values = c("Stock A" = "blue", "Stock B" = "red", "Stock C" = "green")) +
  theme_minimal()
#2
barplot(StockA,xlab = "StockA",ylab = "Percentage",col = "pink",main = "Stock Analysis")
#3
library(knitr)
kable(data, format = "html", caption = "Stock Price Data Over Time") %>%
  kable_styling()