###Code Book

This code book describes the data used in Getting and Cleaning Data Course Project, as well the procedure to create the final tidy data set.

##Overview
Dataset information could be retrieved from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files in use
The above zip file contains two directories, one for training data, the another for testing data. 
In the root directory, there are additional metadata files:
  activity_labels.txt: Links the class labels with their activity name (there are 6). 
  features.txt: List of 561 measured features.
  features_info.txt: Shows information about the variables used on the feature vector.

#Training Data:
  train/X_train.txt: Training set
  train/y_train.txt: Training labels.
  train/subject_train.txt: ID of the volunteer related to each of the observations in X_train.txt.

#Testing Data:
Their descriptions are equivalent to test data.

## Dataset files that were not used
In addition to above files, there are directories containing raw signal data in the "Inertial Signals" folders. This raw data was not used.

