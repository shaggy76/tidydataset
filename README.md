# Process and create a tidy data set

* the script takes the dataset "UCI HAR Dataset" and creates a tidy dataset of that data
* set the home directory to the path that contains the unzipped folder "UCI HAR Dataset"
* the script pulls the X_..., Y_... and subjects.txt data from the test and train folders
* the files featuers.txt and activity_lables.txt are loaded
* two ggrep() calls filter out the relevant columns looking for mean() and std() in the column name
* cbind() and a merge() call combine the train and test dataset and add activity labels
* an aggregate() call averages the values for each subject and activity
* two files are written to the folder, tds.txt and tds_agg.txt.  They are tab delimited.