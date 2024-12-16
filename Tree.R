installed.packages("rpart")
library("rpart")
data(iris)
str(iris)
indexs=sample(1,nrow(iris),0.7*nrow(iris))
iris_train = iris[indexs,]
iris_train
iris_test = iris[-indexs,]
iris_test
target =  Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
target

tree = rpart (target,data = iris_train,method = "class")
tree

installed.packages("rpart.plot")
library("rpart.plot")
predictions=predict(tree,iris_test,type="class")
predictions
conf_matrix=table(predictions,iris_test)
conf_matrix
accuracy=sum(diag(conf_matrix))/sum(conf_matrix)
print(paste("Accuracy: ",round(accuracy*100,2),"%"))

actual = iris_test$Species
rpart.plot(tree)

actual = iris_test$Species
actual
#underfitting :- to capture the data complexity
#it is not fit for accurate result or prize result so it is called underfitting.

#overfitting :- again and again training dataset then it will over trained..it will capture unwanted features which are not required.

#so we need optimized the model so both the problem will remove.
