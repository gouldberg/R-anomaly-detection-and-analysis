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
# Train and Test split
# ------------------------------------------------------------------------------

train_row <- 1:172

test_row <- 173:215


train <- meatspec[train_row,]

test <- meatspec[test_row,]




# ------------------------------------------------------------------------------
# ordinary linear regression
# ------------------------------------------------------------------------------


modlm <- lm(fat ~., data = train)


summary(modlm)




# ----------
par(mfrow = C(2,2))

plot(modlm)
