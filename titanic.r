getwd()
setwd("D:\\R")
full<-read.csv("D:\\R\\titanic3.csv",na.strings = c(""," ","NA"))
colSums(is.na(full))
library(ggplot2)
ggplot(data = full,aes(x=embarked,fill=survived))+geom_bar(position="fill")+ylab("Frequency")
t<-table(full$Embarked,full$Survived)
for (i in 1:dim(t)[1]){
  t[i,]<-t[i,]/sum(t[i,])*100
}
t
full$FamilySize <- full$SibSp + full$Parch +1;
full1<-full
ggplot(data = full1[!is.na(full$familySize),],aes(x=familySize,fill=survived))+geom_histogram(binwidth =1,position="fill")+ylab("Frequency")
library(mice)
d<-full[,c(2:12)]
imputed_Data <- mice(d, m=5, maxit = 50, method = 'pmm', seed = 500)
