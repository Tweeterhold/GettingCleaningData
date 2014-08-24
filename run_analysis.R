## Import the activity labels
activity_labels <- read.table("activity_labels.txt", header = FALSE, col.names = c("ActivityID","Activity"))

## Import the feature list and create names that can be used as column names
features <- read.table("features.txt", header = FALSE, col.names = c("FeatureID","Feature"))
features$FeatureColName <- gsub("\\(\\)|,|-",".",features$Feature)
features$FeatureColName <- gsub("\\)|\\(","",features$FeatureColName)
features$FeatureColName <- gsub("meanFreq","mF",features$FeatureColName)

## Read in all of the data sets
subject_test <- read.table("./test/subject_test.txt", header = FALSE, col.names = "Subject")
X_test <- read.table("./test/X_test.txt", header = FALSE, col.names = features$FeatureColName)
y_test <- read.table("./test/y_test.txt", header = FALSE, col.names = "ActivityID")
subject_train <- read.table("./train/subject_train.txt", header = FALSE, col.names = "Subject")
X_train <- read.table("./train/X_train.txt", header = FALSE, col.names = features$FeatureColName)
y_train <- read.table("./train/y_train.txt", header = FALSE, col.names = "ActivityID")

## Merge the Activity Labels with the Test and Training Labels for readability
y_test <- merge(y_test,activity_labels)
y_train <- merge(y_train,activity_labels)

## Bind the test and train subjects, activities, and data, then combine the
## test and train data sets. 
test_data <- cbind(subject_test, y_test, X_test)
train_data <- cbind(subject_train, y_train, X_train)
myData <- rbind(test_data ,train_data)

## Select only the mean and standard deviation for each measurement
myData <- myData[,c(1, 3, grep("mean|std", colnames(myData)))]

## Create the tidy data set with the average for each measurement, for each 
## subject and activity.
library(reshape)

myDataLong <- melt(myData, id=c("Subject","Activity"))
output <- cast(myDataLong, Subject + Activity ~ variable, mean)
write.table(output, file = "CourseProjectTidyData.txt", row.name = FALSE)
