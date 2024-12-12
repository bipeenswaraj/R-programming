#installed.packages("e1071")
library(e1071)

setwd("C:/Users/asus/Downloads")
getwd()
data<-read.csv("play_tennis 1.csv",stringsAsFactors = FALSE)
data 
View(data)
data$Day=NULL
data 

# Define a normalization function
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Apply normalization to numeric columns
numeric_columns <- sapply(data, is.numeric)
data[, numeric_columns] <- lapply(data[, numeric_columns], normalize)
data 


set.seed(123)
train_index = sample(1:nrow(data), 0.8 * nrow(data))
train_data = data[train_index, ]
test_data= data[-train_index,]

nb_model<-naiveBayas(play ~ ., data =  train_data)
pred<- predict(nb_model,test_data)
pred
confusion_matrix<-table(Predicted = pred , Actual = test_data$play)
confusion_matrix
acc<-sum(diag(confusion_matrix))/sum(confusion_matrix)
acc



library(sqldf)
data("iris")
head(iris)
df<-sqldf("select * from iris")
head(df)
df<-sqldf("select [sepal.width] as Sepalwidth, species from iris")
df
df<-sqldf("select [sepal.width] as Sepalwidth, species from iris limit 2")
df
df<-sqldf("select [sepal.width] as Sepalwidth, species from iris order by Sepalwidth")
df
df<-sqldf("select [sepal.width] as Sepalwidth, species from iris order by Sepalwidth desc")
df
df<-sqldf("select avg[sepal.width] as MeanSepalWidth, species from iris group by Species")
df
df<-sqldf("select variance[sepal.width] as varianceSepalwidth, species from iris group by Species")
df
View(df)
d<-data.frame(a=c('a','b','c') , b=c(1,3,1))
View(d)
d<-sqldf(c("insert into d values('x' , 999)","select * from d"))
View(d)
d<-data.frame(a=c('a','b','c') , b = c(1,3,1))
View(d)
d<-sqldf(c("update d set a= 'yyy' , b = 111 where a = 'a' " , "select * from d"))
View(d)


library(sqldf)
a = data.frame(
  emp_name=c("a","b","c","d","e"),
  emp_id=c(1,2,3,4,5),
  emp_sal=c(12,13,14,16,18),
  emp_dep=c("cse","ee","ece","maths","ece")
)
a
View(a)

a <- sqldf(c("update a set emp_name ='Madhu' where emp_name = 'a' " ,"select * from a"))
View(a)

a<-sqldf(c("insert into a (emp_name,emp_id,emp_sal,emp_dep) values ('Aarti',10,180,'cse')" , "select * from a"))
View(a)

a<-sqldf(c("delete from a WHERE emp_name = 'b'" , "select * from a"))
View(a)





























library(e1071)

# Set the working directory and load the data
setwd("C:/Users/asus/Downloads")
data <- read.csv("play_tennis 1.csv", stringsAsFactors = FALSE)

# Remove the 'Day' column
data$Day <- NULL

# Split the data into training and test sets
set.seed(123)
train_index <- sample(1:nrow(data), 0.7 * nrow(data))
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train the Naive Bayes model
nb_model <- naiveBayes(play ~ ., data = train_data)

# Make predictions on the test data
pred <- predict(nb_model, test_data)
pred
# Create the confusion matrix
confusion_matrix <- table(Predicted = pred, Actual = test_data$play)

# Calculate and print accuracy
acc <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy: ", round(acc * 100, 2), "%"))

