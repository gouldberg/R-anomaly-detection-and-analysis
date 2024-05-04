# setwd("//media//kswada//MyFiles//R//melanoma")
setwd("C:\\Users\\kswad\\OneDrive\\�f�X�N�g�b�v\\�Z�p�͋���_���v���\\51_��̓X�N���v�g\\meatspec")

packages <- c("dplyr")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)



# ------------------------------------------------------------------------------
# data:  meatspec
# ------------------------------------------------------------------------------

data(meatspec, package="faraway")


str(meatspec)


dim(meatspec)




# ------------------------------------------------------------------------------
# data exploration:  pairwise high correlated variables
# ------------------------------------------------------------------------------

# find variables with pairwise high correlation (absolute value)

corThresh <- 0.9


tooHigh <- caret::findCorrelation(cor(meatspec), corThresh)


names(meatspec)[tooHigh]



# -->
# Many variables are correlated .... difficult for normal regression

