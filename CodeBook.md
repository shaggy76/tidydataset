# run_analysis.R completes these steps to process and create a tidy data set

* the script takes the dataset "UCI HAR Dataset" and creates a tidy dataset of that data
* set the home directory to the path that contains the unzipped folder "UCI HAR Dataset"
* the script pulls the X_..., Y_... and subjects.txt data from the test and train folders
* the files featuers.txt and activity_lables.txt are loaded
* two ggrep() calls filter out the relevant columns looking for mean() and std() in the column name
* rbind() and a merge() call combine the train and test dataset and add activity labels
* an aggregate() call averages the values for each subject and activity
* two files are written to the folder, tds.txt and tds_agg.txt.  They are tab delimited.

# tds.txt contains the tidy dataset and contains the following data

* the subject, activity number and activity name from the test and train datasets
* the values from the X_train and X_test files that contain mean() or std() in the feature name

# tds_agg.txt aggregates the tds_txt file using aggregate()

* all values are the average of the value from tds.txt grouped by subjectId, activityId, and activityName