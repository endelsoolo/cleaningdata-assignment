## Codebook

This is a re-formating script for the data of a Human Activity Recognition study.

## Data source

The study:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data content:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- An identifier of the subject who carried out the experiment.
- Its activity label. 

## Transformations

The following transformation steps were applied on the data:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Replace activity numbers with descriptive activity names
4. Edit data labels to make them descriptive and human readable.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
