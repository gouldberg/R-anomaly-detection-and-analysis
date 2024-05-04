# setwd("//media//kswada//MyFiles//R//email")
setwd("C:\\Users\\kswad\\OneDrive\\�f�X�N�g�b�v\\�Z�p�͋���_���v���\\51_��̓X�N���v�g\\m_tenstocks")


packages <- c("dplyr", "tidyverse")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)



# ------------------------------------------------------------------------------
# data:  m-tenstocks
# ------------------------------------------------------------------------------

mtenstocks <- read.csv("m-tenstocks.txt", sep = " ", header = T)


str(mtenstocks)


dim(mtenstocks)


car::some(mtenstocks)



# ----------
# log returns

rtn <- log(mtenstocks[,2:11] + 1)




# ------------------------------------------------------------------------------
# data exploration:  data distribution
#------------------------------------------------------------------------------


psych::describe(rtn)



# -->
# negative skewness
# MS:  excess kurtosis



# ----------
comp_name <- colnames(rtn)


graphics.off()

par(mfrow = c(3,3))

for(i in 1:length(comp_name)){ hist(rtn[,comp_name[i]], main = comp_name[i]) }




# ------------------------------------------------------------------------------
# data exploration:  time series plot
# ------------------------------------------------------------------------------

library(MTS)


MTSplot(mtenstocks[,2:11])


MTSplot(rtn)


colnames(rtn)



# ----------
library(forecast)


apply(mtenstocks[,2:11], 2, ndiffs)


apply(rtn, 2, ndiffs)

