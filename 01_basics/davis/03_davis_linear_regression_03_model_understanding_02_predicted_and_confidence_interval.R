rm(list = ls())

packages <- c("dplyr")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)


setwd("C:\\Users\\kswad\\OneDrive\\�f�X�N�g�b�v\\�Z�p�͋���_���v���\\51_��̓X�N���v�g\\00_basics\\regression_basics")



# ------------------------------------------------------------------------------
# data:  Davis
# ------------------------------------------------------------------------------

data <- read.csv("Davis.txt", header = T, sep = "\t")


str(data)


car::some(data)


data2 <- na.exclude(data)



# ----------
linmod <- lm(weight ~ repwt, data = data2)





# ------------------------------------------------------------------------------
# predicted and confidential interval
# ------------------------------------------------------------------------------

pred <- predict(linmod, data = data2, se = TRUE, conf.level = 0.95)

ord <- order(data2$repwt)



# ----------
graphics.off()

plot(weight ~ repwt, data = data2)

abline(linmod)

lines(pred$fit[ord] + pred$se[ord] ~ repwt[ord], data = data2, lty = 2, col = "blue")
lines(pred$fit[ord] - pred$se[ord] ~ repwt[ord], data = data2, lty = 2, col = "blue")

