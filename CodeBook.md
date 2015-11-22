---
title: "Getting and Cleaning Data Course Project - CodeBook"
author: "Valeria Lucia Gili"
date: "November 20th, 2015"
---

## Project Description

The purpose of this project to show some procedures to get, work with and clean a dataset.
Raw data sets come from a human activity recognition experiment using smartphones to collect data.

Acceleration and angular velocity data are collected for a set of 30 volunteers wearing a smartphone and performing everyday activities.

This projects requires to:

1. merge the relevant measurment tables into a single dataset (see later for what relevant means in this case)

2. for each measurement, extract only data about mean and standard deviation

3. assign descriptive activity names

4. label the dataset with descriptive variable names

5. creates a second, independent, tidy dataset with the average of each variable for each activity and subject 


##Study design and data processing

###Collection of the raw data
Description of how the data was collected.

###Notes on the original (raw) data 
Some additional notes (if avaialble, otherwise you can leave this section out).

##Creating the tidy datafile

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
<!-- creating tidy averaged dataframe - take 2
  melted  <- melt(mean_std_data, id.vars = c("Subject", "Activity"))
  grouped  <- group_by(melted, Subject, Activity, variable)
  averaged_HAR <-summarise(grouped, Average=mean(value))
  -->
