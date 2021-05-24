library(readxl)
dfilter <- read_excel("C:/Users/wy/Desktop/余老师数据/dfilter.xlsx")
View(dfilter)
colSums(is.na(dfilter))
outcome1 = dfilter$label
data1 = subset(dfilter, select = -label)
str(data1)
dim(data1)
set.seed(1)
train_obs1 = sample(nrow(data1), 618)
x_train1 = data1[train_obs1, ]
x_holdout1 = data1[-train_obs1, ]
outcome_bin1 = as.numeric(outcome1 >2)
y_train1 = outcome_bin1[train_obs1]
y_holdout1 = outcome_bin1[-train_obs1]
table(y_train1, useNA = "ifany")
table(y_holdout1, useNA = "ifany")
library(SuperLearner)
listWrappers()
SL.glmnet

set.seed(1)
sl_lasso1 = SuperLearner(Y = y_holdout1, X = x_holdout1, family = binomial(),
                        SL.library = "SL.glmnet")
sl_lasso1

predictions <- predict.SuperLearner(sl_lasso1, newdata=x_train1)
head(predictions$pred)
head(predictions$library.predict)
library(dplyr)
conv.preds1 <- ifelse(predictions$pred>=0.5, 1, 0)
conv.preds1=as.factor(conv.preds1)
y_train1=as.factor(y_train1)
library(e1071)
library(caret)
cm1<- confusionMatrix(conv.preds1,y_train1)
cm1
library(pROC)
modelroc1 <- roc(conv.preds1,as.numeric(y_train1))
plot(modelroc1, print.auc=TRUE, auc.polygon=TRUE,legacy.axes=TRUE, grid=c(0.1, 0.2),
     grid.col=c("green", "red"), max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE)  



library(readxl)
Gaussian <- read_excel("C:/Users/wy/Desktop/余老师数据/Gaussian.xlsx")
View(Gaussian)
colSums(is.na(Gaussian))
outcome2 = Gaussian$label
data2 = subset(Gaussian, select = -label)
str(data2)
dim(data2)
set.seed(1)
train_obs2 = sample(nrow(data2), 618)
x_train2 = data2[train_obs2, ]
x_holdout2 = data2[-train_obs2, ]
outcome_bin2 = as.numeric(outcome2 >2)
y_train2 = outcome_bin2[train_obs2]
y_holdout2 = outcome_bin2[-train_obs2]
table(y_train2, useNA = "ifany")
table(y_holdout2, useNA = "ifany")
library(SuperLearner)
listWrappers()
SL.glmnet

set.seed(1)
sl_lasso2 = SuperLearner(Y = y_holdout2, X = x_holdout2, family = binomial(),
                         SL.library = "SL.glmnet")
sl_lasso2

predictions <- predict.SuperLearner(sl_lasso2, newdata=x_train2)
head(predictions$pred)
head(predictions$library.predict)
library(dplyr)
conv.preds2 <- ifelse(predictions$pred>=0.5, 1, 0)
conv.preds2=as.factor(conv.preds2)
y_train2=as.factor(y_train2)
library(e1071)
library(caret)
cm2<- confusionMatrix(conv.preds2,y_train2)
cm2
library(pROC)
modelroc2 <- roc(conv.preds2,as.numeric(y_train2))
plot(modelroc2, print.auc=TRUE, auc.polygon=TRUE,legacy.axes=TRUE, grid=c(0.1, 0.2),
     grid.col=c("green", "red"), max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE)  

library(readxl)
LOG <- read_excel("C:/Users/wy/Desktop/余老师数据/LOG.xlsx")
View(LOG)
colSums(is.na(LOG))
outcome3 = LOG$label
data3 = subset(LOG, select = -label)
str(data3)
dim(data3)
set.seed(1)
train_obs3 = sample(nrow(data3), 618)
x_train3 = data3[train_obs3, ]
x_holdout3 = data3[-train_obs2, ]
outcome_bin3 = as.numeric(outcome3 >2)
y_train3 = outcome_bin3[train_obs3]
y_holdout3 = outcome_bin3[-train_obs3]
table(y_train3, useNA = "ifany")
table(y_holdout3, useNA = "ifany")
library(SuperLearner)
listWrappers()
SL.glmnet

set.seed(1)
sl_lasso3 = SuperLearner(Y = y_holdout3, X = x_holdout3, family = binomial(),
                         SL.library = "SL.glmnet")
sl_lasso3

predictions <- predict.SuperLearner(sl_lasso3, newdata=x_train3)
head(predictions$pred)
head(predictions$library.predict)
library(dplyr)
conv.preds3 <- ifelse(predictions$pred>=0.5, 1, 0)
conv.preds3=as.factor(conv.preds3)
y_train3=as.factor(y_train3)
library(e1071)
library(caret)
cm3<- confusionMatrix(conv.preds3,y_train3)
cm3
library(pROC)
modelroc3 <- roc(conv.preds3,as.numeric(y_train3))
plot(modelroc3, print.auc=TRUE, auc.polygon=TRUE,legacy.axes=TRUE, grid=c(0.1, 0.2),
     grid.col=c("green", "red"), max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE)  



library(readxl)
Neighbouring <- read_excel("C:/Users/wy/Desktop/余老师数据/Neighbouring.xlsx")
View(Neighbouring)
colSums(is.na(Neighbouring))
outcome4 =Neighbouring$label
data4 = subset(Neighbouring, select = -label)
str(data4)
dim(data4)
set.seed(1)
train_obs4 = sample(nrow(data4), 618)
x_train4 = data4[train_obs4, ]
x_holdout4 = data4[-train_obs4, ]
outcome_bin4 = as.numeric(outcome4 >2)
y_train4 = outcome_bin4[train_obs4]
y_holdout4 = outcome_bin4[-train_obs4]
table(y_train4, useNA = "ifany")
table(y_holdout4, useNA = "ifany")
library(SuperLearner)
listWrappers()
SL.glmnet

set.seed(1)
sl_lasso4 = SuperLearner(Y = y_holdout4, X = x_holdout4, family = binomial(),
                         SL.library = "SL.glmnet")
sl_lasso4

predictions <- predict.SuperLearner(sl_lasso4, newdata=x_train4)
head(predictions$pred)
head(predictions$library.predict)
library(dplyr)
conv.preds4 <- ifelse(predictions$pred>=0.5, 1, 0)
conv.preds4=as.factor(conv.preds4)
y_train4=as.factor(y_train4)
library(e1071)
library(caret)
cm4<- confusionMatrix(conv.preds4,y_train4)
cm4
library(pROC)
modelroc4 <- roc(conv.preds4,as.numeric(y_train4))
plot(modelroc4, print.auc=TRUE, auc.polygon=TRUE,legacy.axes=TRUE, grid=c(0.1, 0.2),
     grid.col=c("green", "red"), max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE)    


plot(modelroc1, col = "black", max.auc.polygon=TRUE,max.auc.polygon.col="white",lty=2,
     auc.polygon.col="skyblue", print.thres=TRUE, print.thres.col = "black", print.thres.adj=c(-.1,2.7),
     main='ROC Curve(Testing)')
plot(modelroc2, add = T, col = "green",max.auc.polygon.col="white",lty=4,
     print.thres=TRUE, print.thres.adj=c(-.1,4.7), print.thres.col = "green")
plot(modelroc3, add = T, col = "red",max.auc.polygon.col="white",lty=4,
     print.thres=TRUE, print.thres.adj=c(-.1,6.7),  print.thres.col = "red")
plot(modelroc4, add = T, col = "blue",max.auc.polygon.col="white",lty=4,
     print.thres=TRUE, print.thres.adj=c(-.1,7.7),  print.thres.col = "blue")
legend(0.5,0.4,cex = 0.6,legend = c("dfilter 
(AUC = 0.881)", "Gaussian 
(AUC = 0.862)","LOG 
(AUC = 0.873)","Neighbouring
(AUC = 0.836)"), lty = 4, col = c("black", "green", "red","blue"),bty = "n")
