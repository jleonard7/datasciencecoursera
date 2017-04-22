 a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

# List of Variables
*Note 1:* (from the features_info.txt provided with data): The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*Note 2:* Prefix of "test" indicates observation pulled from test data; prefix of "train" indicates obsevation pulled from training data.

*Note 3:* MEAN = mean of the signal; STD = standard deviation of the signal

* subject_id   - Integer - Unique Identifier
* activity_desc - Factor - Type of activity
* test_tBodyAcc-mean-X - Numeric - units: -1 to 1
* test_tBodyAcc-mean-Y - Numeric - units: -1 to 1
* test_tBodyAcc-mean-Z - Numeric - units: -1 to 1
* test_tBodyAcc-std-X - Numeric - units: -1 to 1
* test_tBodyAcc-std-Y - Numeric - units: -1 to 1
* test_tBodyAcc-std-Z - Numeric - units: -1 to 1
* test_tGravityAcc-mean-X - Numeric - units: -1 to 1
* test_tGravityAcc-mean-Y - Numeric - units: -1 to 1
* test_tGravityAcc-mean-Z - Numeric - units: -1 to 1
* test_tGravityAcc-std-X - Numeric - units: -1 to 1
* test_tGravityAcc-std-Y - Numeric - units: -1 to 1
* test_tGravityAcc-std-Z - Numeric - units: -1 to 1
* test_tBodyAccJerk-mean-X - Numeric - units: -1 to 1
* test_tBodyAccJerk-mean-Y - Numeric - units: -1 to 1
* test_tBodyAccJerk-mean-Z - Numeric - units: -1 to 1
* test_tBodyAccJerk-std-X - Numeric - units: -1 to 1
* test_tBodyAccJerk-std-Y - Numeric - units: -1 to 1
* test_tBodyAccJerk-std-Z - Numeric - units: -1 to 1
* test_tBodyGyro-mean-X - Numeric - units: -1 to 1
* test_tBodyGyro-mean-Y - Numeric - units: -1 to 1
* test_tBodyGyro-mean-Z - Numeric - units: -1 to 1
* test_tBodyGyro-std-X - Numeric - units: -1 to 1
* test_tBodyGyro-std-Y - Numeric - units: -1 to 1
* test_tBodyGyro-std-Z - Numeric - units: -1 to 1
* test_tBodyGyroJerk-mean-X - Numeric - units: -1 to 1
* test_tBodyGyroJerk-mean-Y - Numeric - units: -1 to 1
* test_tBodyGyroJerk-mean-Z - Numeric - units: -1 to 1
* test_tBodyGyroJerk-std-X - Numeric - units: -1 to 1
* test_tBodyGyroJerk-std-Y - Numeric - units: -1 to 1
* test_tBodyGyroJerk-std-Z - Numeric - units: -1 to 1
* test_fBodyAcc-mean-X - Numeric - units: -1 to 1
* test_fBodyAcc-mean-Y - Numeric - units: -1 to 1
* test_fBodyAcc-mean-Z - Numeric - units: -1 to 1
* test_fBodyAcc-std-X - Numeric - units: -1 to 1
* test_fBodyAcc-std-Y - Numeric - units: -1 to 1
* test_fBodyAcc-std-Z - Numeric - units: -1 to 1
* test_fBodyAccJerk-mean-X - Numeric - units: -1 to 1
* test_fBodyAccJerk-mean-Y - Numeric - units: -1 to 1
* test_fBodyAccJerk-mean-Z - Numeric - units: -1 to 1
* test_fBodyAccJerk-std-X - Numeric - units: -1 to 1
* test_fBodyAccJerk-std-Y - Numeric - units: -1 to 1
* test_fBodyAccJerk-std-Z - Numeric - units: -1 to 1
* test_fBodyGyro-mean-X - Numeric - units: -1 to 1
* test_fBodyGyro-mean-Y - Numeric - units: -1 to 1
* test_fBodyGyro-mean-Z - Numeric - units: -1 to 1
* test_fBodyGyro-std-X - Numeric - units: -1 to 1
* test_fBodyGyro-std-Y - Numeric - units: -1 to 1
* test_fBodyGyro-std-Z - Numeric - units: -1 to 1
* train_tBodyAcc-mean-X - Numeric - units: -1 to 1
* train_tBodyAcc-mean-Y - Numeric - units: -1 to 1
* train_tBodyAcc-mean-Z - Numeric - units: -1 to 1
* train_tBodyAcc-std-X - Numeric - units: -1 to 1
* train_tBodyAcc-std-Y - Numeric - units: -1 to 1
* train_tBodyAcc-std-Z - Numeric - units: -1 to 1
* train_tGravityAcc-mean-X - Numeric - units: -1 to 1
* train_tGravityAcc-mean-Y - Numeric - units: -1 to 1
* train_tGravityAcc-mean-Z - Numeric - units: -1 to 1
* train_tGravityAcc-std-X - Numeric - units: -1 to 1
* train_tGravityAcc-std-Y - Numeric - units: -1 to 1
* train_tGravityAcc-std-Z - Numeric - units: -1 to 1
* train_tBodyAccJerk-mean-X - Numeric - units: -1 to 1
* train_tBodyAccJerk-mean-Y - Numeric - units: -1 to 1
* train_tBodyAccJerk-mean-Z - Numeric - units: -1 to 1
* train_tBodyAccJerk-std-X - Numeric - units: -1 to 1
* train_tBodyAccJerk-std-Y - Numeric - units: -1 to 1
* train_tBodyAccJerk-std-Z - Numeric - units: -1 to 1
* train_tBodyGyro-mean-X - Numeric - units: -1 to 1
* train_tBodyGyro-mean-Y - Numeric - units: -1 to 1
* train_tBodyGyro-mean-Z - Numeric - units: -1 to 1
* train_tBodyGyro-std-X - Numeric - units: -1 to 1
* train_tBodyGyro-std-Y - Numeric - units: -1 to 1
* train_tBodyGyro-std-Z - Numeric - units: -1 to 1
* train_tBodyGyroJerk-mean-X - Numeric - units: -1 to 1
* train_tBodyGyroJerk-mean-Y - Numeric - units: -1 to 1
* train_tBodyGyroJerk-mean-Z - Numeric - units: -1 to 1
* train_tBodyGyroJerk-std-X - Numeric - units: -1 to 1
* train_tBodyGyroJerk-std-Y - Numeric - units: -1 to 1
* train_tBodyGyroJerk-std-Z - Numeric - units: -1 to 1
* train_fBodyAcc-mean-X - Numeric - units: -1 to 1
* train_fBodyAcc-mean-Y - Numeric - units: -1 to 1
* train_fBodyAcc-mean-Z - Numeric - units: -1 to 1
* train_fBodyAcc-std-X - Numeric - units: -1 to 1
* train_fBodyAcc-std-Y - Numeric - units: -1 to 1
* train_fBodyAcc-std-Z - Numeric - units: -1 to 1
* train_fBodyAccJerk-mean-X - Numeric - units: -1 to 1
* train_fBodyAccJerk-mean-Y - Numeric - units: -1 to 1
* train_fBodyAccJerk-mean-Z - Numeric - units: -1 to 1
* train_fBodyAccJerk-std-X - Numeric - units: -1 to 1
* train_fBodyAccJerk-std-Y - Numeric - units: -1 to 1
* train_fBodyAccJerk-std-Z - Numeric - units: -1 to 1
* train_fBodyGyro-mean-X - Numeric - units: -1 to 1
* train_fBodyGyro-mean-Y - Numeric - units: -1 to 1
* train_fBodyGyro-mean-Z - Numeric - units: -1 to 1
* train_fBodyGyro-std-X - Numeric - units: -1 to 1
* train_fBodyGyro-std-Y - Numeric - units: -1 to 1
* train_fBodyGyro-std-Z - Numeric - units: -1 to 1

# Data used
1. features.txt - list of original variable names
2. activity_labels.txt - descriptive names of activity
3. X_test.txt - Results data for test subjects
4. Y_test.txt - Activities performed by test subjects
5. subject_test.txt - Test subject unique identifiers
6. X_train.txt - Results data for training subjects
7. Y_train.txt - Activities perfomed by training subjects
8. subject_train.txt - Training subject unique identifiers

# Transformations
1. Modified names of the original variables to prefix with test_ or train_
