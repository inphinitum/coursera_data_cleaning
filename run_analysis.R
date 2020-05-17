# Gather data and load it onto a dataset
FUCI_HAR_Dataset_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FUCI_HAR_Dataset_Filename <- "data/FUCI_HAR.zip"
download.file(FUCI_HAR_Dataset_URL, FUCI_HAR_Dataset_Filename)
unzip(FUCI_HAR_Dataset_Filename, exdir = "data")

# Merge training and test sets
# Data is stored in test/X_test.txt and train/X_train.txt
testDataFilename <- "data/UCI HAR Dataset/test/X_test.txt"
trainDataFilename <- "data/UCI HAR Dataset/train/X_train.txt"
testData <- read.table(testDataFilename)
trainData <- read.table(trainDataFilename)
fullData <- rbind(testData, trainData)
