
### Purpose

This is a github repository with the code for the peer assesment required on the Coursera course Getting and Cleaning Data

The original data set can be found here [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### The data

The data is on a folder called UCI HAR Dataset, we will only need the following files:

- activity_labels.txt
- features.txt
- subject_test.txt
- subject_train.txt
- X_test.txt
- X_train.txt
- y_test.txt
- y_train.txt


### The code
As you have noticed we have two R scripts here:

- run_analysis.R. In this script you can see the main flow  
- run_analysis_aux_functions.R. Auxiliary functions called from run_analysis.R. 


### The process to see how it works

1. Clone the repo
2. Download the data set from the URL above and put it into this directory
3. Set your working directory pointing to this new directory containing the uncrompressed data and the code
4. From the R console execute source("run_analysis.R")
5. As a result you will have a new directory called merge containing:

- y_merge.txt, this is a raw merge between y_test.txt and y_train.txt
- X_merge.txt, this is a raw merge between X_test.txt and X_train.txt
- subject_merge.txt, this is a raw merge between subject_test.txt and subject_train.txt
- merged.txt, first of the final data set requested 
- tidy.txt, the final tidy data set requested


Detailed information about generated datasets (merge.txt and tidy.txt) can be found on the CodeBook.md file.