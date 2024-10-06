library(tidyverse)
library(readr)
library(igraph)
library(networkD3)

defer_cat_process <- read_csv("data/dummy_defer_cat_process.csv")
defer_cat_process["prev_step"] <- defer_cat_process["step"] - 1

# Network Graph ====
edge_list <- inner_join(
  defer_cat_process,
  defer_cat_process,
  by = c("step" = "prev_step"),
  suffix = c("_from", "_to")
) %>% 
  subset(select = -c(prev_step)) %>% 
  rename(step_from = step)
