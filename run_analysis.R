# Instantiate useful libraries
library(data.table)
library(plyr)
library(dplyr)

# Get names 
names = read.table("./UCI HAR Dataset/features.txt")
only_names <- names$V2

# Names changes for all variables (\\ needed for special characters)
mod_names1 <- gsub("-mean\\()-", "-mean-", only_names)
mod_names2 <- gsub("std\\()", "std", mod_names1)

# Prefix variable names with TEST for test table 
test_mod_names1 <- gsub("tB", "test_tB", mod_names2)
test_mod_names2 <- gsub("tG", "test_tG", test_mod_names1)
test_mod_names3 <- gsub("fB", "test_fB", test_mod_names2)

# Prefix variable names wit TRAIN for train table
train_mod_names1 <- gsub("tB", "train_tB", mod_names2)
train_mod_names2 <- gsub("tG", "train_tG", train_mod_names1)
train_mod_names3 <- gsub("fB", "train_fB", train_mod_names2)

# Creates a name map - new names to old names
test_name_map <- cbind(names, test_mod_names3)
train_name_map <- cbind(names, train_mod_names3)

# Get activity labels
activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")
act_lbl_rn <- rename(activity_labels, activity_id = V1, activity_desc = V2)

# Read in TEST data 
x_test = read.table("./UCI HAR Dataset/test/X_test.txt")
y_test = read.table("./UCI HAR Dataset/test/Y_test.txt")
test_subject = read.table("./UCI HAR Dataset/test/subject_test.txt")

# Rename variables to something more descriptive
y_test_rn <- rename(y_test, activity_id = V1)
test_sub_rn <- rename(test_subject, subject_id = V1)

# Join activity labels to Y_TEST data
y_test_lbl <- merge(y_test_rn, act_lbl_rn, by.x="activity_id", by.y="activity_id", all=TRUE)

# Give variable names to TEST results table
x_test1 <- setNames(x_test, test_mod_names3)

# Bring together tables into one data frame
test = cbind(test_sub_rn, y_test_lbl, x_test1)

# Read in TRAINING data
x_train = read.table("./UCI HAR Dataset/train/X_train.txt")
y_train = read.table("./UCI HAR Dataset/train/Y_train.txt")
train_subject = read.table("./UCI HAR Dataset/train/subject_train.txt")

# Rename variables to something more descriptive
y_train_rn <- rename(y_train, activity_id = V1)
train_sub_rn <- rename(train_subject, subject_id = V1)

# Join activity labes to Y_TEST data
y_train_lbl <- merge(y_train_rn, act_lbl_rn, by.x="activity_id", by.y="activity_id", all=TRUE)

# Give variable names to results table
x_train1 <- setNames(x_train, train_mod_names3)

# Bring together tables into one data frame
train = cbind(train_sub_rn, y_train_lbl, x_train1)

## Find columns that have mean / std. Others will be dropped##

# 1. Finds column names with mean or std in it
test_mean_std_pos1 <- grep(("-mean-|-std-"), test_mod_names3)
train_mean_std_pos1 <- grep(("-mean-|-std-"), train_mod_names3)

# 2. Convert to data frame for merge
test_mean_std_pos2 <- as.data.frame(test_mean_std_pos1)
train_mean_std_pos2 <- as.data.frame(train_mean_std_pos1)

# 3. Keeps only names with STD and MEAN
test_subset_names <- merge(test_name_map, test_mean_std_pos2, by.x="V1", by.y="test_mean_std_pos1")
train_subset_names <- merge(train_name_map, train_mean_std_pos2, by.x="V1", by.y="train_mean_std_pos1")

# 4. Convert to character vector to be used in subset()
test_sub_nm_vec <- as.vector(test_subset_names$test_mod_names3)
train_sub_nm_vec <- as.vector(train_subset_names$train_mod_names3)

#. 5 Create character vectors of columns to keep 
key_vars <- c("subject_id","activity_desc")
test_keep_vars <- c(key_vars, test_sub_nm_vec)
train_keep_vars <- c(key_vars, train_sub_nm_vec)

#. 6 Subset data sets to include only those variables to keep
test1 <- subset(test, select=test_keep_vars)
train1 <- subset(train, select=train_keep_vars)

# Merges tables together - keep all Y (says nothing about)
# subsetting on smallest table
all_data <- merge(test1, train1, all=TRUE)

# Convert to data table
all_data_dt <-data.table(all_data)

# Checks unique groups
#unique(test1[c("subject_id", "activity_desc")])
#unique(train1[c("subject_id", "activity_desc")])

# Applies mean to the all columns (other than subject_id and activity_desc)
# grouping over the subject_id and activity_desc
average_by_group <- all_data_dt[ , lapply(.SD, mean), by = .(subject_id, activity_desc)]
