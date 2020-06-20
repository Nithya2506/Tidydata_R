# Tidydata_R
Cleaning data set using R

Summary of the given dataset: 
Given dataset was obtained from an experiment conducted on 30 subjects(age range 19 to 48 years). Each subject performed 6 activities - Walking, Sitting, Laying, Standing, Walking Downstairs & Walking Upstairs, while wearing Samsung Galaxy S Smartphone on waist. The dataset had 2 sets, training set (70% of subjects) and test set (30% subjects). 561 variables were calculated from the various signals obtained from the devices in said experiment. 

Summary of transformation to tidy data:
The test and training sets were merged into single dataset. Only the mean and standard deviation of each measurement was extracted.
Activity (1 to 6) were given assigned Activity_names. All columns of the dataframe were labelled and tidied accordingly. Final dataset comprises of the average values of each measurement's mean & standard deviation corresponding to each subject and each activity. 
