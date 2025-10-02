library(argparser)
library(readr)

args <- 
  argparser::arg_parser("parse command line arguments to Rscript") |>
  add_argument(arg = "--input", help = "path to sample", default = "data/sti_1.csv") |> 
  add_argument(arg = "--nrow", help = "number of columns in which values should be orginised", default = 4) |> 
  add_argument(arg = "--output", help = "path to the output", default = "results/wrangled/sti_1.csv") |> 
  parse_args()

df <- read_csv(args[["input"]])

df <- 
  df |> mutate(
  x = rep(seq_len(args[["nrow"]]), length.out = nrow(df)),
  y = ((seq_len(nrow(df)) - 1) %/% args[["nrow"]])
  )

readr::write_csv(x = df, file = args[["output"]])
