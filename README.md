# Getting and cleaning data - Course Project

## Instructions to run
Running the `run_analysis.R` script will:

- Download the data needed for the analysis if necessary
- Merge training and test sets
- Extract measurements only for mean and standard deviation for each measurement
- Rename variable names to be more descriptive
- Use descriptive activity names
- Create a tidy data set with the average of each variable for each activity and subject
- Write this tidy data set to a file named `means_per_activity_and_user.txt`

## Input
Data set from the UCI Machine Learning Repository containing Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

More information: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data downloaded for the project is gathered from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Output
`means_per_activity_and_user.txt` file containing a tidy data set with the average of each variable for each activity and subject.

## Code Book
The variables, data, and any transformations made to the data can be found in `CodeBook.md`