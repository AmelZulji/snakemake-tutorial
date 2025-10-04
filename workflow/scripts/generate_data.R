library(tidyverse)
library(argparser)

args <- 
  argparser::arg_parser("parse command line arguments to Rscript") |>
  add_argument(arg = "--sample", help = "[INPUT] path to sample metadata", default = c("sti_1")) |> 
  add_argument(arg = "--seed", help = "[PARAM] seed for random value generation", default = c("1234567")) |> 
  add_argument(
    arg = "--output", 
    help = "[OUTPUT] path to sample", 
    default = c(
      "data/sti_1.csv"
    )) |>
  parse_args()

set.seed(args[["seed"]])
sz <- parse_number(args[["sample"]]) + 5

df <- tibble(value = seq_len(sz))

write_csv(x = df, file = args[["output"]])

