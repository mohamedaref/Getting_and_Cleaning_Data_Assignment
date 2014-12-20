Getting_and_Cleaning_Data_Assignment
====================================

This file is created to explain the steps that has been done in run_analysis.R, read the below steps to find out how the script is going work.

# steps:

1.  load needed library( dplyr, reshape2), we will use them in joining and reshaping the data.
2.  In the main folder ( samsung data folder) we will load the text files into different data frames by using read.table command (activity label file and features file), also rename the first column in activity label data frame to be activity_label_ID.
3.  In train folder load the files into different data frames (subject_train, activity_y_train and X_train) and rename the first column in activity_y_train data frame to be activity_label_ID.  
4.  Merge these data frames from step 3 into one training data frame by using cbind function.
5.  Repeat step 3 and 4 but on test folder and test data (subject_test, activity_y_test and X_test).
6.  Merge the two data frames (train and test data frames) into one data frame by using rbind function.
7.  select the column names that are having mean or std in features data frame by using grep function.
8.  select columns from data frame created in step 6 by subset this data frame by index and use of data frame created in step 7 and change the names of these columns with column names in feature data frame.
9.  Merge activity labels data frame with data frame created from step 8 by using inner join command, the joing column will be activity_label_ID ( this column is a common column in activity label data frame and data frame in step 8).
10. Reshaping the new data frame created from step 9 by using melt and dcast function, melt function will create two new columns called variable and value, the variable column will contain the function name in feature file and value column will contain the value of this function, and the function dcast will apply the grouping on the data with average function( average per subject per activity).
11. write the result of data frame created in step 10 into a text file in samsung folder.

Note: samsung folder must be in the working directory folder to make this file work.

