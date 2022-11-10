here::i_am(
  "code/04_Tiffany.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

library(tidyverse)
views_per_topic <- engagement %>% 
  ggplot(aes(x=topic, y=views)) + 
  geom_bar(stat = "identity")

####

saveRDS(
  views_per_topic, 
  file = here::here("output/tiffany1.rds")
)