df <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")
sqdf <- sqrt(df)
write.csv(sqdf, "D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k_sqdf.csv")

#df <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")

#df2 <- df*df
#write.csv(df2, "D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k_df2.csv")

library(MLRMPA)
df <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k_sqdf-imp5.csv", header = TRUE, sep=",")

quantile_normalisation <- function(df){
  df_rank <- apply(df,2,rank,ties.method="min")
  df_sorted <- data.frame(apply(df, 2, sort))
  df_mean <- apply(df_sorted, 1, mean)
  index_to_mean <- function(my_index, my_mean){
    return(my_mean[my_index])
  }
  
  df_final <- apply(df_rank, 2, index_to_mean, my_mean=df_mean)
  rownames(df_final) <- rownames(df)
  return(df_final)
}

min_max_df <- df
#qn_df <- as.data.frame(scale_MinMax(df)) #df
#min_max_df <- as.data.frame(scale_MinMax(df))
qn_df <- as.data.frame(quantile_normalisation(min_max_df))

ind <- sample(2, nrow(qn_df), replace=TRUE, prob = c(0.8,0.2))
#training data
tdata1 <- qn_df[ind==1,]
#validating data
vdata1 <- qn_df[ind==2,]

#multiple linear regression model
results <- lm(price~vehicleType+yearOfRegistration+powerPS+kilometer+fuelType, tdata1)
#
summary(results)
results$coefficients

coef(results)

#prediction
pred <- predict(results, vdata1)

head(pred)
head(vdata1$price)