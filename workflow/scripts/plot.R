library(readr)
library(ggplot2)

df <- read_csv(snakemake@input[["input"]])

p <- df |> ggplot(aes(x = x, y = y)) + geom_point(colour = snakemake@params[["color"]])

ggsave(filename = snakemake@output[["output"]], plot = p, width = 5, height = 5)
