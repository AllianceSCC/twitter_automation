#library(tidyverse)
library(rtweet)
#library(httpuv)

today <- Sys.Date()

#connect twitter API----

source("permissions/twitter_secret_api.R")

#generate and tweet text----

blog_link <- paste0("http://www.alliancescicommconsulting.com/post", post_name, "/")


tweet_text_options <- c("A new Scientific Writing & Editing Tip is live. #SciWri #Academia ",
                  "We've got a new Scientific Writing & Editing Tip coming your way... #SciComm #PhDChat ",
                  "Got questions about scientific writing??? See our Scientific Writing & Editing Tips. P.S. We have a new blog up #AcWri #PhDChat ")

select_tweet_text <- sample(tweet_text_options, 1)

#send tweet text----

post_tweet(
  status = paste("Happy ", weekdays(today), "! ", select_tweet_text, blog_link),
  token = blog_token
)
