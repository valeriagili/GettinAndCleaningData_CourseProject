---
Title: "Getting and Cleaning Data Course Project - README"
Author: "Valeria Lucia Gili"
Date: "November 20th, 2015"
---


# Description of raw data


Raw data to use for this project comes from a series of experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, this experiment's authors captured 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset was then randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Authors started from a serie of features collected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were elaborated to filter out noise and separate the contribution of gravity acceleration. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate the following variables of the feature vector for each pattern: mean mean(), standard deviation std(), median absolute deviation mad(), Largest value in array max(), smallest value in array min(), signal magnitude area sma(), energy measure energy(), interquartile range iqr(), signal entropy entropy(), autorregresion coefficients arCoeff(), correlation coefficient between two signals correlation(), index of the frequency component with largest magnitude maxInds(), weighted average of the frequency components to obtain a mean frequency meanFreq(), skewness of the frequency domain signal skewness(), kurtosis of the frequency domain signal kurtosis(), energy of a frequency interval within the 64 bins of the FFT of each window bandsEnergy(), angle between to vectors angle(). Additional vectors were obtained by averaging the signals in a signal window sample: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean. These are used on the angle() variable.

For the sake of this project we can ignore the original (inertial) signal and just focus on the estimated features. Files relevant to us are then:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training data set, with 7352 rows, each corresponding to a 561-dim. feature vector associated to a given subject doing a given activity.

- 'train/subject_train.txt': Each of 7352 rows identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/y_train.txt': 7352 single valued rows, each indicating the label corresponing to the activity performed in each observation.

- 'test/X_test.txt': Test data set, with 2947 rows, row corresponding to a 561-dim. feature vector associated to a given subject doing a given activity.

- 'test/subject_test.txt': Each of 2947 row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/y_test.txt': 2947 single valued rows, each indicating the label corresponing to the activity performed in each observation.


# Instructions

The script requires the package dplyr to be installed on the computer.

To run the script and start the analysis, use setwd to set the working directory to be the directory containing the script, then source the script into R with 
> source("analysis_run.R")

The script will first check if the data is already present. If not, it will first download it in the same directory, then start the analysis.

Once finished, you will find in the working directory a text file named "tidy_table.txt" containing the average of each measurement of mean and standard deviation, computed for each activity and each subject (see the file CodeBook.md for a detailed description of variables).

To read the data into R use read.table with header=TRUE:
> data <- read.table("./tidy_table.txt", header=TRUE)
> View(data)

# Detailed procedure

The script runs through the following steps:

* It checks if the human activity recognition data is already present. If not, it downloads it and put it in a folder named "UCI HAR Dataset" within the current working directory.

* It loads the relevant data into R: it reads files 'test/subject_test.txt', 'test/y_test.txt', and 'test/X_test.txt' for the test group and 'train/subject_train.txt', 'train/y_train.txt', and 'traint/X_train.txt' for the training group, creating for both groups three datasets containing respectively 2947 and 7352 observations of subject (1 variable), activity performed (1 variable), and estimated features (561 variables).

* It extracts from the file features.txt the names of the 561 estimated features, and it saves them in a vector named "features".

* It merges by column the three test dataframe into a single dataframe named "test", placing first the subject performing the activity, then the activity performed and finally the features; variable names are set to "Subject", "Activity", and to features as listed in vector "features". The resulting dataframe will then contain 2947 observations of 563 variables.

* It merges by column the three train dataframe into a single dataframe named "train", placing first the subject performing the activity, then the activity performed and finally the features; variable names are set to "Subject", "Activity", and to features as in vector "features". The resulting dataframe will then contain 7352 observations of 563 variables.

* It merges by row the training and the test dataset to create a unique human activity recognition dataframe named "har_data", which will then contain 10299 observation of 563 variables.

* It creates a vector named "columns" listing the indexes of the features vector associated to measurments of mean and standard deviation. Relevant features are choosen by selecting those names explicitly containing either the expression "mean()" or the expression "std()" (with parentesis), meaning that that feature was obtained computing the mean or the standard deviation of previous measurements. All names including just "mean" or "std" (without parenthesis) are excluded because they are not a mean or a standard deviation of other quantities, but further estimates computed from them.

* It uses the vector just created to subset the "har_data" dataframe to generate a "mean_std_data" dataframe including just measurements of mean and standard deviation of previous measurements. The "+2" takes into account that the variables listed in the first and second column in the data frame are respectively the subject performing the activity and the activity performed.

* For the variable "Activity", it replaces the activity numbers with descriptive activity names using the map provided in activity_labels.txt.

* It cleans the variable names making them fit the convention where a period is used as separator between words, and each word is capitalized.

* It generates a second, tidy dataset named "tidy_averaged_data" by replacing each variable with its average computed for each group and each activity. To achieve this result, the "mean_std_data" dataframe is first passed via the "pipeline"-operator %>% to group_by("Activity", "Subject") which groups the observation based on the activity performed and the subject performing the activity, then to summarize_each(funs(mean)) which summarizes the data in each group by computing their mean. Variable names are then accordingly changed to reflect the last operation.

* It writes the tidy dataset "tidy_averaged_data" to a file named "tidy_table.txt" using row.names = FALSE.


## Remarks

The final tidy dataset created by the script is of the wide kind as it contains 180 observables (30 subjects, each performing 6 different activities) of 68 variables, namely the subject performing the activity, the activity performed, plus the average of 66 measurements of mean or of standard deviation. 

It satisfies the criteria for a tidy dataset because:

- each variable that has been measures is contained in one column;

- each observation for that variable is contained in one row;

- variable names are in a human readable form.
