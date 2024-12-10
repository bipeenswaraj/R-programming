datasets::iris
View(iris)
str(iris)
a=iris[-1]#delete 1st col from the data set

summary(a[c("Sepal.Width","Petal.Length")])
normalize<-function(x){
  return((x)-(min(x))/(max(x))-(min(x)))
}
a1=as.data.frame(lapply(a[2:3L],normalize))
summary(a$Sepal.Length)
a_train=a1[1:120,]
a_test=a1[121:150,]
a_train_lables=a1[1:120,1]
a_test_lables=a1[121:150,1]
a_train_lables
a_test_lables

if (!require(class)) install.packages("class")
library(class)

a_test_pred <- knn(train = a_train,
                   test = a_test,
                   cl = a_train_lables,
                   k = 21)
a_test_pred

if (!require(gmodels)) install.packages("gmodels")
library(gmodels)
CrossTable(x = a_test_lables,
           y = a_test_pred
)


data(iris)
str(iris)
a=iris[-5]

normalize<-function(x){
  return ((x)-min(x))/(max(x)-min(x))
}
# Normalize numeric data
a1 <- as.data.frame(lapply(a, normalize))

# View summary of the normalized data
summary(a1)

a_train=a1[1:120,]
a_test=a1[121:150,]

a_train_lables=iris[1:120,5]
a_test_lables=iris[121:150,5]

a_test_lables
a_train_lables

installed.packages("class")
library(class)
k=knn(train=a_train,
      test=a_test,
      label=a_train_lables,
      k=12)
knn
installed.packages("gmodels")
library(gmodels)
CrossTable(x=a_test_lables,
           y=k)






# Load data
data(iris)
str(iris)

# Remove the first column (Species) for normalization
a <- iris[-5]  # Assuming you want to work only with numeric columns

# Normalization function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# Normalize numeric data
a1 <- as.data.frame(lapply(a, normalize))

# View summary of the normalized data
summary(a1)

# Split data into train and test sets
a_train <- a1[1:120, ]       # Training data
a_test <- a1[121:150, ]      # Test data
a_train_lables <- iris[1:120, 5]  # Training labels
a_test_lables <- iris[121:150, 5] # Test labels

# Ensure required library is installed
if (!require(class)) install.packages("class")
library(class)

# Apply KNN
k <- knn(train = a_train,
         test = a_test,
         cl = a_train_lables,  # Corrected parameter
         k = 12)

# Ensure gmodels library is installed
if (!require(gmodels)) install.packages("gmodels")
library(gmodels)

# Generate CrossTable for comparison
CrossTable(x = a_test_lables, 
           y = k)













