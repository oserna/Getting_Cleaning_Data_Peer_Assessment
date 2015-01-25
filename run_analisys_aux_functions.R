
########################################################################################
# Auxiliary functions for run_analisys
########################################################################################

# Dummy one rule engine.
# Traverse the files from the directories evaluating the condition and if it´s true the consequence will be executed

traverse_files_rule_engine <- function(dir1 = "test", dir2 = "train", files_to_retrieve_pattern = "\\.txt$", condition, consequence){
  
  getFiles <- function(directory){
    list.files(path = directory,pattern = files_to_retrieve_pattern,full.names = TRUE)
  }
  
  dir1_files <- getFiles(dir1)  
  dir2_files <- getFiles(dir2)
  
  for(file in dir1_files){
    
    for(file2 in dir2_files){
      
      if(condition(file, file2)){
        
        consequence(file, file2)
      }
    }  	
  }
}

# Retrieves the stem of the file name
#
get_stem <- function(file_name){
  gsub(".*/(.*)_.*\\.txt", "\\1", file_name)
}

# This condition will be true if the stem of these two files is the same
#
same_stem_condition <- function(file, file2){  
  isTRUE(getStem(file) == get_stem(file2))    
}

# This consequence merges the files, also stores he final result
#
raw_merge_consequence <- function(target_dir){
  
  dir.create(file.path(target_dir))
  
  merger <- function(file, file2){
    lds <- list(read.table(file),read.table(file2))   
    common_stem <- get_stem(file)
    write.table(rbindlist(lds), paste(c(target_dir,"/",common_stem,"_merge",".txt"), collapse = ""), sep="\t", row.names=FALSE, col.names=FALSE)
  }
  
  merger
}

# Reshape the raw merge
# Adding the activity and the subject variables
# Change the names

reshape <- function(){
  
  merged_ds <- add_subject(
                add_activity(
                  filter_mean_std()))
  
  merged_ds_names <- colnames(merged_ds)
  merged_ds_names <- gsub("-mean\\(\\)", merged_ds_names, replacement = "Mean")
  merged_ds_names <- gsub("-std\\(\\)", merged_ds_names, replacement = "Std")
  colnames(merged_ds) <- merged_ds_names
  
  merged_ds
  
}

# Reads the features and selects the variables realted with mean and std
# Applies this selection to the raw merged data set
#
filter_mean_std <- function(){
  
  features <- read.table("UCI HAR Dataset/features.txt")
  rowsToExtract <- features[grep(".*-(mean|std)\\(\\)",features$V2),]
  
  features_df <- read.table("merge/X_merge.txt")
  extractedRows <- features_df[,rowsToExtract[,1]]
  colnames(extractedRows) <- rowsToExtract[[2]]
  
  extractedRows
}

# Add the activity variable
#
add_activity <- function(extractedRows){
  
  activity_index <- read.table("merge/y_merge.txt")
  
  extractedRows <- cbind(activity_index[,1], extractedRows)
  colnames(extractedRows)[1] <- "activity"
  
  extractedRows[,1] <- as.factor(extractedRows[,1])
  levels(extractedRows[,1]) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
  
  extractedRows
}

# Add the subject variable
#

add_subject <- function(extractedRows){
  
  subjects <- read.table("merge/subject_merge.txt")
  extractedRows <- cbind(subjects[,1], extractedRows)
  colnames(extractedRows)[1] <- "subject"
  
  extractedRows
}


# Composes the tidy data set
#
create_tidy_dataset <- function(merged_ds){
  
  splitted_list <- split(merged_ds,list(merged_ds$activity, merged_ds$subject))
  
  means_dataset <- rbindlist(as.list(
    lapply(splitted_list, function(x){
      cbind(x[1,1:2], as.data.frame(rbind(colMeans(x[,3:68]))))    
    })))
  
  means_dataset
}