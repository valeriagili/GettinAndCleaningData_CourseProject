---
title: "Getting and Cleaning Data Course Project - CodeBook"
author: "Valeria Lucia Gili"
date: "November 20th, 2015"
---

## Project Description

The purpose of this project is to show some procedures to get, work with and clean a dataset.


Here raw data come from a human activity recognition experiment using smartphones to collect information.

This projects requires to:

1. merge the relevant measurement tables into a single dataset (see later for what does relevant mean in this case)

2. for each measurement, extract only data about mean and standard deviation

3. assign descriptive activity names

4. label the dataset with descriptive variable names

5. creates a second, independent, tidy dataset with the average of each variable for each activity and subject 


##Study design and data processing

###Collection of the raw data

Raw data to use for this project come from a series of experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Data were computed starting from a serie of features collected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were elaborated to filter out noise and separate the contribution of gravity acceleration. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate a series of features listed in file feature.txt and which are described in the file features_info.txt, both attached to the original dataset.

For the sake of this project we can ignore the original (inertial) signal and just focus on the estimated features.


###Notes on the original (raw) data 

- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). 
- The gyroscope units are rad/seg. 
- Features are normalized and bounded within [-1,1].
- The normalization procedure implies that each dimensionful quantity is divided by another quantity with the same units. This makes the features dimensionless.

##Guide to create the tidy datafile

Tidy datafile was created by (please refer to the README.md file for a detailed description of the code):

1. downloading the data and reading relevant train and test tables into R 

2. merging the dataframes to create a single dataframe (of 10299 observables of 563 variables, namely subject performing the activity, activity performed, and features)

3. subsetting the dataframe to select only data about mean and standard deviation of the original acceleration and angular velocity signals.

4. cleaning the variable "Activity" replacing the activity labels with human readable names as listed in activity_labels .txt

5. cleaning the variable names making them fit the convention where a period is used as separator between words, and each word is capitalized.

6. generating a second, tidy dataset named "tidy_averaged_data" by replacing each variable with its average computed for each group and each activity.

7. writing the tidy dataset into a tidy_table.txt file. 


##Description of the variables in the tidy_table.txt file

The tidy_table.txt file contains 180 observables (30 subjects, each performing 6 different activities) of 68 variables, namely the subject performing the activity, the activity performed, plus the average of 66 feature estimates either of mean or of standard deviation on the original signal computed for each activity and for each individual.

Since the features estimated in the original dataset were pure numbers (dimensionless), also their averages will be dimensionless numbers.

A detailed variable description follows:

###Subject

- Label identifying which subject performed the given activity

- Integer numerical variable varying from 1 to 30.
 
- Dimensionless

###Activity

- Activity performed

- Char. string assuming one out of the six following values: "Walking", "Walking Upstairs", "Walking Downstairs","Sitting", "Standing", "Laying".

###Averaged.Time.Dom.Body.Acc.mean().X

- Average for each activity and subject of the mean of the X component of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.mean().Y

- Average for each activity and subject of the mean of the Y component of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.mean().Z

- Average for each activity and subject of the mean of the Z component of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.std().X

- Average for each activity and subject of the standard deviation of the X component of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Acc.std().Y

- Average for each activity and subject of the standard deviation of the Y component of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.std().Z

- Average for each activity and subject of the standard deviation of the Y component of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Gravity.Acc.mean().X

- Average for each activity and subject of the mean of the X component of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Gravity.Acc.mean().Y

- Average for each activity and subject of the mean of the Y component of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Gravity.Acc.mean().Z

- Average for each activity and subject of the mean of the Z component of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Gravity.Acc.std().X

- Average for each activity and subject of the standard deviation of the X component of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Gravity.Acc.std().Y

- Average for each activity and subject of the standard deviation of the Y component of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Gravity.Acc.std().Z

- Average for each activity and subject of the standard deviation of the Z component of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Acc.Jerk.mean().X

- Average for each activity and subject of the mean of the X component of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Jerk.mean().Y

- Average for each activity and subject of the mean of the Y component of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Jerk.mean().Z

- Average for each activity and subject of the mean of the Z component of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Jerk.std().X

- Average for each activity and subject of the standard deviation of the X component of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Jerk.std().Y

- Average for each activity and subject of the standard deviation of the Y component of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Acc.Jerk.std().Z

- Average for each activity and subject of the standard deviation of the Z component of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Angular.Vel.mean().X

- Average for each activity and subject of the mean of the X component of body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.mean().Y

- Average for each activity and subject of the mean of the Y component of body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.mean().Z

- Average for each activity and subject of the mean of the Z component of body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.std().X

- Average for each activity and subject of the standard deviation of the X component of body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.std().Y

- Average for each activity and subject of the standard deviation of the Y component of body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.std().Z

- Average for each activity and subject of the standard deviation of the Z component of body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.Jerk.mean().X

- Average for each activity and subject of the mean of the X component of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.Jerk.mean().Y

- Average for each activity and subject of the mean of the Y component of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.Jerk.mean().Z

- Average for each activity and subject of the mean of the Z component of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.Jerk.std().X

- Average for each activity and subject of the standard deviation of the X component of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.Jerk.std().Y

- Average for each activity and subject of the standard deviation of the Y component of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.Jerk.std().Z

- Average for each activity and subject of the standard deviation of the Z component of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Mag.std()

- Average for each activity and subject of the standard deviation of the magnitude of body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Gravity.Acc.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Gravity.Acc.Mag.std()

- Average for each activity and subject of the standard deviation of the magnitude of gravity acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Jerk.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.Jerk.Mag.std()

- Average for each activity and subject of the standard deviation of the magnitude of the Jerk signal for body acceleration in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Angular.Vel.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of the body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Angular.Vel.Mag.std()

- Average for each activity and subject of the standard deviations of the magnitude of the body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Angular.Vel.Jerk.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Angular.Vel.Jerk.Mag.std()

- Average for each activity and subject of the standard deviation of the magnitude of the Jerk signal for body angular velocity in time domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.mean().X

- Average for each activity and subject of the mean of the X component of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.mean().Y

- Average for each activity and subject of the mean of the Y component of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.mean().Z

- Average for each activity and subject of the mean of the Z component of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.std().X

- Average for each activity and subject of the standard deviation of the X component of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.std().Y

- Average for each activity and subject of the standard deviation of the Y component of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.std().Z

- Average for each activity and subject of the standard deviation of the Z component of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.Jerk.mean().X

- Average for each activity and subject of the mean of the X component of the Jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.Jerk.mean().Y

- Average for each activity and subject of the mean of the Y component of the Jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Acc.Jerk.mean().Z

- Average for each activity and subject of the mean of the Z component of the Jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Acc.Jerk.std().X

- Average for each activity and subject of the standard deviation of the X component of the Jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.Jerk.std().Y

- Average for each activity and subject of the standard deviation of the Y component of the Jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.Jerk.std().Z

- Average for each activity and subject of the standard deviation of the Z component of the Jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Angular.Vel.mean().X

- Average for each activity and subject of the mean of the X component of body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Angular.Vel.mean().Y

- Average for each activity and subject of the mean of the Y component of body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Angular.Vel.mean().Z

- Average for each activity and subject of the mean of the Z component of body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Angular.Vel.std().X

- Average for each activity and subject of the standard deviation of the X component of body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Angular.Vel.std().Y

- Average for each activity and subject of the standard deviation of the Y component of body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Angular.Vel.std().Z

- Average for each activity and subject of the standard deviation of the Z component of body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Acc.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.Mag.std()

- Average for each activity and subject of the standard deviation of the magnitude of body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.Jerk.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of the jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Acc.Jerk.Mag.std()

- Average for each activity and subject of the standard deviation of the magnitude of the jerk signal for body acceleration in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Angular.Vel.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of the body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

###Averaged.Freq.Dom.Body.Angular.Vel.Mag.std()

- Average for each activity and subject of the standard deviation of the magnitude of the body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Angular.Vel.Jerk.Mag.mean()

- Average for each activity and subject of the mean of the magnitude of the Jerk signal for body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].


###Averaged.Freq.Dom.Body.Angular.Vel.Jerk.Mag.std() 

- Average for each activity and subject of the standard deviation of the magnitude of the Jerk signal for body angular velocity in frequency domain.

- Dimensionless (see discussion above) real numerical variable bounded within [-1,1].

