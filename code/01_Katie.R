here::i_am(
  "code/01_Katie.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

# Analysis here to create a table or figure 
# call the figure or table you create katie1, katie2, etc.

####

saveRDS(
  fig1, 
  file = here::here("output/katie1.rds")
)


