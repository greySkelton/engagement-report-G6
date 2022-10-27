here::i_am(
  "code/02_Xinyue.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

# Analysis here to create a table or figure 
# call the figure or table you create xinyue1, xinyue2, etc.

## some data cleaning
# change the video length into seconds
library(lubridate)
engagement$length_in_seconds <- period_to_seconds(ms(engagement$length))
engagement$length_in_seconds[4] <- period_to_seconds(hms(engagement$length[4]))
# str(engagement$length_in_seconds)

## fit a linear model
# take unique viewer as the response variable
# week, video number, video length, re-upload as predictors, 
# maybe including topic, but I think video title maybe not that useful

mod1 <- lm(unique_viewers ~ factor(week) + factor(video_number) + factor(topic) + factor(reupload) + length_in_seconds, data=engagement)
s1 <- summary(mod1)

## the week number, the video number, and the topics need to be divided into groups

##
# generate a summary table for this model
library(gtsummary)
library(dplyr)

reg.tbl1 <- tbl_regression(mod1)

####

saveRDS(
  mod1, 
  file = here::here("output/xinyue1.rds")
)

saveRDS(
  reg.tbl1, 
  file = here::here("output/xinyue2.rds")
)
