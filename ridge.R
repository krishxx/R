library(glmnet)
library(Matrix)

dataF <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")

# Data = considering that we have a data frame named dataF, with its first column being the class
x <- as.matrix(dataF[,-1]) # Removes class
y <- as.double(as.matrix(dataF[, 1])) # Only class

#ind <- sample(2, nrow(as.data.frame(x)), replace=TRUE, prob = c(0.8,0.2))
# Fitting the model (Ridge: Alpha = 0)
cv.ridge <- glmnet::cv.glmnet(x, y, family='gaussian', alpha=0, parallel=TRUE, standardize=TRUE, type.measure='mse')

# Results
plot(cv.ridge)
cv.ridge$lambda.min
cv.ridge$lambda.1se
coef(cv.ridge, s=cv.ridge$lambda.min)

opt_lambda <- cv.ridge$lambda.min

y_predicted <- predict(cv.ridge, s = opt_lambda, newx = x)

# Sum of Squares Total and Error
sst <- sum((y - mean(y))^2)
sse <- sum((y_predicted - y)^2)

# R squared
rsq <- 1 - sse / sst
rsq