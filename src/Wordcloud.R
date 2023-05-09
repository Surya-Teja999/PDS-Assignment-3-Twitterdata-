#installing required packages
install.packages("tidytext")
install.packages("dplyr")
install.packages("wordcloud")
install.packages("tm")
install.packages("ggplot2")

# Load required libraries
library(tidytext)
library(dplyr)
library(ggplot2)
library(tm)
library(wordcloud)
library(SnowballC)

#Loading the given data
Data_twitter<- read.csv("C://Users/gadde/Desktop/PDS(Assign-4)/16346059/data_clean/Corona_NLP_test.csv")
print(Data_twitter)

# a.) Converting text to corpus
tokens <- Data_twitter %>%
  unnest_tokens(word, OriginalTweet) %>% anti_join(get_stopwords(),by="word")

# b.) printing after Stop word removal
print(tokens)

# c.) counting word frequencies

freq <- tokens %>%
  count(word, sort = TRUE)

#word_freq<-tokens
print(freq)

# d.)creating word cloud 

png("C://Users/gadde/Desktop/PDS(Assign-4)/16346059/results/wordcloud.png", width = 800, height = 800, units = "px")
wordcloud(words = freq$word, freq = freq$n, min.freq = 1,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
dev.off()



