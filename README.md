# GACDProject
Getting and Cleaning Data Final Project
Steve Whetstone

run_analysis.R  R-Script on Human Activity Recognition using Smartphones dataset

The script called run_analysis.R will perform the following tasks:

Merge the training and the test sets to create one data set.
Extract only the measurements on the mean and standard deviation for each measurement.
Use descriptive activity names to name the activities in the data set
Appropriately label the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set (tidy_data.txt)
with the average of each variable for each activity and each subject.

To run, make certain you place the data set inthe working directory.
My dataset was in a folder titled "UCI HAR Dataset" and had the existing folder structures
under that.

 The data linked to from the course website represent data collected from the 
 accelerometers from the Samsung Galaxy S smartphone. A full description is available at 
 the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

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

The following files are available for the train and test data. Their descriptions are 
equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity 
for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the 
smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 
element vector. The same description applies for the 'total_acc_x_train.txt' and 
'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by 
subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by 
the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

License:
========
Use of this dataset in publications must be acknowledged by referencing the following 
publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be 
addressed to the authors or their institutions for its use or misuse. Any commercial use 
is prohibited.
