.libPaths("rlib")
library(Rchoice)

dat <- read.csv(
  file = "protein/chicken.csv",
  header = TRUE, sep = ",")

mixl_att_Rc <- Rchoice(
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
  + farmed:a_health 
  + farmed:a_taste 
  + farmed:a_environment 
  + farmed:a_meat_envir
  + farmed:a_fish_envir 
  + farmed:a_meat_health
  + farmed:a_fish_health
  + p_fish:a_health 
  + p_fish:a_taste 
  + p_fish:a_environment 
  + p_fish:a_meat_envir
  + p_fish:a_fish_envir 
  + p_fish:a_meat_health
  + p_fish:a_fish_health
  + p_beef:a_health 
  + p_beef:a_taste 
  + p_beef:a_environment 
  + p_beef:a_meat_envir
  + p_beef:a_fish_envir 
  + p_beef:a_meat_health
  + p_beef:a_fish_health
  + farmed:p_fish:a_health 
  + farmed:p_fish:a_taste 
  + farmed:p_fish:a_environment 
  + farmed:p_fish:a_meat_envir
  + farmed:p_fish:a_fish_envir 
  + farmed:p_fish:a_meat_health
  + farmed:p_fish:a_fish_health
  + farmed:p_beef:a_health 
  + farmed:p_beef:a_taste 
  + farmed:p_beef:a_environment 
  + farmed:p_beef:a_meat_envir
  + farmed:p_beef:a_fish_envir 
  + farmed:p_beef:a_meat_health
  + farmed:p_beef:a_fish_health
  ,
  data = dat,
  family = binomial("logit"),
  R = 500,
  panel = TRUE,
  index ='personid',
  print.init = TRUE,
  ranp = c(
    certified = 'n',
    fresh = 'n',
    farmed = 'n', 
    p_fish = 'n',
    p_beef = 'n',
    o_local = 'n',
    o_usa ='n'))

sink(commandArgs(trailingOnly = TRUE)[1])
summary(mixl_att_Rc)
