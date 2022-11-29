.libPaths("rlib")

library(Rchoice)
library(fs)
dir_tree(path = "protein", recurse = FALSE)

dat <- read.csv(
  file = "protein/chicken.csv",
  header = TRUE, 
  sep = ",")

mixl_basic_Blogit <- Rchoice(
  selected_n ~ 0 + buyno + o_usa,
  R = 1,
  panel = TRUE,
  index ='personid',
  print.init = FALSE,
  data = dat,
  family = binomial('logit'),
  ranp = c())

sink(commandArgs(trailingOnly = TRUE)[1])
summary(mixl_basic_Blogit)
