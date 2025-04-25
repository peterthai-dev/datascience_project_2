# Heart Disease Prediction - Supervised Machine Learning Project
# Author: Peter Thai
# Date: 25 April 2025

# Load required libraries
if (!require(tidyverse)) install.packages("tidyverse", repos = "http://cran.us.r-project.org")
if (!require(caret)) install.packages("caret", repos = "http://cran.us.r-project.org")
if (!require(randomForest)) install.packages("randomForest", repos = "http://cran.us.r-project.org")
if (!require(pROC)) install.packages("pROC", repos = "http://cran.us.r-project.org")

library(tidyverse)
library(caret)
library(randomForest)
library(pROC)

# Load dataset
heart <- read.csv("heart.csv")

# Convert target to factor
heart$target <- as.factor(heart$target)

# Summary of the dataset
summary(heart)
str(heart)

# Split dataset into training and testing sets (80/20)
set.seed(123)
train_index <- createDataPartition(heart$target, p = 0.8, list = FALSE)
train_data <- heart[train_index, ]
test_data <- heart[-train_index, ]

# Logistic Regression Model
log_model <- glm(target ~ ., data = train_data, family = "binomial")
summary(log_model)

# Predictions and evaluation - Logistic Regression
log_probs <- predict(log_model, test_data, type = "response")
log_preds <- ifelse(log_probs > 0.5, 1, 0) %>% as.factor()
confusionMatrix(log_preds, test_data$target)

# ROC Curve - Logistic Regression
log_roc <- roc(test_data$target, log_probs)
plot(log_roc, main = "ROC Curve - Logistic Regression")
auc(log_roc)

# Random Forest Model
set.seed(123)
rf_model <- randomForest(target ~ ., data = train_data, ntree = 500, mtry = 4, importance = TRUE)
print(rf_model)

# Predictions and evaluation - Random Forest
rf_preds <- predict(rf_model, test_data)
confusionMatrix(rf_preds, test_data$target)

# ROC Curve - Random Forest
rf_probs <- predict(rf_model, test_data, type = "prob")[,2]
rf_roc <- roc(test_data$target, rf_probs)
plot(rf_roc, main = "ROC Curve - Random Forest")
auc(rf_roc)

# Feature Importance Plot
varImpPlot(rf_model)
