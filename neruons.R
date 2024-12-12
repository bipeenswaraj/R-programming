# Neural Network
install.packages("neuralnet")
library("neuralnet")
getwd()
setwd("C:/Users/yashs/OneDrive/Desktop/Yash/R_Sem5")
concrete<-read.csv("Concrete_Data.csv")
View(concrete)
normalize<-function(x){
  return ((x-min(x)) / (max(x)-min(x)))
}
concrete_norm<-as.data.frame(lapply(concrete,normalize))
concrete_train<-concrete_norm[1:773,]
concrete_test<-concrete_norm[774:1030,]
concrete_model<-neuralnet(strength ~ cement + slag + ash + water + superplasticizer + coarseagg + fineagg + age ,
                          data = concrete_train,
                          hidden = 1
                          )
# By changing hidden value we can get less error as above I used 5 instead of 1
plot(concrete_model)
model_rsults <- compute(concrete_model,concrete_test[1:8])
predicted_strength<- model_rsults$net.result
cor(predicted_strength,concrete_test$strength)

# Changing value of Hidden layer
concrete_model2<-neuralnet(strength ~ cement + slag + ash + water + superplasticizer + coarseagg + fineagg + age,
                           data = concrete_train,
                           hidden = 5
                           )
plot(concrete_model2)
model_results2<-compute(concrete_model2,concrete_test)
predicted_strength2<-model_results2$net.result
cor(predicted_strength2,concrete_test$strength)








#==========================================NEUROUNS====================================
# Neural Network
install.packages("neuralnet")
library("neuralnet")
data("PlantGrowth")
View(PlantGrowth)

normalize<-function(x){
  return ((x-min(x)) / (max(x)-min(x)))
}

PlantGrowth_norm <- PlantGrowth
PlantGrowth_norm$weight <- normalize(PlantGrowth$weight)  # Normalize only 'weight'

PlantGrowth_norm <- as.data.frame(lapply(PlantGrowth[, c("weight")], normalize))

PlantGrowth_train<-PlantGrowth_norm[1:15,]
PlantGrowth_test<-PlantGrowth_norm[16,30,]

PlantGrowth_model<-neuralnet(group ~ weight,
                             data = PlantGrowth_train,
                             hidden = 1
)
# By changing hidden value we can get less error as above I used 5 instead of 1
plot(PlantGrowth_model)

model_results <- compute(PlantGrowth_model,PlantGrowth_test[,"weight"])

predicted_growth<- model_results$net.result

cor(predicted_growth,PlantGrowth_test$growth)

# Changing value of Hidden layer
PlantGrowth_model2<-neuralnet(group ~ weight,
                              data = PlantGrowth_train,
                              hidden = 5
)

plot(PlantGrowth_model2)

model_results2<-compute(PlantGrowth_model2,PlantGrowth_test[' "weight'])

predicted_growth2<-model_results2$net.result

cor(predicted_growth2,PlantGrowth_test$growth)



