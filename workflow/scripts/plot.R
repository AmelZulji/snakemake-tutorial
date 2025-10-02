library(argparser)
library(readr)
library(ggplot2)

args <- 
  argparser::arg_parser("parse command line arguments to Rscript") |>
  add_argument(arg = "--input", help = "path to sample", default = "results/wrangled/sti_1.csv") |> 
  add_argument(arg = "--color", help = "colors to be used for poins in plot", default = "red") |> 
  add_argument(arg = "--output", help = "path to the output", default = "results/plots/sti_1.png") |> 
  parse_args()

df <- read_csv(args[["input"]])

p <- df |> ggplot(aes(x = x, y = y)) + geom_point(colour = args[["color"]])

ggsave(filename = args[["output"]], plot = p, width = 5, height = 5)
