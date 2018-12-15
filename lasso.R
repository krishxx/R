require(glmnet)

dataF <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")

# Data = considering that we have a data frame named dataF, with its first column being the class
x <- as.matrix(dataF[,-1]) # Removes class
y <- as.double(as.matrix(dataF[, 1])) # Only class

# Fitting the model (Lasso: Alpha = 1)
set.seed(999)
cv.lasso <- glmnet::cv.glmnet(x, y, family='gaussian', alpha=1, parallel=TRUE, standardize=TRUE, type.measure='mse')

# Results
plot(cv.lasso)
plot(cv.lasso$glmnet.fit, xvar="lambda", label=TRUE)
cv.lasso$lambda.min
cv.lasso$lambda.1se
coef(cv.lasso, s=cv.lasso$lambda.min)

opt_lambda <- cv.lasso$lambda.min

y_predicted <- predict(cv.lasso, s = opt_lambda, newx = x)

# Sum of Squares Total and Error
sst <- sum((y - mean(y))^2)
sse <- sum((y_predicted - y)^2)

# R squared
rsq <- 1 - sse / sst
rsq