# ProjectAssignment3
Getting and Cleaning Data Project Assignment

The run_analysis.R script does the following steps to prepare the data in a tidy data set:
* Loads the train and test data sets from the working directory (make sure the files are in the working directory)
* Loads the features and activity labels files
* Assigns the features as column names to each data set
* Joins all training sets (measures, subjects and activities) with their corresponding test sets
* Subsets the training set to contain only mean and standard deviation measurements only
* Joins measurements (mean and standard deviation) with subjects and activity to end up with one data set
* Merges data set with activities file to get the descriptive activity name
* Groups data set by activity and subject and calculates the mean
* Outputs the data set to result.txt

