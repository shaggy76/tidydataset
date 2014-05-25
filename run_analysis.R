# Get working directory and set data folders
dir_working <- as.character(getwd())
dir_test <- "/UCI HAR Dataset/test"
dir_train <- "/UCI HAR Dataset/train"
dir_faq <- "/UCI HAR Dataset"

# Read test data
dir_current <- paste(dir_working, dir_faq, sep = "")
setwd(dir_current)

file <- "features.txt"
features <- read.table(file)
file <- "activity_labels.txt"
activity_labels <- read.table(file)

# Isolate mean() and std() fields and grap column names
features_columns <- grep("mean()", features[, 2], fixed = TRUE)
features_columns <- c(features_columns, grep("std()", features[, 2], fixed = TRUE))
features_columns[order(features_columns)]

# Read test data
dir_current <- paste(dir_working, dir_test, sep = "")
setwd(dir_current)

file <- "X_test.txt"
X_test <- read.table(file)
file <- "Y_test.txt"
Y_test <- read.table(file)
file <- "subject_test.txt"
subject_test <- read.table(file)

# Create test data frame
tds_test <- data.frame(X_test[, features_columns])
tds_test <- cbind(merge(Y_test, activity_labels, c("V1", "V1")), tds_test)
tds_test <- cbind(subject_test, tds_test)

# Read train data
dir_current <- paste(dir_working, dir_train, sep = "")
setwd(dir_current)

file <- "X_train.txt"
X_train <- read.table(file)
file <- "Y_train.txt"
Y_train <- read.table(file)
file <- "subject_train.txt"
subject_train <- read.table(file)

# Create train data frame
tds_train <- data.frame(X_train[, features_columns])
tds_train <- cbind(merge(Y_train, activity_labels, c("V1", "V1")), tds_train)
tds_train <- cbind(subject_train, tds_train)

# Combine test and train data frames and add column names
tds <- rbind(tds_test, tds_train)
colnames(tds) <- c("subjectId", "activityId", "activityName", as.character(features[features_columns, 2]))

# Write output file tds.txt
setwd(dir_working)
write.table(tds, "tds.txt", sep = "\t", col.names = NA, row.names = TRUE)

tds_agg <- aggregate(tds[, 4:ncol(tds)], by = list(tds$subjectId, tds$activityId, tds$activityName), mean)
colnames(tds_agg) <- c("subjectId", "activityId", "activityName", as.character(features[features_columns, 2]))
write.table(tds_agg, "tds_agg.txt", sep = "\t", col.names = NA, row.names = TRUE)
