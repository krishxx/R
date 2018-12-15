library(ggplot2)
library(reshape2)

df <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")
dfm <- melt(df, "price")

ggplot(dfm, aes(value, price)) + geom_line() + facet_wrap(~variable, scales = "fixed")