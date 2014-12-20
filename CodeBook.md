#Getting and Cleaning Data Course Project

## The original data set
30 volunteers do 6 different activities while wearing a smartphone (Samsung Galaxy S II) on the waist. The smartphone captured various data about their movements.
The original data set is split into training and test sets (70% and 30%, respectively) where each partition is also split into three files that contain: measurements from the accelerometer and gyroscope, activity label, identifier of the subject.

### Explanation of each file

features.txt: Names of the 561 features.
activity_labels.txt: Names and IDs for each of the 6 activities.

X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

More information about the files is available in README.txt. More information about the features is available in features_info.txt.

## Script run_analysis.R

1. At first we have switch on all libraries that uses later. Then download and unzip file to Data directory. 

2. Data files appears in different directories (train and test) in Data directory so I use paste() function to define path to each file when load files to data frames. 

3. Import lables, features from activity_labels.txt and features.txt files 

4. Make logical vector with mean & std set to TRUE for extract only the measurements on the mean and standard deviation for each measurement.

5. Load and subset X_test & y_test data. Combine data frames from each directory with cbind () function.

6. Merge training and test observations with cbind () functions. Add dewscriptive labels of activities.

7. Create tidy data set with the average of each variable for each activity and each subject.

To run cleaning procedure, call run_analysis function.