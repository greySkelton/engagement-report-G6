here::i_am(
  "code/02_Xinyue.R"
)

# engagement <- readRDS(
#   file = here::here("output/data_clean.rds")
# )

engagement <- read.csv(here::here("raw_data/course_engagement.csv"))

####

# Analysis here to create a table or figure 
# call the figure or table you create xinyue1, xinyue2, etc.

## some data cleaning
# change the video length into seconds
library(lubridate)
engagement$length_in_seconds <- period_to_seconds(ms(engagement$length))
engagement$length_in_seconds[4] <- period_to_seconds(hms(engagement$length[4]))
# str(engagement$length_in_seconds)


## the week number, the video number, and the topics need to be divided into groups
library(dplyr)

engagement <- engagement %>% 
  mutate(week.claps=ifelse(week<=2,1,
                           ifelse(week<=4,2,3))) %>% 
  mutate(video_number.claps=
           ifelse(video_number<=5,1,
                  ifelse(video_number<=10,2,3))) %>% 
  mutate(topics.claps=ifelse(topic %in% 
  c("course_logistics", "mac_install", "windows_install"), 
  "Set-ups", engagement$topic))

engagement$week.claps <- factor(engagement$week.claps, levels=c(1,2,3), labels=c("Week 1&2", "Week 3&4", "Week 5&6"))
engagement$video_number.claps <- factor(engagement$video_number.claps, levels=c(1,2,3), labels=c("Video number no more than 5", "Video number no more than 10", "Video number more than 10"))
engagement$reupload <- factor(engagement$reupload, levels=c(0,1), labels=c("No","Yes"))


## fit a linear model
# take unique viewer as the response variable
# week, video number, video length, re-upload as predictors, 
# maybe including topic, but I think video title maybe not that useful

library(labelled)

var_label(engagement) <- list(
  week.claps="Week",
  video_number.claps="Video numbers",
  topics.claps="Topic",
  reupload="Reupload",
  length_in_seconds="Vedio length in seconds"
)

mod1 <- lm(unique_viewers ~ week.claps + video_number.claps + topics.claps + reupload + length_in_seconds, data=engagement)
s1 <- summary(mod1)



##
# generate a summary table for this model
library(gtsummary)


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
