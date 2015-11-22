---
title: "Getting and Cleaning Data Course Project - README"
author: "Valeria Lucia Gili"
date: "November 20th, 2015"
---


# Row Data


# Instructions

The script requires the package dplyr to be installed on the computer. To run the analysis, download the script, then set the working directory to the directory containing the script.

To run the script and start the analysis, use setwd to set the working directory to be the directory containing the script, then source the script into R with source("analysis_run.R")

The script will first check if the data is already present. If not, it will first download it in the same directory, then start the analysis.

Once finished, you will find in the working directory a text file named "tidy_data.txt" containing the average of each measurement of mean and standard deviation, computed for each activity and each subject (see the file CodeBook.md for a detailed description of the variables).

To read the data into R use read.table with header=TRUE:
read.table("./tidy_table.txt", header=TRUE)


# Detailed procedure

The script runs through the following steps:

* it checks if the human activity recognition data is already present. If not, it downloads it and put it in a folder named "UCI HAR Dataset" within the current working directory.

* It loads the relevant data into R: it creates for both the test and train group three datasets containing respectively 2947 and 7352 observations of subject (1 variable), activity performed (1 variable), and estimated features (561 variables).

* It extracts from the file features.txt the names of the 561 estimated features, and it saves them in a vector named "features"."

* It merges by column the three test dataframe into a single dataframe named "test", placing first the subject performing the activity, then the activity performed and finally the features; variable names are set to "Subject", "Activity", and to features as listed in vector "features".

* It merges by column the three train dataframe into a single dataframe named "train", placing first the subject performing the activity, then the activity performed and finally the features; variable names are set to "Subject", "Activity", and to features as in vector "features".

* It merges by row the training and the test dataset to create a unique human activity recognition dataframe named "har_data".

* It creates a vector named "columns" listing the indexes of the features vector associated to measurments of mean and standard deviation. Relevant features are choosen by selecting those names explicitly containing either the expression "mean()" or the expression "std()" (with parentesis), meaning that that feature was obtained computing the mean or the standard deviation of previous measurements. All names including just "mean" or "std" (without parenthesis) are excluded because they are not a mean or a standard deviation of other quantities, but further estimates computed from them.

* It uses the vector just created to subset the "har_data" dataframe to generate a "mean_std_data" dataframe including just measurements of mean and standard deviation of previous measurements. The "+2" takes into account that the variables listed in the first and second column in the data frame are respectively the subject performing the activity and the activity performed.

* For the variable "Activity", it replaces the activity numbers with descriptive activity names using the map provided in activity_labels.txt.

* It cleans the variable names making them fit the convention where a period is used as separator between words, and each word is capitalized.

* It generates a second, tidy dataset named "averaged_HAR" by replacing each variable with its average computed for each group and each activity. To achieve this result, the "mean_std_data" dataframe is first passed via the "pipeline"-operator %>% to group_by("Activity", "Subject") which groups the observation based on the activity performed and the subject performing the activity, then to summarize_each(funs(mean)) which summarize the data in each group by computing their mean. Variable names are then accordingly changed to reflect the last operation.

* It writes the tidy dataset "averaged_HAR" to a file named "tidy_table.txt" using row.names = FALSE.


## Remarks

The last dataset created contains 180 observables (30 subjects, each performing 6 different activities) of 68 variables, namely the subject performing the activity, the activity performed, plus the average of 66 measurements of mean or of standard deviation. It satisfies the criteria for a tidy dataset because 
