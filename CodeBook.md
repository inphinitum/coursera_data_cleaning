# Codebook

## Variables

meansPerActivityAndUser

Variable                                   | Comments
-------------------------------------------|-----------
Subject                                    | Subject id (1-30)
Activity                                   | Activity performed during the observation (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
timeBodyAccelerometerMeanX                 | Mean of tBodyAcc-mean()-X
timeBodyAccelerometerMeanY                 | Mean of tBodyAcc-mean()-Y
timeBodyAccelerometerMeanZ                 | Mean of tBodyAcc-mean()-Z
timeBodyAccelerometerStdX                  | Mean of tBodyAcc-std()-X
timeBodyAccelerometerStdY                  | Mean of tBodyAcc-std()-Y
timeBodyAccelerometerStdZ                  | Mean of tBodyAcc-std()-Z
timeGravityAccelerometerMeanX              | Mean of tGravityAcc-mean()-X
timeGravityAccelerometerMeanY              | Mean of tGravityAcc-mean()-Y
timeGravityAccelerometerMeanZ              | Mean of tGravityAcc-mean()-Z
timeGravityAccelerometerStdX               | Mean of tGravityAcc-std()-X
timeGravityAccelerometerStdY               | Mean of tGravityAcc-std()-Y
timeGravityAccelerometerStdZ               | Mean of tGravityAcc-std()-Z
timeBodyAccelerometerJerkMeanX             | Mean of tBodyAccJerk-mean()-X
timeBodyAccelerometerJerkMeanY             | Mean of tBodyAccJerk-mean()-Y
timeBodyAccelerometerJerkMeanZ             | Mean of tBodyAccJerk-mean()-Z
timeBodyAccelerometerJerkStdX              | Mean of tBodyAccJerk-std()-X
timeBodyAccelerometerJerkStdY              | Mean of tBodyAccJerk-std()-Y
timeBodyAccelerometerJerkStdZ              | Mean of tBodyAccJerk-std()-Z
timeBodyGyroscopeMeanX                     | Mean of tBodyGyro-mean()-X
timeBodyGyroscopeMeanY                     | Mean of tBodyGyro-mean()-Y
timeBodyGyroscopeMeanZ                     | Mean of tBodyGyro-mean()-Z
timeBodyGyroscopeStdX                      | Mean of tBodyGyro-std()-X
timeBodyGyroscopeStdY                      | Mean of tBodyGyro-std()-Y
timeBodyGyroscopeStdZ                      | Mean of tBodyGyro-std()-Z
timeBodyGyroscopeJerkMeanX                 | Mean of tBodyGyroJerk-mean()-X
timeBodyGyroscopeJerkMeanY                 | Mean of tBodyGyroJerk-mean()-Y
timeBodyGyroscopeJerkMeanZ                 | Mean of tBodyGyroJerk-mean()-Z
timeBodyGyroscopeJerkStdX                  | Mean of tBodyGyroJerk-std()-X
timeBodyGyroscopeJerkStdY                  | Mean of tBodyGyroJerk-std()-Y
timeBodyGyroscopeJerkStdZ                  | Mean of tBodyGyroJerk-std()-Z
timeBodyAccelerometerMagMean               | Mean of tBodyAccMag-mean()
timeBodyAccelerometerMagStd                | Mean of tBodyAccMag-std()
timeGravityAccelerometerMagMean            | Mean of tGravityAccMag-mean()
timeGravityAccelerometerMagStd             | Mean of tGravityAccMag-std()
timeBodyAccelerometerJerkMagMean           | Mean of tBodyAccJerkMag-mean()
timeBodyAccelerometerJerkMagStd            | Mean of tBodyAccJerkMag-std()
timeBodyGyroscopeMagMean                   | Mean of tBodyGyroMag-mean()
timeBodyGyroscopeMagStd                    | Mean of tBodyGyroMag-std()
timeBodyGyroscopeJerkMagMean               | Mean of tBodyGyroJerkMag-mean()
timeBodyGyroscopeJerkMagStd                | Mean of tBodyGyroJerkMag-std()
frequencyBodyAccelerometerMeanX            | Mean of fBodyAcc-mean()-X
frequencyBodyAccelerometerMeanY            | Mean of fBodyAcc-mean()-Y
frequencyBodyAccelerometerMeanZ            | Mean of fBodyAcc-mean()-Z
frequencyBodyAccelerometerStdX             | Mean of fBodyAcc-std()-X
frequencyBodyAccelerometerStdY             | Mean of fBodyAcc-std()-Y
frequencyBodyAccelerometerStdZ             | Mean of fBodyAcc-std()-Z
frequencyBodyAccelerometerJerkMeanX        | Mean of fBodyAccJerk-mean()-X
frequencyBodyAccelerometerJerkMeanY        | Mean of fBodyAccJerk-mean()-Y
frequencyBodyAccelerometerJerkMeanZ        | Mean of fBodyAccJerk-mean()-Z
frequencyBodyAccelerometerJerkStdX         | Mean of fBodyAccJerk-std()-X
frequencyBodyAccelerometerJerkStdY         | Mean of fBodyAccJerk-std()-Y
frequencyBodyAccelerometerJerkStdZ         | Mean of fBodyAccJerk-std()-Z
frequencyBodyGyroscopeMeanX                | Mean of fBodyGyro-mean()-X
frequencyBodyGyroscopeMeanY                | Mean of fBodyGyro-mean()-Y
frequencyBodyGyroscopeMeanZ                | Mean of fBodyGyro-mean()-Z
frequencyBodyGyroscopeStdX                 | Mean of fBodyGyro-std()-X
frequencyBodyGyroscopeStdY                 | Mean of fBodyGyro-std()-Y
frequencyBodyGyroscopeStdZ                 | Mean of fBodyGyro-std()-Z
frequencyBodyAccelerometerMagMean          | Mean of fBodyAccMag-mean()
frequencyBodyAccelerometerMagStd           | Mean of fBodyAccMag-std()
frequencyBodyBodyAccelerometerJerkMagMean  | Mean of fBodyBodyAccJerkMag-mean()
frequencyBodyBodyAccelerometerJerkMagStd   | Mean of fBodyBodyAccJerkMag-std()
frequencyBodyBodyGyroscopeMagMean          | Mean of fBodyBodyGyroMag-mean()
frequencyBodyBodyGyroscopeMagStd           | Mean of fBodyBodyGyroMag-std()
frequencyBodyBodyGyroscopeJerkMagMean      | Mean of fBodyBodyGyroJerkMag-mean()
frequencyBodyBodyGyroscopeJerkMagStd       | Mean of fBodyBodyGyroJerkMag-std()


## Transformations

- Since the source dataset is split into a number of different files, we combine test and train observations, together with the subject that the observation belongs to, and the activity they were performing during each observation in a single dataset
- Filtered variables to only keep those matching mean or standard deviation
- Activity variable is made into a categorical variable, and replaced numbers with factors with a descriptive name for each activity
- Names of the variables were cleaned up to be made more descriptive than the original ones
- A summarized data set is created, showing the mean for each variable across observations per user and per activity
- The resulting data set is written to `means_per_activity_and_user.txt`


## Data (copied from source data's README.txt)
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
