 
situation <- searchTwitter("innovate", n=100)
situationDF <- twListToDF(situation)

situationDF$text

situationDF$text <- gsub("(f|ht)tp(s?)://(.*)[.][a-z]+","",situationDF$text)

situationDF$text <- sapply(situationDF$text, function(row) iconv(row, "latin1","ASCII",sub=""))

sample <- situationDF$text

head(sample)




