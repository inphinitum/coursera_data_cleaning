# Gather data and load it onto a dataset
FUCI_HAR_Dataset_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FUCI_HAR_Dataset_Filename <- "data/FUCI_HAR.zip"
download.file(FUCI_HAR_Dataset_URL, FUCI_HAR_Dataset_Filename)
unzip(FUCI_HAR_Dataset_Filename, exdir = "data")

###########
### STEP 1: Merge training and test sets
###########
# Measurement data is stored in test/X_test.txt and train/X_train.txt
# Labels are stored in test/y_test.txt and train/y_train.txt
# Subjects are stored in test/subject_test.txt and train/subject_train.txt

# NOTE: We're doing step 4 from the beginning since it simplifies things later on.
# Read variable names here, so we can assign them as soon as we've read the test and train data sets.
featuresFilename <- "data/UCI HAR Dataset/features.txt"
features <- read.table(featuresFilename)

# Convert factor to strings, so we can assign them later to variable names
features <- sapply(features$V2, as.character)

# Load measurement, activity and subject data for test data
testDataFilename <- "data/UCI HAR Dataset/test/X_test.txt"
testDataLabelsFilename <- "data/UCI HAR Dataset/test/y_test.txt"
testDataSubjectsFilename <- "data/UCI HAR Dataset/test/subject_test.txt"
testData <- read.table(testDataFilename)

# Assign descriptive variable names as per step 4 in the instructions
names(testData) <- features

# Offset the data as per step 2 in the instructions
indexesMeanAndStdVariables <- grep("std()|mean()", features)
testData <- testData[, indexesMeanAndStdVariables]

testDataLabels <- read.table(testDataLabelsFilename)
names(testDataLabels) <- "Activity"
testDataSubjects <- read.table(testDataSubjectsFilename)
names(testDataSubjects) <- "Subject"
testData <- cbind(testDataSubjects, testDataLabels, testData)

# Load measurement, activity and subject data for train data
trainDataFilename <- "data/UCI HAR Dataset/train/X_train.txt"
trainDataLabelsFilename <- "data/UCI HAR Dataset/train/y_train.txt"
trainDataSubjectsFilename <- "data/UCI HAR Dataset/train/subject_train.txt"
trainData <- read.table(trainDataFilename)

# Assign descriptive variable names as per step 4 in the instructions
names(trainData) <- features

# Offset the data as per step 2 in the instructions
trainData <- trainData[, indexesMeanAndStdVariables]

trainDataLabels <- read.table(trainDataLabelsFilename)
names(trainDataLabels) <- "Activity"
trainDataSubjects <- read.table(trainDataSubjectsFilename)
names(trainDataSubjects) <- "Subject"
trainData <- cbind(trainDataSubjects, trainDataLabels, trainData)

# Create one single dataset with test and train data
fullData <- rbind(testData, trainData)

###########
### STEP 2: Extract only mean and standard deviation for each measurement
###########
# Already done earlier in step 1

###########
### STEP 3: Use descriptive activity names to name the activities in the dataset
###########
# Read activity labels
activityLabelsFilename <- "data/UCI HAR Dataset/activity_labels.txt"
activityLabels <- read.table(activityLabelsFilename)

#  Convert fullData's Activity variable into a categorical one and assign labels according to read data
fullData$Activity <- factor(fullData$Activity, labels=activityLabels$V2)

#########
# STEP 4: Label data set with descriptive variable names
#########
# Already done earlier in step 1.

###########
### Step 5: Create a second, independent tidy dataset with the average of each variable for each activity
#           and each subject
###########
library(dplyr)
meansPerActivityAndUser <- fullData %>%
  group_by(Subject, Activity) %>%
  summarize_all(mean)
          