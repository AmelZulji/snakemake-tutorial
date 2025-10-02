library(tidyverse)

set.seed(1234567)
sz <- 8
lengt <- sample(x = 1:20, size = sz, replace = T) |> set_names(nm = paste0("sti_", seq_len(sz)))


dfs <- map(lengt, \(x) tibble(value = seq_len(x)))

iwalk(dfs, \(x,y) write_csv(x = x, file = fs::path("data", y, ext = "csv")))


names(lengt)

df <- tibble(study_index = names(lengt))

write_csv(df, file = "config/sample_metadata.csv")


