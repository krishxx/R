
z_score_normalize <- function(df, cols) {
  result <- df # make a copy of the input data frame
  
  for (j in cols) { # each specified col
    m <- mean(df[,j]) # column mean
    std <- sd(df[,j]) # column (sample) sd
    
    for (i in 1:nrow(result)) { # each row of cur col
      result[i,j] <- (result[i,j] - m) / std
      #sapply(result[,j], function(x) (x - m) / std)
      #
    }
  }
  return(result)
}



#result[,j] <- sapply(result[,j], function(x) (x - m) / std)
mydf <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")

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
qn_res <- quantile_normalisation(mydf)
cols <- c(2,3,4,5,6,7,8,9,10,11,12)

dataz <- scale(mydf)
ndataz <- as.data.frame(dataz)
ndataz_norm <- as.data.frame(sapply(ndataz, z_score_normalize(ndataz, cols)))

#zn_res_df <- as.data.frame(z_score_normalize(qn_res, cols))
ind <- sample(2, nrow(ndataz_norm), replace=TRUE, prob = c(0.8,0.2))

#training data
tdata1 <- ndataz_norm[ind==1,]
#validating data
vdata1 <- ndataz_norm[ind==2,]

#multiple linear regression model
results <- lm(price~vehicleType+yearOfRegistration+powerPS+kilometer+fuelType+notRepairedDamage, tdata1)
summary(results)
results$coefficients
