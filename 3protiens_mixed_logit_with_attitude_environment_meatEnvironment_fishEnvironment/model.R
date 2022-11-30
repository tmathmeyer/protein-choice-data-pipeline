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
  + price:restaurant
  + certified 
  + fresh 
  + o_local 
  + o_usa 
  + p_fish 
  + p_beef 
  + farmed 
  
  + farmed:p_fish 
  + farmed:p_beef
  
  + farmed:a_environment 
  + farmed:a_meat_envir
  + p_fish:a_environment
  + p_fish:a_meat_envir
  + p_beef:a_environment 
  + p_beef:a_meat_envir
  
  + farmed:p_fish:a_environment 
  + farmed:p_fish:a_meat_envir
  + farmed:p_beef:a_environment 
  + farmed:p_beef:a_meat_envir
  ,
  R = 500,
  panel = TRUE,
  index ='personid',
  print.init = FALSE,
  data = dat,
  family = binomial('logit'),
  ranp = c(certified = 'n', fresh = 'n', farmed = 'n',  p_fish ='n',  p_beef = 'n', o_local = 'n', o_usa ='n' ))


sink(commandArgs(trailingOnly = TRUE)[1])
summary(mixl_basic_Blogit)
