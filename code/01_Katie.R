here::i_am(
  "code/01_Katie.R"
)

# Call in the clean data
engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####
# Create a summarized data set with average views per week
figure1 <- engagement %>% group_by(week) %>% summarise(average_views = mean(views), sd = sd(views))

library(ggplot2)

fig1 <- ggplot(figure1, aes(x=week, y=average_views)) +
  geom_bar(position=position_dodge(), stat="identity",
           colour='black', fill = "#0099f9") +
  geom_errorbar(aes(ymin=average_views-sd, ymax=average_views+sd), width=.2) +
  theme_classic()+
  labs(
    title = "Figure 1. Engagement with pre-read videos by week",
    x = "Course week",
    y = "Average number of views"
  )




# call the figure or table you create katie1, katie2, etc.

####

saveRDS(
  fig1, 
  file = here::here("output/katie1.rds")
)


