# 1. The submitted data set is tidy. 
# 2. The Github repo contains the required scripts.
# 3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
# 4. The README that explains the analysis files is clear and understandable.
# 5. The work submitted for this project is the work of the student who submitted it.

# This script:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(tidyverse)

# variable names
feats <- pull(read_table("UCI HAR Dataset - Complete copy/features.txt", col_names = F)[, 1])
feats <- sapply(feats, function(x) strsplit(x, split = " "))
feats <- sapply(feats, function(x) x[[2]])

# train dataset
train_x <- read_table("UCI HAR Dataset/train/X_train.txt", col_names = F)
train_y <- read_table("UCI HAR Dataset/train/y_train.txt", col_names = "Labels")

sub_train <- read_table("UCI HAR Dataset/train/subject_train.txt", col_names = "Subject")

all_train <- sub_train %>% add_column(train_y) %>% add_column("Group" = "test") %>%
  add_column(train_x)
names(all_train) <- c("Subject", "Label", "Group", feats)
all_train <- all_train %>% select(c(Subject, Label, Group, grep("mean|std", names(all_train))))

# test dataset
test_x <- read_table("UCI HAR Dataset/test/X_test.txt", col_names = F)
test_y <- read_table("UCI HAR Dataset/test/y_test.txt", col_names = "Labels")

sub_test <- read_table("UCI HAR Dataset/test/subject_test.txt", col_names = "Subject")

all_test <- sub_test %>% add_column(test_y) %>% add_column("Group" = "test") %>%
  add_column(test_x)
names(all_test) <- c("Subject", "Label", "Group", feats)
all_test <- all_test %>% select(c(Subject, Label, Group, grep("mean|std", names(all_test))))


# merge both train and test
both <- rbind(all_train, all_test)

both$Label <- recode(both$Label, `1` = "Walking", `2` = "Walking_upstairs", 
                         `3` = "Walking_downstairs", `4` = "Sitting", 
                         `5` = "Standing", `6` = "Laying")

# both 


summ_both <- both %>% group_by(Subject, Label) %>% summarise("Av_mean" = across(.cols = -c(1, 2, 3), mean))

summ_both

write.table(summ_both, "Tidy_Summary_Dataset.txt", row.names = F, quote = F)
