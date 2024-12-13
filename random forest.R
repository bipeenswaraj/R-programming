# Install and load the correct package
install.packages("randomForest")
library(randomForest)

# Load the iris dataset
data("iris")

# Set a seed for reproducibility
set.seed(123)

# Split data into training and testing sets
sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# Build the Random Forest model
rf_model <- randomForest(Species ~ ., data = train_data, ntree = 100)

# Make predictions on the test dataset
predictions <- predict(rf_model, test_data)

# Create a confusion matrix
confusion_matrix <- table(predictions, test_data$Species)
print(confusion_matrix)

# Calculate and print accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))





# Install and load the correct package
install.packages("randomForest")
library(randomForest)

# Load the iris dataset
data("mtcars")
View(mtcars)
# Set a seed for reproducibility
set.seed(123)

# Split data into training and testing sets
sample_index <- sample(1:nrow(mtcars), 0.7 * nrow(mtcars))
train_data <- mtcars[sample_index, ]
test_data <- mtcars[-sample_index, ]

# Build the Random Forest model
rf_model <- randomForest(mpg ~ ., data = train_data, ntree = 100)

# Make predictions on the test dataset
predictions <- predict(rf_model, test_data)

# Create a confusion matrix
confusion_matrix <- table(predictions, test_data$mpg)
print(confusion_matrix)

# Calculate and print accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))





# Install and load the correct package
install.packages("randomForest")
library(randomForest)

# Load the iris dataset
data("iris")

# Set a seed for reproducibility
set.seed(123)

# Split data into training and testing sets
sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# Build the Random Forest model
rf_model <- randomForest(Species ~ ., data = train_data, ntree = 100)

# Make predictions on the test dataset
predictions <- predict(rf_model, test_data)

# Create a confusion matrix
confusion_matrix <- table(predictions, test_data$Species)
print(confusion_matrix)

# Calculate and print accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))

# --- Add Graphs ---

# 1. Variable Importance Plot
importance(rf_model)  # Calculate importance
varImpPlot(rf_model, main = "Variable Importance Plot")

# 2. Error Rate Plot
plot(rf_model, main = "Error Rate vs. Number of Trees")
legend("topright", legend = colnames(rf_model$err.rate), col = 1:3, lty = 1, title = "Legend")

# 3. Confusion Matrix Heatmap
library(ggplot2)
library(reshape2)

# Prepare data for heatmap
cm_melted <- melt(confusion_matrix)
colnames(cm_melted) <- c("Predicted", "Actual", "Count")

# Create heatmap
ggplot(cm_melted, aes(x = Actual, y = Predicted, fill = Count)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  geom_text(aes(label = Count), color = "black") +
  ggtitle("Confusion Matrix Heatmap") +
  theme_minimal()

installed.packages("randomForest")
library(randomForest)

data(iris)
set.seed(123)

sample_index<-sample(1,nrow(iris),0.7*nrow(iris))
train_data<-iris[sample_index, ]
test_data<-iris[-sample_index, ]

rf_model<-randomForest(Species ~., data=train_data, ntree=100)

prediction<-predict(rf_model,test_data)
prediction

conf_matrix<-table(prediction,test_data$Species)
print(conf_matrix)
accuracy<-sum(diag(conf_matrix))/sum(conf_matrix)
print(paste("Accuracy for this data is: ",round(accuracy*100,2),"%"))






























