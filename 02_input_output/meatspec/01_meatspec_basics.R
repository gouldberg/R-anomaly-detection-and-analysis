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
# basics
# ------------------------------------------------------------------------------