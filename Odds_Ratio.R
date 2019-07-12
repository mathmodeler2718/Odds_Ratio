# question 1

# 2x2 tables 
alc_hi <- matrix(c(102,69,194,195), nrow = 2)
dimnames(alc_hi) <- list("tobaco use" = c("high","low"), "cancer" = c("yes","no"))

alc_low <- matrix(c(20,9,134,252), nrow = 2)
dimnames(alc_low) <- list("tobaco use" = c("hihg","low"), "cancerl" = c("yes","no"))


#install.packages("epitools")
library(epitools)
#if(!require(DescTools)){install.packages("DescTools")}
library(DescTools)

# OR for each stage
oddsratio(alc_hi,method = "wald")
oddsratio(alc_low,method = "wald")


combined<-array(c(102,69,194,195,20,9,134,252), dim = c(2, 2,2))

#reBslowday test
BreslowDayTest(combined, OR = NA, correct = F)

#Mantel-Haenszel 
mantelhaen.test(combined)

# question 2
install.packages("ExactCIdiff")
BinomCI(1, 85,.95,method=c("wilson"))

#Question 3 

#first calcuation risk with stage I as a reffernce category comparing to stage II ( I switched row 1 and 2)


I_II <- matrix(c(181,115,103,146), nrow = 2)
dimnames(I_II) <- list("Stage" = c("I","II"), "Survival" = c("survived","dead"))

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

I_III<- matrix(c(181,131,103,370), nrow = 2)
dimnames(I_III) <- list("Stage" = c("I","III"), "Survival" = c("dead","allive"))
library(epitools)

#Relative risk 
rr.out_III <- riskratio(I_III, rev="b")
riskratio.wald(I_III)
rr.out_III$measure

#Linear Trend test
combined<-matrix(c(7,26,21,60,70,8),nrow = 3)
chisq.test(combined)
CochranArmitageTest(combined)



















