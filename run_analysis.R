#Inputs the train and test datasets from UCI HAR
#Merges both dataset into single dataframe (with 10299 observations)
#Selects only measurements of mean and standard deviation into a dataframe and update column names
#Assign activity names to "Activity" factor
#Final dataset is a tidy dataset with the average value of each variable corresponding to each subject_identity and Activity_name


#input the datasets from UCI HAR Dataset folder
test_vars <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="",header = FALSE)
train_vars <- read.csv("UCI HAR Dataset/train/X_train.txt",sep="",header = FALSE)
test_sub <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="",header = FALSE)
train_sub <- read.csv("UCI HAR Dataset/train/subject_train.txt",sep="",header = FALSE)
test_activity <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="",header = FALSE,col.names = "Activity")
train_activity <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="",header = FALSE, col.names = "Activity")
vars_561 <- read.csv("UCI HAR Dataset/features.txt",sep="",header = FALSE)

# Step1: Assign variable names to train and test datasets and merge into single dataset
colnames(train_vars) <- paste(vars_561$V1,vars_561$V2,sep = "-")
colnames(test_vars) <- paste(vars_561$V1,vars_561$V2,sep = "-")
test_df <- test_activity %>% mutate(set = "TEST", Subject_id = test_sub, test_vars)
train_df <- train_activity %>% mutate(set = "TRAIN", Subject_id = train_sub, train_vars)
df_step1 <- rbind(test_df,train_df)

# Step2: Extract only the measurements on the mean and standard deviation for each measurement
to_extract <- grep("mean[^F]|std",colnames(df_step1),value = TRUE)
df_step2 <- select(df_step1,Subject_id, Activity, to_extract)

# Step3: Assign activity names to the 6 activities in the data set
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)
df_step3 <- merge(df_step2,activity_labels, by.x = "Activity", by.y = "V1")

# Step4: Appropriately label the data set with descriptive variable names
# all variable names in lower case; parantheses and hyphens removed
df_step4 <- rename(df_step3, Activity_Name = V2)
l1 <- colnames(df_step4)[3:68]
l1 <- gsub("\\(\\)","",l1)
l1 <- sub("-","_",l1)
l2 <- strsplit(l1,"_")
l3 <- sapply(l2,function(x){x[2]})
l3 <- gsub("-","_",l3)
l3 <- tolower(l3)
colnames(df_step4)[3:68] <- l3

# Step5: create independent tidy data set with the average of each variable for each activity and each subject
df_step5 <- df_step4 %>% 
      select(Activity_Name, Subject_id:fbodybodygyrojerkmag_std) %>% 
      group_by(Activity_Name,Subject_id) %>% 
      summarize_at(vars(tbodyacc_mean_x:fbodybodygyrojerkmag_std),funs(mean))
newnames <- paste("Avg of",colnames(df_step5[3:68]))
colnames(df_step5)[2] <- "Subject_identity"
colnames(df_step5)[3:68] <- newnames
