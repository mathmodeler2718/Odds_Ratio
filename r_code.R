
#Question 3 

#first calcuation risk with stage I as a reffernce category comparing to stage II ( I switched row 1 and 2)

I_II <- matrix(c(26,7,70,60), nrow = 2)
dimnames(I_II) <- list("Stage" = c("I","II"), "Survival" = c("Dead","Allive"))

#install.packages("epitools")
library(epitools)
#if(!require(DescTools)){install.packages("DescTools")}
library(DescTools)

#Relative Risk be carful of the rev command in fixing your table and reference category for a null
# calculation do rev="b"
rr.out_II <- riskratio(I_II,rev = "b")
riskratio.wald(I_II)
rr.out_II$measure

#second calcuation risk with stage I as a reffernce category comparing to stage III ( I switched row 1 and 2)

I_III<- matrix(c(21,7,8,60), nrow = 2)
dimnames(I_III) <- list("Stage" = c("I","III"), "Survival" = c("Dead","Allive"))
library(epitools)

#Relative risk 
rr.out_III <- riskratio(I_III, rev="b")
riskratio.wald(I_III)
rr.out_III$measure

#Linear Trend test
combined<-matrix(c(7,26,21,60,70,8),nrow = 3)
chisq.test(combined)
CochranArmitageTest(combined)
