here::i_am(
  "code/04_Tiffany.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####


views_per_topic <- course_engagement %>% 
  
  ggplot(course_engagement, aes(x=topic, y=views)) + 
  geom_bar(stat = "identity")

####

saveRDS(
  fig1, 
  file = here::here("output/tiffany1.rds")
)