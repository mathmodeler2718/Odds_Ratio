
##--------------------------------------------------------
# Matthew Anderson
# Biostat Methods II
# CA #8
# March 24, 2019
##--------------------------------------------------------

# Linearity Plots

# install.packages("readxl")
library("readxl")
# Loading
library("readxl")
# xls files
my_data <- read_excel("C:/Users/Matthew/Documents/VCU/Spring_2019_coursework/Biomedical_data_II/HW3/plotting.xls")

# install.packages("tidyverse")
library(tidyverse)
library(broom)
theme_set(theme_classic())

model <- glm(chd ~., data = my_data, family = binomial)
# Predict the probability (p) of diabete positivity
probabilities <- predict(model, type = "response")
predicted.classes <- ifelse(probabilities > 0.5, "pos", "neg")
head(predicted.classes)


mydata <- my_data %>%
  dplyr::select_if(is.numeric) 
predictors <- colnames(mydata)
# Bind the logit and tidying the data for plot
mydata <- mydata %>%
  mutate(logit = log(probabilities/(1-probabilities))) %>%
  gather(key = "predictors", value = "predictor.value", -logit)

ggplot(mydata, aes(logit, predictor.value))+
  geom_point(size = 0.5, alpha = 0.5) +
  geom_smooth(method = "loess") + 
  theme_bw() + 
  facet_wrap(~predictors, scales = "free_y")
