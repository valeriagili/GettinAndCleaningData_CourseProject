## loading packages
library(dplyr)


## Download and unzip data
        if(!file.exists("./UCI HAR Dataset/")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,"UCI HAR Dataset.zip", method="curl")
        unzip("./UCI HAR Dataset.zip")        }


##Load data into R

subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train  <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")


## extract feature names from features.txt
featnames_data  <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
names(featnames_data) <- c("Num.Label", "Feature")
features <- featnames_data$Feature

## merge by column the three test dataframe by column 
test  <- cbind(subject_test,y_test,X_test)
names(test) <- c("Subject", "Activity", features)

## merge by column the three train dataframe
train  <- cbind(subject_train,y_train,X_train)
names(train) <- c("Subject", "Activity", features)

## merge by row the training and the test data to create a single data set named har_data
har_data  <- rbind(train, test)

## create a vector listing the indexes associated to measurments of mean and standard deviation  
columns <- sort(c(grep("mean\\(\\)", featnames_data$Feature, value = FALSE), 
                  grep("std\\(\\)", featnames_data$Feature, value = FALSE)))

## subset the dataframe to include just mean + standard deviation data
mean_std_data <- har_data[,c(1,2,columns+2)]

## change the activity numbers into descriptive activity names
mean_std_data$Activity <- gsub("1","Walking",as.character(mean_std_data$Activity))
mean_std_data$Activity <- gsub("2","Walking Upstairs",as.character(mean_std_data$Activity))
mean_std_data$Activity <- gsub("3","Walking Downstairs",as.character(mean_std_data$Activity))
mean_std_data$Activity <- gsub("4","Sitting",as.character(mean_std_data$Activity))
mean_std_data$Activity <- gsub("5","Standing",as.character(mean_std_data$Activity))
mean_std_data$Activity <- gsub("6","Laying",as.character(mean_std_data$Activity))

## cleaning variable names
 colnames(mean_std_data) <- gsub("BodyBody","Body",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("\\-","\\.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("tBody","Time.Dom.Body.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("tGravity","Time.Dom.Gravity.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("fBody","Freq.Dom.Body.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("fGravity","Freq.Dom.Gravity.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("Gyro","Angular.Vel.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("Jerk","Jerk.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("Acc","Acc.",colnames(mean_std_data))
 colnames(mean_std_data) <- gsub("\\.\\.","\\.",colnames(mean_std_data))

## creating tidy averaged dataframe
averaged_HAR <- mean_std_data %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
colnames(averaged_HAR)[3:68] <- paste("Averaged", colnames(averaged_HAR)[3:68], sep = ".")
 
## write the tidy dataset to a file
write.table(averaged_HAR, file ="./tidy_table.txt", row.names = FALSE)

