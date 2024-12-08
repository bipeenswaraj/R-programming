library(arules)
library(cluster)
getwd()
setwd("C:/Users/asus/Downloads")
data<-read.csv("cancer.csv")
View(data)
data_l<-data[,c(-1:-2)]
data_norm<-as.data.frame(lapply(data_l,normalize))
View(data_norm)
data_modal<-kmeans(data_norm,center = 2, nstart = 20)
data_modal$cluster
data_modal$centers
tab<-table(data$diagnosis,data_modal$cluster)
tab
table(data$diagnosis)




pressure
pressure1=pressure
pressure1
d=dist(pressure1,method="euclidean")
hfit=hclust(d,method="average")
plot(hfit)
grps=cutree(hfit,k=3)
rect.hclust(hfit,k=4,border = "red")

# Load necessary libraries
library(arules)
library(cluster)

# Load the pressure dataset
data("pressure")
View(pressure)

# Define a normalization function
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Normalize the 'pressure' column of the dataset
data_norm <- as.data.frame(lapply(pressure["pressure"], normalize))
View(data_norm)

# Apply K-means clustering with 2 centers on the normalized data
data_modal <- kmeans(data_norm, centers = 2, nstart = 20)

# Display the cluster assignments and the cluster centers
data_modal$cluster
data_modal$centers
# Create a table of clusters and temperature values
tab <- table(pressure$temperature, data_modal$cluster)
print(tab)
# Display the frequency table of temperature values
table(pressure$temperature)





# Load the necessary libraries
library(cluster)

# Load the PlantGrowth dataset
data("PlantGrowth")

# Use only numeric columns for clustering (e.g., weight)
P_1 <- PlantGrowth[, "weight", drop = FALSE]

# Calculate the Euclidean distance and perform hierarchical clustering
d <- dist(P_1, method = "euclidean")
hir <- hclust(d, method = "average")

# Cut the tree into 3 clusters
grps <- cutree(hir, k = 3)

# Create a contingency table comparing actual groups with clusters
cm_hier <- table(Actual = PlantGrowth$group, Cluster = grps)

# Calculate hierarchical clustering accuracy
hier_accuracy <- sum(apply(cm_hier, 1, max)) / sum(cm_hier)

# Print hierarchical clustering accuracy
cat("Hierarchical Clustering Accuracy:", round(hier_accuracy * 100, 2), "%\n")

# Plot the hierarchical clustering dendrogram
plot(hir, main = "Hierarchical Clustering Dendrogram", sub = "", xlab = "Observations", cex = 0.8)

# Add rectangle borders around the clusters in the dendrogram
rect.hclust(hir, k = 3, border = c("red", "blue", "green"))

# Optional: Plot the clusters in 2D (using the cluster assignments)
# You can visualize this more easily if you had more than one variable (e.g., weight & another feature)

# Create a 2D plot for visualization
plot(P_1$weight, col = grps, pch = 16, main = "Hierarchical Clustering (2D Visualization)",
     xlab = "Index", ylab = "Weight")
# Mark the cluster centers or centroids if applicable
points(tapply(P_1$weight, grps, mean), col = 1:3, pch = 8, cex = 2, lwd = 2)








sample() aur sample.split() function mein kya difference hain?
  scale() aur center() kya hain.
kernel() kya hota h?
  caTools aur e10711 package kyu use krte h?
