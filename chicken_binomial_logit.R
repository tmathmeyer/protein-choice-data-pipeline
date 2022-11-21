.libPaths("rlib")

library(Rchoice)

dat <- read.csv(
  file = "chicken.csv",
  header = TRUE, 
  sep = ",")

mixl_basic_Blogit <-  Rchoice(selected_n ~ 0 + buyno
                         #+ price
                         #+ certified
                         #+ fresh
                         #+ o_local
                         + o_usa
                         #+ p_fish
                         #+ p_beef
                         #+ farmed
                         #+ price:restaurant
                         #+ farmed:p_fish
                         #+ farmed:p_beef
                         ,
                         R = 1,
                         panel = TRUE,
                         index ='personid',
                         print.init = FALSE,
                         data = dat,
                         family = binomial('logit'),
                         ranp = c(
                          #certified = 'n',
                          #fresh = 'n',
                          #farmed = 'n', 
                          #p_fish ='n', 
                          #p_beef = 'n',
                          #o_local = 'n',
                          #o_usa ='n'
                         ),
                        )

sink(commandArgs(trailingOnly = TRUE)[1])
summary(mixl_basic_Blogit)
