library("ggpubr")
options(scipen=999)
origdata <- read.csv("D:\\projects\\machineLearning\\PredictiveAnalytics\\autos.csv", quote="")

ind3 <- sample(3, nrow(origdata), replace=TRUE, prob = c(0.1, 0.7, 0.2))

#sample data
sdata <- origdata[ind3==1,]
#training data
tdata1 <- origdata[ind3==2,]
#validating data
vdata1 <- origdata[ind3==3,]

ind4 <- sample(3, nrow(sdata), replace=TRUE, prob=c(0.003, 0.7, 0.297))
ind4sample <- sdata[ind4==1,]
ind4tdata <- sdata[ind4==2,]
ind4vdata <- sdata[ind4==3,]

#plot(ind4sample$kilometer, ind4sample$price)

head(ind4sample)
cor(ind4sample, use="pairwise.complete.obs", method="pearson")

library("ggpubr")
ggscatter(ind4sample, x = "kilometer", y = "price", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "KMS", ylab = "PRICE")

#print (is.data.frame(origdata))

#ggscatter(origdata, x="kilometer", y="price",
#          add="reg.line", conf.int=TRUE,
#          corr.coef=TRUE, cor.method="pearson",
#          xlab="KILOMETER", ylab="PRICE")
#newdata <- data.frame(yearOfRegistration=1900:2017)
# Cleaning
# Restrict yearofRegistration between 1900 to 2018
#origdata <- origdata[!(origdata$yearOfRegistration==1000),]
# carSpeeds$Color<- ifelse(carSpeeds$Color=='Blue', 'Green', carSpeeds$Color)
# carSpeeds$Color
# origdata1 <- origdata[!duplicated(origdata)]
# print(ncol(origdata))
# print(nrow(origdata))

