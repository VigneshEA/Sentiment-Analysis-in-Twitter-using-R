library(plyr)

situation <- searchTwitter("innovate", n=100, lang="en",resultType = "recent" )
situationDF <- twListToDF(situation)

#convert list to vector
situation = sapply(situation, function(x) x$getText())  #sapply returns a vector
situation<- do.call("rbind",lapply(situation, as.data.frame)) # lapply returns a list

situation <- sapply(situation, function(row) iconv(row, "latin1","ASCII",sub=""))

str(situation)

head(situation)

library(tm)#text mining
library(corpus)
situation_corpus <- Corpus(VectorSource(situation)) #corpus-collection of Documents
situation_corpus
inspect(situation_corpus[1])

#clean text 
library(wordcloud)
situation_clean <- tm_map(situation_corpus, removePunctuation)
situation_clean <- tm_map(situation_clean, removeWords, stopwords("english"))
situation_clean <- tm_map(situation_clean, removeNumbers)
situation_clean <- tm_map(situation_clean, stripWhitespace)
situation_clean <- tm_map(situation_clean, content_transformer(tolower))
situation_clean <- tm_map(situation_clean, removeWords, c("innovate"))
inspect(situation_clean[1])

wordcloud(situation_clean,random.order= F,max.words=80, col = rainbow(50),scale=c(5,1))



