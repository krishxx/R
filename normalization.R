#(X - min(X))/(max(X) - min(X))
#imputed_data.z <- scale(imputed_data)
#normalized_data <- as.data.frame(lapply(imputed_data, normalize))
#lapply()

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

#reading imputed data
df <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")
qn_res <- quantile_normalisation(df)

qn_res_df <- as.data.frame(qn_res)

ind <- sample(2, nrow(qn_res_df), replace=TRUE, prob = c(0.8,0.2))

#training data
tdata1 <- qn_res_df[ind==1,]
#validating data
vdata1 <- qn_res_df[ind==2,]

#multiple linear regression model
results <- lm(price~vehicleType+yearOfRegistration+gearbox+powerPS+kilometer+monthOfRegistration+fuelType+brand+notRepairedDamage, tdata1)
summary(results)
results$coefficients