install.packages(c("tidyverse", "rtweet"))

library(tidyverse)
library(rtweet)
#library(httpuv)

today <- Sys.Date()

#source potiental tweets----

tweet_text_options <- read_csv("data/random_tweet_text.csv", col_names = NULL)

#connect twitter API----

options(httr_oauth_cache=T)
blog_token <- create_token(
  app = "blog_links",
  consumer_key = Sys.getenv("api_key"),
  consumer_secret = Sys.getenv("api_secret"),
  access_token = Sys.getenv("access_tok"),
  access_secret = Sys.getenv("access_secret")
)

#identify tweet text----

link_num <- nrow(tweet_text_options)

select_text_num <- sample(link_num, 1)

tweet_text <- tweet_text_options[select_text_num,1][[1]]

#send tweet text----

post_tweet(
  status = paste("Happy ", weekdays(today), "! ", tweet_text),
  token = blog_token
)

#omit used link----

revised_links <- tweet_text_options %>% slice(-text_num)

write_csv(new_twitter_links, "data/random_tweet_text.csv") #save recent links to a file
