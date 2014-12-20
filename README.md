# Getting and Cleaning Data Course Project

### Overview

This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis. The source data for this project can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Project Summary
Function run_analysis() does the following: 
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output of the R script is a tidy data set, tidy_data.txt

### Additional Information

You can find additional information about the variables, data and transformations in the CodeBook.MD file.