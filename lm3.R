imputed_data <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")
summary(imputed_data)

quantiles <- quantile(imputed_data$kilometer, probs = c(.25, .75))
range <- 1.5 * IQR(imputed_data$kilometer)

imp1data <- subset(imputed_data, imputed_data$kilometer > (quantiles[1] - range) & imputed_data < (quantiles[2] + range))
