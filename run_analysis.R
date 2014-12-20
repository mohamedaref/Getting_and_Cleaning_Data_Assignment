# load needed library
library(dplyr)
library(reshape2)

# Loading  the activity label file, the lookup data for activity labels.

#activity_labels <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"")
activity_labels <- read.table("./Samsung data/activity_labels.txt", quote="\"")
colnames(activity_labels)[1] <- "activity_label_ID"
colnames(activity_labels)[2] <- "activity_label_Name"

# load features file 

#features <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"")
features <- read.table("./Samsung data/features.txt", quote="\"")
colnames(features)[1] <- "feature_id"
colnames(features)[2] <- "feature_name"

# Loading the training files into different data frames and merge them into one training df

# load the files that is containing the subject id

#subject_train <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", stringsAsFactors=FALSE)
subject_train <- read.table("./Samsung data/train/subject_train.txt", quote="\"", stringsAsFactors=FALSE)
colnames(subject_train)[1] <- "subject_ID"

# load the file that is having activity labels from 1 to 6

#activity_y_train <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"", stringsAsFactors=FALSE)
activity_y_train <- read.table("./Samsung data/train/y_train.txt", quote="\"", stringsAsFactors=FALSE)

colnames(activity_y_train)[1] <- "activity_label_ID" # rename first column name

# load the actual data of 561 column ( functions in features file)

#X_train <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"", stringsAsFactors=FALSE)
X_train <- read.table("./Samsung data/train/X_train.txt", quote="\"", stringsAsFactors=FALSE)

# create final train data set 

temp_df <- cbind(subject_train , activity_y_train)
final_train_df <- cbind(temp_df,X_train)
final_train_df$flag <- "Traing_dataset" # identify the training dataset through flag


# Loading the testing files into different data frames and merge them into one testing df

# load the files that is containing the subject id

#subject_test <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", stringsAsFactors=FALSE)
subject_test <- read.table("./Samsung data/test/subject_test.txt", quote="\"", stringsAsFactors=FALSE)

colnames(subject_test)[1] <- "subject_ID"

# load the file that is having activity labels from 1 to 6

#activity_y_test <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", stringsAsFactors=FALSE)
activity_y_test <- read.table("./Samsung data/test/y_test.txt", quote="\"", stringsAsFactors=FALSE)

colnames(activity_y_test)[1] <- "activity_label_ID"

# load the actual data with 561 column ( functions in features file)

#X_test <- read.table("D:/Data Science Track/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", stringsAsFactors=FALSE)
X_test <- read.table("./Samsung data/test/X_test.txt", quote="\"", stringsAsFactors=FALSE)

# create final test data set 

temp_df <- cbind(subject_test , activity_y_test)
final_test_df <- cbind(temp_df,X_test)
final_test_df$flag <- "test_dataset" # identify the testing dataset through flag


# merge the two datasets (training and testing based on subject_ID)

# answer of point 1
# complete merge without any filteration
final_df <- rbind(final_train_df,final_test_df) 


## select any feature with mean or std , length is 79
mean_std_col_name <- features[grep("mean|std",features$feature_name),] 

# change the column name of mean_std_col_name to be more readable

mean_std_col_name$feature_name <- 
c("(Time)_Body_Acceleration_Mean_X",
  "(Time)_Body_Acceleration_Mean_Y",
  "(Time)_Body_Acceleration_Mean_Z",
  "(Time)_Body_Acceleration_Standard_Deviation_X",
  "(Time)_Body_Acceleration_Standard_Deviation_Y",
  "(Time)_Body_Acceleration_Standard_Deviation_Z",
  "(Time)_Gravity_Acceleration_Mean_X",
  "(Time)_Gravity_Acceleration_Mean_Y",
  "(Time)_Gravity_Acceleration_Mean_Z",
  "(Time)_Gravity_Acceleration_Standard_Deviation_X",
  "(Time)_Gravity_Acceleration_Standard_Deviation_Y",
  "(Time)_Gravity_Acceleration_Standard_Deviation_Z",
  "(Time)_Body_Acceleration_Jerk_Mean_X",
  "(Time)_Body_Acceleration_Jerk_Mean_Y",
  "(Time)_Body_Acceleration_Jerk_Mean_Z",
  "(Time)_Body_Acceleration_Jerk_Standard_Deviation_X",
  "(Time)_Body_Acceleration_Jerk_Standard_Deviation_Y",
  "(Time)_Body_Acceleration_Jerk_Standard_Deviation_Z",
  "(Time)_Body_Gyroscope_Mean_X",
  "(Time)_Body_Gyroscope_Mean_Y",
  "(Time)_Body_Gyroscope_Mean_Z",
  "(Time)_Body_Gyroscope_Standard_Deviation_X",
  "(Time)_Body_Gyroscope_Standard_Deviation_Y",
  "(Time)_Body_Gyroscope_Standard_Deviation_Z",
  "(Time)_Body_Gyroscope_Jerk_Mean_X",
  "(Time)_Body_Gyroscope_Jerk_Mean_Y",
  "(Time)_Body_Gyroscope_Jerk_Mean_Z",
  "(Time)_Body_Gyroscope_Jerk_Standard_Deviation_X",
  "(Time)_Body_Gyroscope_Jerk_Standard_Deviation_Y",
  "(Time)_Body_Gyroscope_Jerk_Standard_Deviation_Z",
  "(Time)_Body_Acceleration_Magnitude_Mean",
  "(Time)_Body_Acceleration_Magnitude_Standard_Deviation",
  "(Time)_Gravity_Acceleration_Magnitude_Mean",
  "(Time)_Gravity_Acceleration_Magnitude_Standard_Deviation",
  "(Time)_Body_Acceleration_Jerk_Magnitude_Mean",
  "(Time)_Body_Acceleration_Jerk_Magnitude_Standard_Deviation",
  "(Time)_Body_Gyroscope_Magnitude_Mean",
  "(Time)_Body_Gyroscope_Magnitude_Standard_Deviation",
  "(Time)_Body_Gyroscope_Jerk_Magnitude_Mean",
  "(Time)_Body_Gyroscope_Jerk_Magnitude_Standard_Deviation",
  "(Frequency)_Body_Acceleration_Mean_X",
  "(Frequency)_Body_Acceleration_Mean_Y",
  "(Frequency)_Body_Acceleration_Mean_Z",
  "(Frequency)_Body_Acceleration_Standard_Deviation_X",
  "(Frequency)_Body_Acceleration_Standard_Deviation_Y",
  "(Frequency)_Body_Acceleration_Standard_Deviation_Z",
  "(Frequency)_Body_Acceleration_Mean_Frequency_X",
  "(Frequency)_Body_Acceleration_Mean_Frequency_Y",
  "(Frequency)_Body_Acceleration_Mean_Frequency_Z",
  "(Frequency)_Body_Acceleration_Jerk_Mean_X",
  "(Frequency)_Body_Acceleration_Jerk_Mean_Y",
  "(Frequency)_Body_Acceleration_Jerk_Mean_Z",
  "(Frequency)_Body_Acceleration_Jerk_Standard_Deviation_X",
  "(Frequency)_Body_Acceleration_Jerk_Standard_Deviation_Y",
  "(Frequency)_Body_Acceleration_Jerk_Standard_Deviation_Z",
  "(Frequency)_Body_Acceleration_Jerk_Mean_Frequency_X",
  "(Frequency)_Body_Acceleration_Jerk_Mean_Frequency_Y",
  "(Frequency)_Body_Acceleration_Jerk_Mean_Frequency_Z",
  "(Frequency)_Body_Gyroscope_Mean_X",
  "(Frequency)_Body_Gyroscope_Mean_Y",
  "(Frequency)_Body_Gyroscope_Mean_Z",
  "(Frequency)_Body_Gyroscope_Standard_Deviation_X",
  "(Frequency)_Body_Gyroscope_Standard_Deviation_Y",
  "(Frequency)_Body_Gyroscope_Standard_Deviation_Z",
  "(Frequency)_Body_Gyroscope_Mean_Frequency_X",
  "(Frequency)_Body_Gyroscope_Mean_Frequency_Y",
  "(Frequency)_Body_Gyroscope_Mean_Frequency_Z",
  "(Frequency)_Body_Acceleration_Magnitude_Mean",
  "(Frequency)_Body_Acceleration_Magnitude_Standard_Deviation",
  "(Frequency)_Body_Acceleration_Magnitude_Mean_Frequency",
  "(Frequency)_Body_Acceleration_Jerk_Magnitude_Mean",
  "(Frequency)_Body_Acceleration_Jerk_Magnitude_Standard_Deviation",
  "(Frequency)_Body_Acceleration_Jerk_Magnitude_Mean_Frequency",
  "(Frequency)_Body_Body_Gyroscope_Magnitude_Mean",
  "(Frequency)_Body_Body_Gyroscope_Magnitude_Standard_Deviation",
  "(Frequency)_Body_Body_Gyroscope_Magnitude_Mean_Frequency",
  "(Frequency)_Body_Body_Gyroscope_Jerk_Magnitude_Mean",
  "(Frequency)_Body_Body_Gyroscope_Jerk_Magnitude_Standard_Deviation",
  "(Frequency)_Body_Body_Gyroscope_Jerk_Magnitude_Mean_Frequency")

# use mean_std_col_name to select the targeted columns(mean and std columns) .
#I added 2 because of the first two column( not measurment column)
final_df_2 <- final_df[,c(1,2,mean_std_col_name$feature_id+2)] # answer of point 2

# replace the old column names with corrective one in feature file (mean_std_col_name df)
# also the answer of point 3
colnames(final_df_2)[3:ncol(final_df_2)] <- as.character(mean_std_col_name$feature_name)

# answer of point 4
final_df_4 <- inner_join(final_df_2,activity_labels)

# remove column activity label ID
final_df_4$activity_label_ID <- NULL 

# answer of point 5
temp_df_5 <- melt(final_df_4,id=c("subject_ID","activity_label_Name"),
                  measure.vars= c(2:(ncol(final_df_4)- 1)))
final_df_5 <- dcast(temp_df_5, subject_ID+activity_label_Name ~ variable, mean)

#dim(final_df_5) # dataframe of 180*81 

# final result 
#write.table(final_df_5, file= "D:/Data Science Track/Getting and Cleaning Data/Course Project/answer_point5.txt",row.name=FALSE)
write.table(final_df_5, file= "./Samsung data/answer_point5.txt",row.name=FALSE)