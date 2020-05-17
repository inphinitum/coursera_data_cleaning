library(dplyr)

path <- getwd()
pathData <- file.path(path, "data")
dataFile <- file.path(pathData, "FUCI_HAR.zip")

# Download and unpack data if not present
if(!file.exists(dataFile)) {
  dir.create(pathData)
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, dataFile)
  unzip(dataFile, exdir = pathData)
}

pathDataUCIHAR <- file.path(pathData, "UCI HAR Dataset")

# Measurement data is stored in test/X_test.txt and train/X_train.txt
# Labels are stored in test/y_test.txt and train/y_train.txt
# Subjects are stored in test/subject_test.txt and train/subject_train.txt

# Read feature names and convert factor to strings, so we can assign them later to variable names
variableNames <- read.table(file.path(pathDataUCIHAR, "features.txt"))
variableNames <- sapply(variableNames$V2, as.character)

# Load measurement data from both train and test, combine datasets, assign variable names.
# Offset to only keep std dev and mean variables
testMeasurement <- read.table(file.path(pathDataUCIHAR, "test", "X_test.txt"))
trainMeasurement <- read.table(file.path(pathDataUCIHAR, "train", "X_train.txt"))
fullMeasurement <- rbind(testMeasurement, trainMeasurement)
names(fullMeasurement) <- variableNames
fullMeasurement <- fullMeasurement[, grep("std\\(\\)|mean\\(\\)", variableNames)]

# Remove temporary objects
remove(testMeasurement, trainMeasurement, variableNames)

# Load subject and activity data, combine test, train, and measurement data in a single data set
testActivity <- read.table(file.path(pathDataUCIHAR, "test", "y_test.txt"))
trainActivity <- read.table(file.path(pathDataUCIHAR, "train", "y_train.txt"))
fullActivity <- rbind(testActivity, trainActivity)
names(fullActivity) <- "Activity"
remove(testActivity, trainActivity)

testSubject <- read.table(file.path(pathDataUCIHAR, "test", "subject_test.txt"))
trainSubject <- read.table(file.path(pathDataUCIHAR, "train", "subject_train.txt"))
fullSubject <- rbind(testSubject, trainSubject)
names(fullSubject) <- "Subject"
remove(testSubject, trainSubject)

# Combine subject, activity, measurement datasets. Clean up temporary datasets.
fullData <- cbind(fullSubject, fullActivity, fullMeasurement)
remove(fullSubject, fullActivity, fullMeasurement)

# Read activity labels, convert fullData's Activity variable into a categorical one
# and assign labels according to read data
activityLabels <- read.table(file.path(pathDataUCIHAR, "activity_labels.txt"))
fullData$Activity <- factor(fullData$Activity, labels=activityLabels$V2)
remove(activityLabels)

# Tidy up variable names
names(fullData) <- gsub("-", "", names(fullData))
names(fullData) <- gsub("^t", "time", names(fullData))
names(fullData) <- gsub("^f", "frequency", names(fullData))
names(fullData) <- gsub("[Aa]cc", "Accelerometer", names(fullData))
names(fullData) <- gsub("[Gg]yr", "Gyroscope", names(fullData))
names(fullData) <- gsub("[Mm]ean[(*][)*]", "Mean", names(fullData))
names(fullData) <- gsub("[Ss]td[(*][)*]", "Std", names(fullData))
names(fullData) <- gsub("[Ff]req[(*][)*]", "Freq", names(fullData))

# Create a separate dataset with the average of each variable for each activity and subject
meansPerActivityAndUser <- fullData %>%
  group_by(Subject, Activity) %>%
  summarize_each(mean)

write.table(meansPerActivityAndUser, file.path(path, "means_per_activity_and_user.txt"), row.names = FALSE)
