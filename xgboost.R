library(xgboost)
library(readr)
library(stringr)
library(caret)
library(car)
require(lattice)
require(ggplot2)

Df_all<-read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv")
str(Df_all)
set.seed(999)
ind <- sample(2, nrow(Df_all), replace=TRUE, prob = c(0.8,0.2))
#training data
tdata1 <- Df_all[ind==1,]
str(tdata1)
#validating data
vdata1 <- Df_all[ind==2,]

X<-tdata1[,-12]
str(tdata1)
X1<-as.matrix(X)
str(X)
y<-tdata1[,12]
str(y)
#tdata1 = tdata1[-grep('labels', colnames(tdata1))]


xgb <- xgboost(data = data.matrix(X[,-12]),
               booster="gblinear",
               label = y, 
               eta = 7,
               nround=3, 
               subsample = 0.5,
               colsample_bytree = 0.5,
               eval_metric = "rmse",
               objective = "reg:linear",
               nthread = 3
)

y_pred <- predict(xgb, data.matrix(vdata1[,12]))

head(y_pred)
head(vdata1$shares)
xgb$evaluation_log
model <- xgb.dump(xgb, with_stats = T)