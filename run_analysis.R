# Gather data and load it onto a dataset
FUCI_HAR_Dataset_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FUCI_HAR_Dataset_Filename <- "data/FUCI_HAR.zip"
download.file(FUCI_HAR_Dataset_URL, FUCI_HAR_Dataset_Filename)
unzip(FUCI_HAR_Dataset_Filename, exdir = "data")

### STEP 1: Merge training and test sets
# Measurement data is stored in test/X_test.txt and train/X_train.txt
# Labels are stored in test/y_test.txt and train/y_train.txt
# Subjects are stored in test/subject_test.txt and train/subject_train.txt

# Load measurement, activity and subject data
testDataFilename <- "data/UCI HAR Dataset/test/X_test.txt"
testDataLabelsFilename <- "data/UCI HAR Dataset/test/y_test.txt"
testDataSubjectsFilename <- "data/UCI HAR Dataset/test/subject_test.txt"
testData <- read.table(testDataFilename)
testDataLabels <- read.table(testDataLabelsFilename)
testDataSubjects <- read.table(testDataSubjectsFilename)
testData <- cbind(testDataSubjects, testDataLabels, testData)

# Do the same thing for the train data
trainDataFilename <- "data/UCI HAR Dataset/train/X_train.txt"
trainDataLabelsFilename <- "data/UCI HAR Dataset/train/y_train.txt"
trainDataSubjectsFilename <- "data/UCI HAR Dataset/train/subject_train.txt"
trainData <- read.table(trainDataFilename)
trainDataLabels <- read.table(trainDataLabelsFilename)
trainDataSubjects <- read.table(trainDataSubjectsFilename)
trainData <- cbind(trainDataSubjects, trainDataLabels, trainData)

# Bind test and train datasets
fullData <- rbind(testData, trainData)

### STEP 2: Extract only mean and standard deviation for each measurement
#
# We're going to read the features and filter by mean() and std(), so we get the variable indexes we want
featuresFilename <- "data/UCI HAR Dataset/features.txt"
features <- read.table(featuresFilename)
indexesMeanAndStdVariables <- grep("std()|mean()", features$V2)

# Filter full dataset to only contain the variables that contain mean and standard deviation measurements
fullDataMeanStd <- fullData[, indexesMeanAndStdVariables]
