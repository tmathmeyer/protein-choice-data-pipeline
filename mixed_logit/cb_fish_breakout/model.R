.libPaths("rlib")

library(Rchoice)

dat <- read.csv(
  file = "protein/chicken.csv",
  header = TRUE,
  sep = ",")

mixl_basic_Blogit <- Rchoice(
  selected_n ~ 0
  + buyno
  + price
  + certified
  + fresh
  + o_local
  + o_usa
  + p_trout
  + p_yellowtail
  + p_whitefish
  + p_beef
  + farmed
  + price:restaurant
  + farmed:p_trout
  + farmed:p_yellowtail
  + farmed:p_whitefish
  + farmed:p_beef
  ,
  R = 500,
  panel = TRUE,
  index = 'personid',
  print.init = FALSE,
  data = dat,
  family = binomial('logit'),
  ranp = c(
    certified = 'n',
    fresh = 'n',
    farmed = 'n',
    p_trout ='n',
    p_yellowtail='n',
    p_whitefish='n',
    p_beef = 'n',
    o_local = 'n',
    o_usa ='n'))

sink(commandArgs(trailingOnly = TRUE)[1])
summary(mixl_basic_Blogit)
