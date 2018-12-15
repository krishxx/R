autos50k <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k.csv", header = TRUE, sep=",")

#Split dataset into "training" (80%) and "validation" (20%)
ind <- sample(2, nrow(autos50k), replace=TRUE, prob = c(0.8,0.2))

#training data
tdata1 <- autos50k[ind==1,]
#validating data
vdata1 <- autos50k[ind==2,]

#write.csv(vdata1, "D:\\projects\\machineLearning\\PredictiveAnalytics\\vdata1.csv")
#vdata2 <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\vdata1.csv", header = TRUE, sep=",")
#multiple linear regression model
results <- lm(price~abtest+vehicleType+yearOfRegistration+gearbox+powerPS+kilometer+monthOfRegistration+fuelType+brand+notRepairedDamage, tdata1)
# +powerPS+yearOfRegistration+monthofRegistration+nrofPictures+model
summary(results)
results$coefficients

coef(results)

#prediction
pred <- predict(results, vdata1)

head(pred)
head(vdata1$price)