here::i_am(
  "code/02_Xinyue.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

# Analysis here to create a table or figure 
# call the figure or table you create xinyue1, xinyue2, etc.

####

saveRDS(
  fig1, 
  file = here::here("output/xinyue1.rds")
)