Getting and Cleaning Data Course Project
===================

The R Script run_analysis.R in this repo combines data from several data sets, selects relevant variables, and then produces an output for the Course Project. 

### Step 1 - Importing the Activity Labels
* Part of this project is to use descriptive activity names. The file “activity_labels.txt” that was included with the project data contains descriptive names, and can be merged with the y_test andy_train files.

### Step 2 - Importing the Feature Names
* This file contains the variable names that will become column names for the data contained in X_test and X_train files. 
* The feature names contain the characters (, ), and -, which cannot be used in column names. These characters are removed and replaced with a period.
* To make subsetting the data easier later in the script the text “meanFreq” is changed to “mF”.

### Step 3 - Reading the Data Files
* read.table is used on the 6 data files being used in this project. Descriptive column names are specified for each file.

### Step 4 - Adding Activity Labels
* The y_test and y_train data sets contain Activity IDs (i.e. integers) to represent the activity. Using the merge() function we add a column that has the Activity Name from Step 1 of this script.

### Step 5 - Creating the Data Set
* The subject, activity, and accelerometer data are column binded for the test and train data sets.
* The test and train data sets are combined using the rbind() function.

### Step 6 - Selecting Variables
* We subset the columns of data that we’re interested in by using the grep() function to only select columns that contain “mean” and “std”. We also retain the columns for Activity and Subject.

### Step 7 - Tidy Data Creation
* The melt() and cast() functions from the reshape package calculate the average of each variable for each subject and activity.
* The tidy data set is written to a file.

