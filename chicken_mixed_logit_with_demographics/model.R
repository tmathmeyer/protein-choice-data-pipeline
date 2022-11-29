

.libPaths("rlib")
library(Rchoice)

dat <- read.csv(file = "protein/chicken.csv", header = TRUE, sep = ",")

mixLogit_demo_Blogit <- Rchoice(selected_n ~0 
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
                                
                                + farmed:age 
                                + farmed:gender 
                                + farmed:education 
                                + farmed:profession
                                + farmed:household 
                                + farmed:income
                                + farmed:as.factor(ethnicity) 
                                
                                + p_fish:age 
                                + p_fish:gender 
                                + p_fish:education 
                                + p_fish:profession
                                + p_fish:household 
                                + p_fish:income
                                + p_fish:as.factor(ethnicity) 
                                
                                + p_beef:age 
                                + p_beef:gender 
                                + p_beef:education 
                                + p_beef:profession
                                + p_beef:household 
                                + p_beef:income
                                + p_beef:as.factor(ethnicity) 
                   
                                + farmed:p_fish:age 
                                + farmed:p_fish:gender 
                                + farmed:p_fish:education 
                                + farmed:p_fish:profession
                                + farmed:p_fish:household 
                                + farmed:p_fish:income 
                                + farmed:p_fish:as.factor(ethnicity) 
                                
                                + farmed:p_beef:age 
                                + farmed:p_beef:gender 
                                + farmed:p_beef:education 
                                + farmed:p_beef:profession
                                + farmed:p_beef:household 
                                + farmed:p_beef:income
                                + farmed:p_beef:as.factor(ethnicity) 
                   ,
                   data = dat,
                   family = binomial('logit'),
                   ranp = c(certified = 'n', fresh = 'n', farmed = 'n',  p_fish ='n',  p_beef = 'n', o_local = 'n', o_usa ='n' ),
                   R = 500,  panel = TRUE,index ='personid', print.init = TRUE)

sink(commandArgs(trailingOnly = TRUE)[1])
summary(mixLogit_demo_Blogit)
