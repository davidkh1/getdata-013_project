#Code Book
##Overview
This code book describes the data used in Getting and Cleaning Data Course Project, as well the procedure to create the final tidy data set.
Original dataset information could be retrieved from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Input data
Here are the data file for the project: [Initial data file in ZIP](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

When unzip, the extractor creates directory "UCI HAR Dataset". If this directory moved from the direcory of the R script, its name could be updated in 'DIR' variable of the [R Script](run_analysis.R).

## Files in use
The above zip file contains two directories, one for training data, the another for testing data.
In the root directory, there are additional metadata files:
  activity_labels.txt: Links the class labels with their activity name (there are 6). 
  features.txt: List of 561 measured features.
  features_info.txt: Shows information about the variables used on the feature vector.

###Training Data:
  train/X_train.txt: Training set
  train/y_train.txt: Training labels.
  train/subject_train.txt: ID of the volunteer related to each of the observations in X_train.txt.

###Testing Data:
Their descriptions are equivalent to training data, but in "test" directory.

## Dataset files that were not used
In addition to above files, there are directories containing raw signal data in the "Inertial Signals" folders. This raw data was not used.

##Output data format
There are 82 parameters in output file, instead of original 561 parameters. The parameters were choosen from the original data if a parameter name has "mean" or "std" in its name.
The output file has mean and standard deviation variables for following parameters, including all X, Y and Z axes:
Subject - volunteer ID
Activity_Code, Activity_Label: one of (1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING)
tBodyAcc,  tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tGravityAccMag, ... - sensors measurements. The complete list of variables of each feature vector is available in 'features.txt' of original dataset.
