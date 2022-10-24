# load data
here::i_am("code/00_load_data.R")
absolute_path_to_data <- here::here("raw_data", "course_engagement.csv")
engagement <- read.csv(absolute_path_to_data, header = TRUE)

library(tidyverse)

####

# Data Cleaning Here if needed

###

saveRDS(
  engagement, 
  file = here::here("output/data_clean.rds")
)
