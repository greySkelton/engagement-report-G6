here::i_am(
  "code/04_Tiffany.R"
)

engagement <- readRDS(
  file = here::here("output/data_clean.rds")
)

####

# Analysis here to create a table or figure 
# call the figure or table you create tiffany1, tiffany2, etc.

####

saveRDS(
  fig1, 
  file = here::here("output/tiffany1.rds")
)