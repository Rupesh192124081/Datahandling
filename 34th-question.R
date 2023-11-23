# Order data
order_data <- data.frame(
  Order_ID = c(2001, 2002, 2003, 2004),
  Customer_Name = c("John", "Alice", "Bob", "Sarah"),
  Product = c("Widget X", "Widget Y", "Widget X", "Widget Z"),
  Quantity = c(10, 5, 8, 12),
  Price = c(5, 8, 5, 7)
)
#1
library(ggplot2)
ggplot(order_data, aes(x = Product, y = Quantity, fill = Product)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(title = "Distribution of Product Quantity",
       x = "Product",
       y = "Quantity") +
  theme_minimal()
#2
total_quantity <- sum(order_data$Quantity)
total_price <- sum(order_data$Price)
pie(c(total_quantity, total_price),
    labels = c("Quantity", "Price"),
    col = c("skyblue", "pink"),
    main = "Distribution of Overall Quantity and Price")

#3
# Sample data
customer_data <- data.frame(
  Customer_ID = c(1, 2, 3, 4, 5),
  Age = c(28, 35, 42, 30, 45),
  Satisfaction_Score = c(4, 5, 3, 4, 5)
)

#a
# Create a histogram for customer ages
hist(customer_data$Age, col = "skyblue", 
     xlab = "Age", ylab = "Frequency",
     main = "Distribution of Customer Ages")

#b
# Count the frequency of each satisfaction score
satisfaction_counts <- table(customer_data$Satisfaction_Score)

# Generate a pie chart
pie(satisfaction_counts, labels = paste("Score", names(satisfaction_counts)), 
    col = c("skyblue", "lightgreen", "lightcoral"),
    main = "Overall Distribution of Customer Satisfaction Scores")

#c


# Load required libraries
library(tm)
library(wordcloud)

# Sample data
customer_data <- data.frame(
  Customer_ID = c(1, 2, 3, 4, 5),
  Age = c(28, 35, 42, 30, 45),
  Satisfaction_Score = c(4, 5, 3, 4, 5),
  Feedback = c(
    "The service was excellent! I am very satisfied.",
    "Great experience, highly recommended!",
    "Could be better. Not completely satisfied.",
    "The product quality needs improvement.",
    "Outstanding service, exceeded my expectations."
  )
)

# Text preprocessing
corpus <- Corpus(VectorSource(customer_data$Feedback))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

# Perform sentiment analysis (using a simple rule-based approach)
sentiment <- sapply(corpus, function(x) {
  ifelse(length(grep("excellent|great|outstanding", x)) > length(grep("poor|not satisfied|needs improvement", x)), "positive", "negative")
})

# Add sentiment to the data frame
customer_data$Sentiment <- sentiment

# Create a word cloud for positive feedback
positive_words <- customer_data$Feedback[customer_data$Sentiment == "positive"]
wordcloud(words = unlist(strsplit(positive_words, " ")), min.freq = 1, scale=c(3, 0.5), colors=brewer.pal(8, "Dark2"))
