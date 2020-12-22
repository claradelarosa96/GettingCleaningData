library(tidyverse)

train_x <- read_table("UCI HAR Dataset/train/X_train.txt", col_names = F)
train_y <- read_table("UCI HAR Dataset/train/y_train.txt", col_names = "Labels")

sub_train <- read_table("UCI HAR Dataset/train/subject_train.txt", col_names = "Subject")

all_train <- sub_train %>% add_column(train_y) %>% add_column("Group" = "test") %>%
  add_column(train_x)
names(all_train) <- c("Subject", "Label", "Group", paste0("Dat_", 1:561))

test_x <- read_table("UCI HAR Dataset/test/X_test.txt", col_names = F)
test_y <- read_table("UCI HAR Dataset/test/y_test.txt", col_names = "Labels")

sub_test <- read_table("UCI HAR Dataset/test/subject_test.txt", col_names = "Subject")

all_test <- sub_test %>% add_column(test_y) %>% add_column("Group" = "test") %>%
  add_column(test_x)
names(all_test) <- c("Subject", "Label", "Group", paste0("Dat_", 1:561))

both <- all_train %>% add_row(all_test)

both$Mean_measures <- apply(both[, -c(1, 2, 3)], 1, mean)
both$Sd_measures <- apply(both[, -c(1, 2, 3)], 1, sd)

both <- select(both, Subject, Label, Group, Mean_measures, Sd_measures) %>% arrange(Subject, Label) %>%
  as_tibble()
both$Label <- recode(both$Label, `1` = "Walking", `2` = "Walking_upstairs", 
                         `3` = "Walking_downstairs", `4` = "Sitting", 
                         `5` = "Standing", `6` = "Laying")

#both 


summ_both <- both %>% group_by(Subject, Label) %>% summarise("Av_mean" = mean(Mean_measures), "Av_sd" = mean(Sd_measures))

summ_both
