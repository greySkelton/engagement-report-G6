here::i_am(
  "code/03_Uzoamaka.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

# Analysis here to create a table or figure 
# call the figure or table you create uzoamaka1, uzoamaka2, etc.

library(gt)
library(tidyverse)

# Get summary values per topic-unique viewers group
topicSummary <- engagement %>%
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