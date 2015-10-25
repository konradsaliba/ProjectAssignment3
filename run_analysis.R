#loading all data sets
trainSet <- read.table('train/X_train.txt')
trainSubjects <- read.table('train/subject_train.txt', col.names = 'subjects')
trainActivity <- read.table('train/y_train.txt', col.names = 'activity')

testSet <- read.table('test/X_test.txt')
testSubjects <- read.table('test/subject_test.txt', col.names = 'subjects')
testActivity <- read.table('test/y_test.txt', col.names = 'activity')

features <- read.table('features.txt')
activities <- read.table('activity_labels.txt', col.names = c('activityId', 'activityName'))

#Set features as columns names for data set
names(trainSet) <- features[,2]
names(testSet) <- features[,2]

#Join training set with test set
allSet <- rbind(trainSet, testSet)
allSubjects <- rbind(trainSubjects, testSubjects)
allActivity <- rbind(trainActivity, testActivity)

#Keep only means and standard deviation columns
meanCols <- grepl("mean()", names(allSet), fixed = T)
meanSet <- allSet[,meanCols]
stDevCols <- grepl("std()", names(allSet), fixed = T)
stDevSet <- allSet[,stDevCols]

#Join everything in one dataset
dataSet <- cbind(meanSet, stDevSet)
dataSet <- cbind(allSubjects, allActivity, dataSet)

#Merge with activities to get the descriptive activity name
dataSet <- merge(dataSet, activities, by.x = 'activity', by.y = 'activityId')
dataSet[,1] <- factor(dataSet[,1])
dataSet[,2] <- factor(dataSet[,2])

#Group data set by Activity and Subjects and get the mean for every variable
numCols <- sapply(dataSet, is.numeric)
resultSet <- aggregate(dataSet[,numCols], by = list(dataSet$activityName, dataSet$subjects), mean)
colnames(resultSet)[1:2] <- c('activityName', 'subject')

write.table(resultSet, 'results.txt', row.names = F)
