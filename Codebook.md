# "Getting and Cleaning Data" Course Project Code book
>  This code book describes the variables, the data, and transformations/work performed to clean up the raw data
>> Dataset: Human Activity Recognition Using Smartphones Dataset Version 1.0
#### Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
#### Features info
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix "Time") were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time.BodyAccelerometer-XYZ and Time.BodyAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time.BodyAccelerometerJerk-XYZ and Time.BodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time.BodyAccelerometerMagnitude, Time.BodyAccelerometerMagnitude, Time.BodyAccelerometerJerkMagnitude, Time.BodyGyroscopeMagnitude, Time.BodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Freq.BodyAccelerometer-XYZ, Freq.BodyAccelerometerJerk-XYZ, Freq.BodyGyroscope-XYZ, Freq.BodyBodyAccelerometerJerkMagnitude, Freq.BodyBodyGyroscopeMagnitude, Freq.BodyBodyGyroscopeJerkMagnitude. (Note the "Freq" to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 
>mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

The complete list of variables of each feature vector is available below (79 variables).
#### Data transformations
Features' raw data were imported into R from these files:
    - 'train/X_train.txt': Training set.
    - 'train/y_train.txt': Training labels.
    - 'test/X_test.txt': Test set.
    - 'test/y_test.txt': Test labels.
Features original labels: 'features.txt'
Activity labels (Links the class labels with their activity name): 'activity_labels.txt'

run_script.R is a R script that contains the code to perform the following transformations:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#### Variables
* SubjID 
    * Subject identification number (1-30)
* Activity
    * Activity performed
        1. WALKING
        2. WALKING_UPSTAIRS
        3. WALKING_DOWNSTAIRS
        4. SITTING
        5. STANDING
        6. LAYING
* Time.BodyAccelerometer.mean().Xaxis
* Time.BodyAccelerometer.mean().Yaxis
* Time.BodyAccelerometer.mean().Zaxis
* Time.BodyAccelerometer.std().Xaxis
* Time.BodyAccelerometer.std().Yaxis
* Time.BodyAccelerometer.std().Zaxis
* Time.GravityAccelerometer.mean().Xaxis 
* Time.GravityAccelerometer.mean().Yaxis 
* Time.GravityAccelerometer.mean().Zaxis 
* Time.GravityAccelerometer.std().Xaxis 
* Time.GravityAccelerometer.std().Yaxis 
* Time.GravityAccelerometer.std().Zaxis 
* Time.BodyAccelerometerJerk.mean().Xaxis 
* Time.BodyAccelerometerJerk.mean().Yaxis 
* Time.BodyAccelerometerJerk.mean().Zaxis 
* Time.BodyAccelerometerJerk.std().Xaxis 
* Time.BodyAccelerometerJerk.std().Yaxis 
* Time.BodyAccelerometerJerk.std().Zaxis 
* Time.BodyGyroscope.mean().Xaxis 
* Time.BodyGyroscope.mean().Yaxis 
* Time.BodyGyroscope.mean().Zaxis 
* Time.BodyGyroscope.std().Xaxis 
* Time.BodyGyroscope.std().Yaxis 
* Time.BodyGyroscope.std().Zaxis 
* Time.BodyGyroscopeJerk.mean().Xaxis 
* Time.BodyGyroscopeJerk.mean().Yaxis 
* Time.BodyGyroscopeJerk.mean().Zaxis 
* Time.BodyGyroscopeJerk.std().Xaxis 
* Time.BodyGyroscopeJerk.std().Yaxis 
* Time.BodyGyroscopeJerk.std().Zaxis 
* Time.BodyAccelerometerMagnitude.mean() 
* Time.BodyAccelerometerMagnitude.std() 
* Time.GravityAccelerometerMagnitude.mean() 
* Time.BodyAccelerometerJerkMagnitude.mean() 
* Time.BodyAccelerometerJerkMagnitude.std() 
* Time.GravityAccelerometerMagnitude.std() 
* Time.BodyGyroscopeMagnitude.mean() 
* Time.BodyGyroscopeMagnitude.std() 
* Time.BodyGyroscopeJerkMagnitude.mean() 
* Time.BodyGyroscopeJerkMagnitude.std() 
* Freq.BodyAccelerometer.mean().Xaxis 
* Freq.BodyAccelerometer.mean().Yaxis 
* Freq.BodyAccelerometer.mean().Zaxis 
* Freq.BodyAccelerometer.std().Xaxis 
* Freq.BodyAccelerometer.std().Yaxis 
* Freq.BodyAccelerometer.std().Zaxis 
* Freq.BodyAccelerometer.meanFreq().Xaxis 
* Freq.BodyAccelerometer.meanFreq().Yaxis 
* Freq.BodyAccelerometer.meanFreq().Zaxis 
* Freq.BodyAccelerometerJerk.mean().Xaxis 
* Freq.BodyAccelerometerJerk.mean().Yaxis 
* Freq.BodyAccelerometerJerk.mean().Zaxis 
* Freq.BodyAccelerometerJerk.std().Xaxis 
* Freq.BodyAccelerometerJerk.std().Yaxis 
* Freq.BodyAccelerometerJerk.std().Zaxis 
* Freq.BodyAccelerometerJerk.meanFreq().Xaxis 
* Freq.BodyAccelerometerJerk.meanFreq().Yaxis 
* Freq.BodyAccelerometerJerk.meanFreq().Zaxis 
* Freq.BodyGyroscope.mean().Xaxis 
* Freq.BodyGyroscope.mean().Yaxis 
* Freq.BodyGyroscope.mean().Zaxis 
* Freq.BodyGyroscope.std().Xaxis 
* Freq.BodyGyroscope.std().Yaxis 
* Freq.BodyGyroscope.std().Zaxis 
* Freq.BodyGyroscope.meanFreq().Xaxis 
* Freq.BodyGyroscope.meanFreq().Yaxis 
* Freq.BodyGyroscope.meanFreq().Zaxis 
* Freq.BodyAccelerometerMagnitude.mean() 
* Freq.BodyAccelerometerMagnitude.std() 
* Freq.BodyAccelerometerMagnitude.meanFreq() 
* Freq.BodyBodyAccelerometerJerkMagnitude.mean() 
* Freq.BodyBodyAccelerometerJerkMagnitude.std() 
* Freq.BodyBodyAccelerometerJerkMagnitude.meanFreq() 
* Freq.BodyBodyGyroscopeMagnitude.mean() 
* Freq.BodyBodyGyroscopeMagnitude.std() 
* Freq.BodyBodyGyroscopeMagnitude.meanFreq() 
* Freq.BodyBodyGyroscopeJerkMagnitude.mean() 
* Freq.BodyBodyGyroscopeJerkMagnitude.std() 
* Freq.BodyBodyGyroscopeJerkMagnitude.meanFreq()