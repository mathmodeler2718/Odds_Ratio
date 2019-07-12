##--------------------------------------------------------
# Matthew Anderson
# Biomedical Data II
# HW #2 
# Febuary 11, 2019
##--------------------------------------------------------

# 2x2 tables for each stage of cancer
stage_1 <- matrix(c(2,5,10,50), nrow = 2)
dimnames(stage_1) <- list("Recepto Lever" = c("Low","High"), "Survival" = c("Dead","Allive"))

stage_2 <- matrix(c(9,17,13,57), nrow = 2)
dimnames(stage_2) <- list("Recepto Lever" = c("Low","High"), "Survival" = c("Dead","Allive"))

stage_3 <- matrix(c(12,9,2,6), nrow = 2)
dimnames(stage_3) <- list("Recepto Lever" = c("Low","High"), "Survival" = c("Dead","Allive"))


#install.packages("epitools")
library(epitools)
#if(!require(DescTools)){install.packages("DescTools")}
library(DescTools)

# OR for each stage
oddsratio(stage_1,method = "wald")
oddsratio(stage_2,method = "wald")
oddsratio(stage_3,method = "wald")

combined<-array(c(2, 5, 10, 50, 9, 17, 13, 57, 12, 9, 2, 6), dim = c(2, 2, 3))

#Breslowday test
BreslowDayTest(combined, OR = NA, correct = F)

#Mantel-Haenszel 
mantelhaen.test(combined)

#Linear Trend test
combined<-matrix(c(2, 5, 10, 50, 9, 17, 13, 57, 12, 9, 2, 6),nrow = 2)
CochranArmitageTest(combined)



















