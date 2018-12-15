#library(ggplot2)
options(scipen=999)
#data <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos.csv")
data <- read.csv("autos.csv",quote = "")
print (is.data.frame(data))
print(ncol(data))
print(nrow(data))
#print(data)

input <- data.frame(data)[,c('price', 'seller', 'abtest', 'vehicleType', 'yearOfRegistration', 'gearbox', 'powerPS', 'model', 'monthOfRegistration', 'fuelType', 'brand', 'notRepairedDamage', 'dateCreated', 'lastSeen')]

# print (head(input))
# print (input)
# head(data)
# melt.data2 <- melt(data)
# head(data2)
# ggplot(data=melt.data2, aes(x=value))+stat_density()+facet_wrap(~variable, scales = "free")
# meanPrice = mean(input$price)
# meanKm = mean(input$kilometer)
# print(meanPrice)
# print(meanKm)
# png(file = "scatterplot.png")

# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
 plot(data$kilometer,data$price, xlab = "kilometer", ylab = "price", xlim=c(50000,150000),ylim=c(100,6000))
# plot(data$powerPS, data$price, xlab = "powerPS", ylab = "price", xlim=c(0,20000), ylim=c(100,6000))
# plot(data$powerPS, data$price, xlab = "yearOfRegistration", ylab = "price", xlim=c(1980,2016), ylim=c(100,6000))