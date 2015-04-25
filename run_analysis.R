# Name: run_analysis.R 
# "Getting and Cleaning Data"  - project script
# Tested on Ubuntu 14.04 LTS

# Preparation: 
# Get the data for the project from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Unzip the archive, it creates "UCI HAR Dataset" directory in your working directory

require("data.table")
require("reshape2")

rm(list=ls())

# 1. Read the data files:
DIR = "UCI HAR Dataset"
activity_labels <- read.table(paste(DIR, "activity_labels.txt", sep="/"))[,2]
features <- read.table(paste(DIR, "features.txt", sep="/"))[,2]

# train data:
subject_test <- read.table(paste(DIR, "test/subject_test.txt", sep="/"))
X_test <- read.table(paste(DIR, "test/X_test.txt", sep="/"))
y_test <- read.table(paste(DIR, "test/y_test.txt", sep="/"))
# Activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_Code", "Activity_Label")
names(subject_test) = "Subject"

# test data:
subject_train <- read.table(paste(DIR, "train/subject_train.txt", sep="/"))
X_train <- read.table(paste(DIR, "train/X_train.txt", sep="/"))
y_train <- read.table(paste(DIR, "train/y_train.txt", sep="/"))
# Activity labels
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_Code", "Activity_Label")
names(subject_train) = "Subject"


# Merge the training and the test sets to create one data set.
# Extract only the measurements on the mean and standard deviation for each measurement. 
# It's more efficient to reduce datasets before merging
extract_features <- grepl("mean|std", features)
names(X_train) <- features    # meaningful names
names(X_test) <- features    # meaningful names
X_train <- X_train[, extract_features]
X_test <- X_test[, extract_features]

# Bind data to tiny dataset
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
train_data <- cbind(as.data.table(subject_train), y_train, X_train)
all_data <-rbind(test_data, train_data)

labels <- c("Subject", "Activity_Code", "Activity_Label")
data_labels <- setdiff(colnames(all_data), labels)
mdata <- melt(all_data, id.vars = labels, measure.vars = data_labels)

# Apply mean function
tidy_data <- dcast(mdata, Subject + Activity_Code + Activity_Label ~ variable, mean)

# Save tidy dataset
write.table(tidy_data, file = "./tidy_data.txt", raw.name=FALSE)

