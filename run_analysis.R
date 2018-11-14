## Loading packages
library(dplyr)

## Setting the working directory
getwd()

##### 1. Merging the training and the test sets to create one data set ####
## Loading the data sets into data frames
## Training set
# Subjects
train_subjID <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", header = FALSE, col.names = "subjID")
# Labels
train_labels <- read.table("./UCI_HAR_Dataset/train/y_train.txt", header = FALSE, col.names = "labels")
# Features
train_feature <- read.table("./UCI_HAR_Dataset/train/X_train.txt", header = FALSE)
# Merging all training data frames
train_df <- cbind(train_subjID, train_labels, train_feature)
# Removing individual data frames
rm(train_subjID,train_labels,train_feature)

## Test set
# Subjects
test_subjID <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", header = FALSE, col.names = "subjID")
# Labels
test_labels <- read.table("./UCI_HAR_Dataset/test/y_test.txt", header = FALSE, col.names = "labels")
# Features
test_feature <- read.table("./UCI_HAR_Dataset/test/X_test.txt", header = FALSE)

# Merging all training data frames
test_df <- cbind(test_subjID, test_labels, test_feature)
# Removing individual data frames
rm(test_subjID,test_labels,test_feature)

## Merging the training and test dataframes
merged_df <- rbind(train_df, test_df)

## Cleaning dataframes
rm(test_df, train_df)
#####

##### 2. Extracting only the measurements on the mean and standard deviation for each measurement ####
# Features column names
feature_colnames <- read.table("./UCI_HAR_Dataset/features.txt", header = FALSE)
feature_colnames <- as.character(feature_colnames$V2)
# Columns to keep
cols_keep <- grep("mean()|std()", feature_colnames)
# Adjusting cols_keep indices for two pre-existing columns
cols_keep_merged <- cols_keep + 2
# Keeping only the columns with mean() and std()
merged_df <- subset(merged_df, select = c(1:2, cols_keep_merged))
#####

##### 3. Descriptive activity names to name the activities in the data set ####
## Getting the activity labels into a variable
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt", header = FALSE)

## Creating a lookup vector for activity labels
lookupvector_labels <- c(as.character(activity_labels$V2[[1]]),
                         as.character(activity_labels$V2[[2]]),
                         as.character(activity_labels$V2[[3]]),
                         as.character(activity_labels$V2[[4]]),
                         as.character(activity_labels$V2[[5]]),
                         as.character(activity_labels$V2[[6]])
                         )

## Updating the labels column to use the activity names
merged_df$labels <- lookupvector_labels[merged_df$labels]
#####

##### 4. Labeling the data set with descriptive variable names. ####
## Updating the feature_labels variable by keeping only the mean() and std() columns
feature_colnames <- feature_colnames[cols_keep]

## Making the variable names descriptive: use only lower case, t = time, f = freq, "." to separate words
# Function with all the changes needed
fun_x <- function(x) {
  x1 <- gsub("^t", "Time.", x)
  x2 <- gsub("^f", "Freq.", x1)
  x3 <- gsub("Acc", "Accelerometer", x2)
  x4 <- gsub("Gyro", "Gyroscope", x3)
  x5 <- gsub("Mag", "Magnitude", x4)
  x6 <- gsub("X", "Xaxis", x5)
  x7 <- gsub("Y", "Yaxis", x6)
  x8 <- gsub("Z", "Zaxis", x7)
  x9 <- gsub("-", ".", x8)
  x9
}
# Applying the function
feature_colnames_descr <- fun_x(feature_colnames)

# Updating the column names of merged_df
colnames(merged_df) <- c("subjID", "Activity", feature_colnames_descr)
#####

##### 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. ####
# Tidy data set
data_summary <- merged_df %>%
  group_by(subjID,Activity) %>%
  summarise_all(funs(mean))
#####

# Exporting as a text file
write.table(data_summary, file = "TidyDataset.txt", row.names = FALSE)
