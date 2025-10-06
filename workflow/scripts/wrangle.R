library(readr)
library(dplyr)

# args <- 
#   argparser::arg_parser("parse command line arguments to Rscript") |>
#   add_argument(arg = "--input", help = "[INPUT] path to sample", default = "data/sti_1.csv") |> 
#   add_argument(arg = "--nrow", help = "[PARAM] number of columns in which values should be orginised", default = 4) |> 
#   add_argument(arg = "--output", help = "[OUTPUT] path to the output", default = "results/wrangled/sti_1.csv") |> 
#   parse_args()

# setClass("Snakemake",
#          slots = c(
#            input = "list",
#            output = "list",
#            params = "list"
#          ))
# 
# snakemake <- new("Snakemake",
#   input  = list(input = "data/sti_1.csv"),
#   output = list(output = "results/wrangled/sti_1.csv"),
#   params = list(nrow = 4)
# )

df <- read_csv(snakemake@input[["input"]])

df <- 
  df |> mutate(
  x = rep(seq_len(snakemake@params[["nrow"]]), length.out = nrow(df)),
  y = ((seq_len(nrow(df)) - 1) %/% snakemake@params[["nrow"]])
  )

readr::write_csv(x = df, file = snakemake@output[["output"]])
