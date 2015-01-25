## Getting and Cleaning Data Peer Assesstment


## The original data was transformed by

1. Merging the training and the test sets to create one data set.

You can see this first raw merge in these three files within the merge generated directory:

- y_merge.txt, this is a raw merge between y_test.txt and y_train.txt
- X_merge.txt, this is a raw merge between X_test.txt and X_train.txt
- subject_merge.txt, this is a raw merge between subject_test.txt and subject_train.txt


2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names. 

As a result of the steps above (2,3,4) you can see in the merge generated directory this new dataset:

- merged.txt


5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

As a result of this final step you can see within the merge generated directory this new dataset:

- tidy.txt

## Variables

- subject: identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- activity: a factor with the activity name.
- subset containing all the variables related with the mean and the std from the features.txt list in the original dataset
