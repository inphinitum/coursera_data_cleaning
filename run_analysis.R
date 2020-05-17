# Gather data and load it onto a dataset
FUCI_HAR_Dataset_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FUCI_HAR_Dataset_Filename <- "data/FUCI_HAR.zip"
download.file(FUCI_HAR_Dataset_URL, FUCI_HAR_Dataset_Filename)
unzip(FUCI_HAR_Dataset_Filename, exdir = "data")

### STEP 1: Merge training and test sets
# Data is stored in test/X_test.txt and train/X_train.txt
testDataFilename <- "data/UCI HAR Dataset/test/X_test.txt"
trainDataFilename <- "data/UCI HAR Dataset/train/X_train.txt"
testData <- read.table(testDataFilename)
trainData <- read.table(trainDataFilename)
fullData <- rbind(testData, trainData)

### STEP 2: Extract only mean and standard deviation for each measurement
#
# We're going to read the features and filter by mean() and std(), so we get the variable indexes we want
featuresFilename <- "data/UCI HAR Dataset/features.txt"
features <- read.table(featuresFilename)
indexesMeanAndStdVariables <- grep("std()|mean()", features$V2)

# Filter full dataset to only contain the variables that contain mean and standard deviation measurements
fullDataMeanStd <- fullData[, indexesMeanAndStdVariables]
