setwd("C:\\Cornell_Graduate_Studies\\Job\\interview_memory\\Hertz\\Tableau work\\Data\\Broward County, FL")

library(dplyr)
library(stringr)


# read data file
reviews = read.csv("reviews_raw_2019.csv")
# read stop words list 
stop_word = read.table('stop_word_list.txt')
colnames(stop_word) = 'Word'

# Next, get 100 top frequent keywords for 'review'.

review_word = c('')
for (i in 1:nrow(reviews)){
  review_word = paste(review_word, reviews$comments[i], sep = '')
}

# seperate by blanks
txtList = lapply(review_word, strsplit," ")
txtChar = unlist(txtList)

# keep only letters and numerals
txtChar = str_replace_all(txtChar, "[^[:alnum:]]", " ")
# remove blanks
txtChar = gsub(" ", "", txtChar, fixed = TRUE)
# remove null value
txtChar = txtChar[txtChar!=""]
# transform to data frame
word_count = as.data.frame(table(txtChar))
colnames(word_count) = c("Word","freq")
# get words and their frequency
ordFreq = word_count[order(word_count$freq,decreasing=T),]
# filter meaningless common words, such as 'a', 'the', 'in', etc, using the stop word list 
antiWord = data.frame(stop_word, stringsAsFactors=F)
# ordFreq - antiWord is what we want
word_count_final = anti_join(ordFreq,antiWord,by="Word") %>% arrange(desc(freq))  

# see the top 100 frequents words
word_count_final = word_count_final[1:100,]
# write.csv(word_count_final, "word_count_final.csv")




#---------------------------------------------------------------------------#
review = read.csv("reviews_raw_2019.csv")
review[is.na(review)] = 0

agg_review = aggregate(. ~ listing_id, review, sum)
agg_review = agg_review[,c(1, 8:22)]
#write.csv(agg_review,"agg_review.csv")

listing = read.csv("listing_all.csv")
summary(listing$price)
