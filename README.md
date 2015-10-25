# ProjectAssignment3
Getting and Cleaning Data Project Assignment

The run_analysis.R script does the following steps to prepare the data in a tidy data set:
1. Loads the train and test data sets from the working directory (make sure the files are in the working directory)
2. Loads the features and activity labels files
3. Assigns the features as column names to each data set
4. Joins all training sets (measures, subjects and activities) with their corresponding test sets
5. Subsets the training set to contain only mean and standard deviation measurements only
6. Joins measurements (mean and standard deviation) with subjects and activity to end up with one data set
7. Merges data set with activities file to get the descriptive activity name
8. Groups data set by activity and subject and calculates the mean
9. Outputs the data set to result.txt

