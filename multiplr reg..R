getwd()
dataset <- read.csv('data2.csv')
View(dataset)

dataset$State <- factor(dataset$State, 
                        levels = c('New York', 'California', 'Florida'), 
                        labels = c(1, 2, 3)) 
dataset$State 
View(dataset)

library(caTools) 
set.seed(123) 
split <- sample.split(dataset$Profit, SplitRatio = 0.8) 
View(split)
training_set <- subset(dataset, split == TRUE) 
test_set <- subset(dataset, split == FALSE) 

regressor <- lm(formula = Profit ~ ., 
                data = training_set) 
regressor

y_pred <- predict(regressor, newdata = test_set) 
y_pred
