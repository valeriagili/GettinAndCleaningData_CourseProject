---
title: "Getting and Cleaning Data Course Project - CodeBook"
author: "Valeria Lucia Gili"
date: "November 20th, 2015"
---

## Project Description

The purpose of this project to show some procedures to get, work with and clean a dataset.
Raw data come from a human activity recognition experiment using smartphones to collect information.

Acceleration and angular velocity data are collected for a set of 30 volunteers wearing a smartphone and performing everyday activities.

This projects requires to:

1. merge the relevant measurment tables into a single dataset (see later for what relevant means in this case)

2. for each measurement, extract only data about mean and standard deviation

3. assign descriptive activity names

4. label the dataset with descriptive variable names

5. creates a second, independent, tidy dataset with the average of each variable for each activity and subject 


##Study design and data processing

###Collection of the raw data

Raw data to use for this project come from a series of experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Data were computed starting from a serie of features collected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were elaborated to filter out noise and separate the contribution of gravity acceleration. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate the following variables of the feature vector for each pattern: mean mean(), standard deviation std(), median absolute deviation mad(), Largest value in array max(), smallest value in array min(), signal magnitude area sma(), energy measure energy(), interquartile range iqr(), signal entropy entropy(), autorregresion coefficients arCoeff(), correlation coefficient between two signals correlation(), index of the frequency component with largest magnitude maxInds(), weighted average of the frequency components to obtain a mean frequency meanFreq(), skewness of the frequency domain signal skewness(), kurtosis of the frequency domain signal kurtosis(), energy of a frequency interval within the 64 bins of the FFT of each window bandsEnergy(), angle between to vectors angle(). Additional vectors were obtained by averaging the signals in a signal window sample: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean. These are used on the angle() variable.

For this project we can ignore the original (inertial) signal and just focus on the estimated features.


###Notes on the original (raw) data 

- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). 
- The gyroscope units are rad/seg. 
- Features are normalized and bounded within [-1,1], thus they are dimensionless.

##Creating the tidy datafile

###Guide to create the tidy data file

Tidy datafile was created by (please refer to the README.md file for a detailed description of the code):

1. downloading the data and reading relevant train and test tables into R 

2. merging the dataframes to create a single dataframe (of 10299 observables of 563 variables, namely subject performing the activity, activity performed, and features)

3. subsetting the dataframe to select only data about mean and standard deviation of the original acceleration and angular velocity signals.

4. cleaning the variable "Activity" replacing the activity labels with human readable names as listed in activity_labels .txt

5. cleaning the variable names making them fit the convention where a period is used as separator between words, and each word is capitalized.

6. generating a second, tidy dataset named "averaged_HAR" by replacing each variable with its average computed for each group and each activity.

7. writing the tidy dataset into a tidy_table.txt file. 


##Description of the variables in the tidy_table.txt file

The tidy_table.txt file  contains 180 observables (30 subjects, each performing 6 different activities) of 68 variables, namely the subject performing the activity, the activity performed, plus the average of 66 feature estimates either of mean or of standard deviation on the original signal computed for each activity and for each individual.

A detailed variable description follows:

###Subject

- Label identifying which subject performed the given activity

- Integer numerical variable varying from 1 to 30.
 
- Dimensionless

###Activity

- Activity performed

- Char. string assuming one out of the six following values: "Walking", "Walking Upstairs", "Walking Downstairs","Sitting", "Standing", "Laying".

###Averaged.Time.Dom.Body.Acc.mean().X

- Average of the means for each activity and subject of the X component of body acceleration in time domain.

- Dimensionless (see discussion above) numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.mean().Y

- Average of the means for each activity and subject of the Y component of body acceleration in time domain.

- Dimensionless (see discussion above) numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.mean().Z

- Average of the means for each activity and subject of the Z component of body acceleration in time domain.

- Dimensionless (see discussion above) numerical variable bounded within [-1,1].

###Averaged.Time.Dom.Body.Acc.std().X

- Average of the standard deviations for each activity and subject of the X component of body acceleration in time domain.

- Dimensionless (see discussion above) numerical variable bounded within [-1,1].


###Averaged.Time.Dom.Body.Acc.std().Y

###Averaged.Time.Dom.Body.Acc.std().Z

###Averaged.Time.Dom.Gravity.Acc.mean().X

###Averaged.Time.Dom.Gravity.Acc.mean().Y

###Averaged.Time.Dom.Gravity.Acc.mean().Z

###Averaged.Time.Dom.Gravity.Acc.std().X

###Averaged.Time.Dom.Gravity.Acc.std().Y

###Averaged.Time.Dom.Gravity.Acc.std().Z

###Averaged.Time.Dom.Body.Acc.Jerk.mean().X          : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 $ Averaged.Time.Dom.Body.Acc.Jerk.mean().Y          : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 $ Averaged.Time.Dom.Body.Acc.Jerk.mean().Z          : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 $ Averaged.Time.Dom.Body.Acc.Jerk.std().X           : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ Averaged.Time.Dom.Body.Acc.Jerk.std().Y           : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ Averaged.Time.Dom.Body.Acc.Jerk.std().Z           : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.mean().X       : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.mean().Y       : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.mean().Z       : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.std().X        : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.std().Y        : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.std().Z        : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.mean().X  : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.mean().Y  : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.mean().Z  : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.std().X   : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.std().Y   : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.std().Z   : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ Averaged.Time.Dom.Body.Acc.Mag.mean()             : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ Averaged.Time.Dom.Body.Acc.Mag.std()              : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ Averaged.Time.Dom.Gravity.Acc.Mag.mean()          : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ Averaged.Time.Dom.Gravity.Acc.Mag.std()           : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ Averaged.Time.Dom.Body.Acc.Jerk.Mag.mean()        : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ Averaged.Time.Dom.Body.Acc.Jerk.Mag.std()         : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Mag.mean()     : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Mag.std()      : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.Mag.mean(): num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ Averaged.Time.Dom.Body.Angular.Vel.Jerk.Mag.std() : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ Averaged.Freq.Dom.Body.Acc.mean().X               : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 $ Averaged.Freq.Dom.Body.Acc.mean().Y               : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 $ Averaged.Freq.Dom.Body.Acc.mean().Z               : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ Averaged.Freq.Dom.Body.Acc.std().X                : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 $ Averaged.Freq.Dom.Body.Acc.std().Y                : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ Averaged.Freq.Dom.Body.Acc.std().Z                : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.mean().X          : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.mean().Y          : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.mean().Z          : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.std().X           : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.std().Y           : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.std().Z           : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.mean().X       : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.mean().Y       : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.mean().Z       : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.std().X        : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.std().Y        : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.std().Z        : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ Averaged.Freq.Dom.Body.Acc.Mag.mean()             : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ Averaged.Freq.Dom.Body.Acc.Mag.std()              : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.Mag.mean()        : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ Averaged.Freq.Dom.Body.Acc.Jerk.Mag.std()         : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.Mag.mean()     : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.Mag.std()      : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.Jerk.Mag.mean(): num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ Averaged.Freq.Dom.Body.Angular.Vel.Jerk.Mag.std() 

