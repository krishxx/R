df <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")

# centering with 'scale()'
center_scale <- function(x) {
  scale(x, scale = FALSE)
}

# apply it
cs_df <- as.data.frame(center_scale(df))

ind <- sample(2, nrow(cs_df), replace=TRUE, prob = c(0.8,0.2))
#training data
tdata1 <- cs_df[ind==1,]
#validating data
vdata1 <- cs_df[ind==2,]

#multiple linear regression model
results <- lm(price~vehicleType+yearOfRegistration+powerPS+kilometer+fuelType, tdata1)
#
summary(results)

# center with 'apply()'
center_apply <- function(x) {
  apply(x, 2, function(y) y - mean(y))
}

# apply it
ca_df <- as.data.frame(center_apply(cs_df))

# center with 'sweep()'
center_sweep <- function(x, row.w = rep(1, nrow(x))/nrow(x)) {
  get_average <- function(v) sum(v * row.w)/sum(row.w)
  average <- apply(x, 2, get_average)
  sweep(x, 2, average)
}

# apply it
cs2_df <- center_sweep(ca_df)

# center with 'colMeans()'
center_colmeans <- function(x) {
  xcenter = colMeans(x)
  x - rep(xcenter, rep.int(nrow(x), ncol(x)))
}

# apply it
cc_df <- center_colmeans(df)

ind <- sample(2, nrow(cc_df), replace=TRUE, prob = c(0.8,0.2))
#training data
tdata1 <- cc_df[ind==1,]
#validating data
vdata1 <- cc_df[ind==2,]

#multiple linear regression model
results <- lm(price~vehicleType+yearOfRegistration+powerPS+kilometer+fuelType, tdata1)
#
summary(results)