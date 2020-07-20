## CodeBook

This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Input Data Set Information

The data from course website represents data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The Data Set Files used in the project

The provided data source include a lot of files. Following ones are used in the project:

- 'README.txt': General introduction.

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all 561 features, from tBodyAcc-mean()-X to angle(Z,gravityMean).

- 'activity_labels.txt': Links the activity class labels with their activity name.

- 'train/X_train.txt': Training set containing the values on each measurement.

- 'train/Y_train.txt': Training labels containing activity class labels or numbers from 1 to 6.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'test/X_test.txt': Test set containing the values on each measurement.

- 'test/Y_test.txt': Test labels containing activity class labels or numbers from 1 to 6.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
