## Getting and Cleaning Data Peer Assesstment

## General information about HAR data set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency componen, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


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
