Given dataset (UCI HAR dataset) was obtained from the accelerometer & gyroscope of the Samsung Galaxy smartphones worn by 30 volunteers(Subject_ids)(age range - 19 to 48 years). Each subject performed 6 activities (Activity_Name) as below: 
1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING

The below 33 measurements were obtained from the signals and various variables calculated. Only the mean & standard deviation variables of each of the below measurements has been extracted from the given data. 

tBodyAcc-XYZ, tGravityAcc-XYZ
tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ 
tBodyAccMag, tGravityAccMag
tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ
fBodyAccMag, fBodyAccJerkMag
fBodyGyroMag, fBodyGyroJerkMag

The tidy data set obtained through run_analysis.R comprises of the average values of each measurement's mean & standard deviation corresponding to each subject and each activity. 
The complete list of the 68 variables in the dataset is available in 'variables.txt'

Steps towards transforming given data to tidy data:
----------------------------------------------------
-> training and test data sets merged into single data set.
-> measurements of mean and standard deviation for each measurement extracted.
-> descriptive activity names assigned to the 6 activities in the data set
-> all columns in data set labelled with descriptive variable names.
-> independent tidy data set created with the average of each variable for each activity and each subject.
