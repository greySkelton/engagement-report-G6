here::i_am(
  "code/03_Uzoamaka.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

# Analysis here to create a table or figure 
# call the figure or table you create uzoamaka1, uzoamaka2, etc.
pacman::p_load(
  rio,            # import/export
  here,           # file pathways
  flextable,      # make HTML tables
  officer,        # helper functions for tables
  tidyverse)     # data management, summary, and visualization

library(dbplyr)
library(gt)
library(tidyverse)
library(glue)

# Get summary values per topic-unique viewers group
topicSummary <- course_engagement %>%
  group_by(topic) %>%
  summarise(
    NumberOfVids = n(),                                               
    Mean_Views = round(mean(unique_viewers, na.rm=T), 2))

fig1 <- topicSummary %>% gt() %>%
  cols_label(topic = "Video Topic",
             NumberOfVids = "Number of Videos",
             Mean_Views = "Mean Views")




saveRDS(
  fig1, 
  file = here::here("output/uzoamaka1.rds")
)