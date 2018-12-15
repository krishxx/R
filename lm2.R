imputed_data <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")

summary(imputed_data)

test <- cor(imputed_data, use="complete.obs", method="pearson")
test_cov <- cov(imputed_data, use="complete.obs", method="pearson")

test_cov2cor <- cov2cor(test)

#write.csv(test, "D:\\projects\\machineLearning\\PredictiveAnalytics\\test.csv")
#write.csv(test_cov, "D:\\projects\\machineLearning\\PredictiveAnalytics\\test_cov.csv")
#write.csv(test_cov2cor, "D:\\projects\\machineLearning\\PredictiveAnalytics\\test_cov2cor.csv")

#Split dataset into "training" (80%) and "validation" (20%)
ind <- sample(2, nrow(imputed_data), replace=TRUE, prob = c(0.8,0.2))

#training data
tdata <- imputed_data[ind==1,]
#validating data
vdata <- imputed_data[ind==2,]

#multiple linear regression model

# vehicleType + yearOfRegistration + gearbox + powerPS + kilometer + monthOfRegistration + fuelType + brand +   notRepairedDamage
# vehicleType+yearOfRegistration+kilometer+fuelType+notRepairedDamage
# gearbox+monthOfRegistration+brand+powerPS+
# +powerPS+yearOfRegistration+monthofRegistration+nrofPictures+model
# abtest+
summary(results)
results$coefficients
coef(results)

#prediction
pred <- predict(results, vdata)

head(pred)
head(vdata$price)