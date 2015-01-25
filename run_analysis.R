library(data.table)

setwd("~/Documents/desarrollo/coursera/Getting_cleaning_data/peer assessment/UCI HAR Dataset/Getting_Cleaning_Data_Peer_Assessment")

# Reads the auxiliary functions
source("run_analisys_aux_functions.R")

## Part 1 -> RAW MERGE
#
# Merges the training and the test sets to create one data set. We are going to use an auxiliary function working as a dummy rule engine. 
# In this case the condition is the same name of the files and the consequence is the raw merge. 
# This is only a raw merge of the files. They preserve their original format yet.
#

train_root_dir_name <- "train"
test_root_dir_name <- "test"
merge_root_dir_name <- "merge"
default_files_to_retrieve_pattern <- "\\.txt$"

traverse_files_rule_engine(train_root_dir_name, 
                            test_root_dir_name, 
                              default_files_to_retrieve_pattern, 
                                same_stem_condition, 
                                  raw_merge_consequence(merge_root_dir_name))

## Parts 2, 3, 4 -> RESHAPING THE PREVIOUS MERGED DATA SET
#
# This function makes the final merge reshaping the data set.
# Filtering the rows extarcting those related with mean and std
# Adding the activity variable
# Adding the subject variable
#
merged_and_reshaped_ds <- reshape()

write.table(merged_and_reshaped_ds, paste(c(merge_root_dir_name,"/","merged"), collapse = ""), sep="\t", row.names=TRUE, col.names=TRUE)

## Part 5 -> CREATES THE FINAL TIDY DATA SET
#
# From the previous data set, creates a  tidy data set with the average of each variable for each activity and each subject.
#

tidy_data_set <- create_tidy_dataset(merged_and_reshaped_ds)

write.table(tidy_data_set, paste(c(merge_root_dir_name,"/","tidy",".txt"), collapse = ""), sep="\t", row.names=TRUE, col.names=TRUE)
