# Create a dataframe with the provided data
df <- data.frame(
  Customer = c("Customer A", "Customer B", "Customer A", "Customer C"),
  Product = c("Widget X", "Widget Y", "Widget Z", "Widget X"),
  Quantity = c(5, 3, 2, 4),
  Price = c(10.00, 15.00, 8.50, 9.00)
)
library(ggplot2)
ggplot(df, aes(x = Quantity)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.2) +
  labs(title = "Distribution of Quantity",
       x = "Quantity",
       y = "Frequency")
#2
total_quantity <- sum(df$Quantity)
total_price <- sum(df$Quantity * df$Price)

# Create a data frame for pie chart
pie_data <- data.frame(Category = c("Quantity", "Price"),
                       Value = c(total_quantity, total_price))
library(ggplot2)

# Create a simple pie chart
ggplot(pie_data, aes(x = "", y = Value, fill = Category)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  labs(title = "Distribution of Overall Quantity and Price",
       fill = "Category",
       y = "Value")
#3
# Customer feedback data
customer_feedback <- c(
  "Great product! Loved it.",
  "Not satisfied with the service.",
  "Widget X is amazing.",
  "Could be better."
)

# Text preprocessing
corpus <- Corpus(VectorSource(customer_feedback))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

# Perform sentiment analysis (using a simple rule-based approach)
sentiment <- sapply(corpus, function(x) {
  ifelse(length(grep("excellent|great|amazing", x)) > length(grep("poor|not satisfied|could be better", x)), "positive", "negative")
})

# Create a word cloud for positive feedback
positive_words <- customer_feedback[sentiment == "positive"]
wordcloud(words = unlist(strsplit(positive_words, " ")), min.freq = 1, scale=c(3, 0.5), colors=brewer.pal(8, "Dark2"))





