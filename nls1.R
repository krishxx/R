'
#set a seed value
set.seed(23)
#Generate x as 100 integers using seq function
x<-seq(0,100,1)
#Generate y as a*e^(bx)+c
y<-runif(1,0,20)*exp(runif(1,0.005,0.075)*x)+runif(101,0,5)
#How does our data look like? Lets plot it
plot(x,y)
'
imputed_data <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos50k-2-imp5.csv", header = TRUE, sep=",")

head(imputed_data, 2)




