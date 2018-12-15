dataF <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")
ind <- sample(2, nrow(dataF), replace=TRUE, prob = c(0.8,0.2))
#training data
tdata1 <- dataF[ind==1,]
#validating data
vdata1 <- dataF[ind==2,]

results <- lm(price~vehicleType+yearOfRegistration+powerPS+kilometer+fuelType, tdata1)
summary(results)
abline(results$model)
coef(results)
results$residuals
mses <- mean((tdata1 - predict(results))^2)


gradientDesc <- function(x, y, learn_rate, conv_threshold, n, max_iter) {
  plot(x, y, col = "blue", pch = 20)
  m <- runif(1, 0, 1)
  c <- runif(1, 0, 1)
  yhat <- m * x + c
  MSE <- sum((y - yhat) ^ 2) / n
  converged = F
  iterations = 0
  while(converged == F) {
    ## Implement the gradient descent algorithm
    m_new <- m - learn_rate * ((1 / n) * (sum((yhat - y) * x)))
    c_new <- c - learn_rate * ((1 / n) * (sum(yhat - y)))
    m <- m_new
    c <- c_new
    yhat <- m * x + c
    MSE_new <- sum((y - yhat) ^ 2) / n
    if(MSE - MSE_new <= conv_threshold) {
      abline(c, m) 
      converged = T
      return(paste("Optimal intercept:", c, "Optimal slope:", m))
    }
    iterations = iterations + 1
    if(iterations > max_iter) { 
      abline(c, m) 
      converged = T
      return(paste("Optimal intercept:", c, "Optimal slope:", m))
    }
  }
}

gradientDesc(tdata1$price, tdata1$yearOfRegistration, 0.0000293, 0.001, 12, 2500000)