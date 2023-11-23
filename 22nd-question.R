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
# Install required packages
install.packages(c("tm", "wordcloud"))

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
