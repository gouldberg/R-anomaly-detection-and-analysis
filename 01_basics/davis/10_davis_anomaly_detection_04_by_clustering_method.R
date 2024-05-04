rm(list = ls())

packages <- c("dplyr")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)


setwd("C:\\Users\\kswad\\OneDrive\\�f�X�N�g�b�v\\�Z�p�͋���_���v���\\51_��̓X�N���v�g\\00_basics\\05_anomaly_detection\\01_�ُ팟�m\\davis")



# ------------------------------------------------------------------------------
# data:  Davis
# ------------------------------------------------------------------------------


data <- read.csv("Davis.txt", header = T, sep = "\t")


str(data)


car::some(data)




# ------------------------------------------------------------------------------
# Anomaly Detection
# by clustering based on mixed normal distributions
# ------------------------------------------------------------------------------


# mclust select number of clusters by BIC
library(mclust)


# removing 12th record due to applting model based method
X <- data[-12, c("weight", "height")]


result <- Mclust(X)

result$BIC


print(summary(result, parameters = TRUE))



# -->
# 2 clusters are selected




# ----------
plot(result)




# ------------------------------------------------------------------------------
# Compute component densties
# ------------------------------------------------------------------------------


# now we include 12th records
X <- data[, c("weight", "height")]


# cdens:  compute component densities for observations in MVN mixture models parameterized by eigen value decomposition
XX <- cdens(modelName = result$modelName, X, parameters = result$parameters)





# ------------------------------------------------------------------------------
# Compute anomaly scores
# ------------------------------------------------------------------------------

# mixing proportions
( pi <- result$parameters$pro )



# compute anomaly scores
a <- -log(as.matrix(XX) %*% as.matrix(pi))



plot(a, ylab = "anomaly score")

