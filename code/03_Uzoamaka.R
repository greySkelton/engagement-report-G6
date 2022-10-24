here::i_am(
  "code/03_Uzoamaka.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

# Analysis here to create a table or figure 
# call the figure or table you create uzoamaka1, uzoamaka2, etc.

####

saveRDS(
  fig1, 
  file = here::here("output/uzoamaka1.rds")
)