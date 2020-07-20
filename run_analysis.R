#Coursera Getting and Cleaning Data, Course Project
#

#download original data for first time

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#origfile <- tempfile()
#download.file(url, origfile)
#unzip(origfile)
#unlink(origfile)


#load data
if(!exists("features")){
	features <- read.table("./UCI HAR Dataset/features.txt", sep = "", header = FALSE)
}
if(!exists("activity_labels")){
	activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
}

if(!exists("X_train")){
	X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
}
if(!exists("Y_trian")){
	Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep = "", header = FALSE)
}

if(!exists("subject_train")){
	subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
}


if(!exists("X_test")){
	X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
}
if(!exists("Y_test")){
	Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep = "", header = FALSE)
}
if(!exists("subject_test")){
	subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
}

#Add col name for each table, and merge training and test data in separate table
colnames(X_train) <- features[,2]
colnames(Y_train) <- "act_no"
colnames(subject_train) <- "sub_no"
colnames(activity_labels) <- c("act_no", "act_name")

trainData <- cbind(subject_train, Y_train, X_train)

colnames(X_test) <- features[,2]
colnames(Y_test) <- "act_no"
colnames(subject_test) <- "sub_no"

testData <- cbind(subject_test, Y_test, X_test)

## 1. merge the training and test sets to create one dataset
fullData <- rbind(trainData, testData)
#full Data: 10299 * 563

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
extMeanStd <- grep("(mean\\(\\))|std\\(\\)", colnames(fullData))
extMeanStdData <- cbind(fullData[, 1:2], fullData[, extMeanStd])
# 10299 * 68 (66 measurements)

## 3. Users descriptive activity names ot name activities in the data set
colNames <- colnames(extMeanStdData)
extMeanStdData$act_name <- extMeanStdData$act_no
colnames(extMeanStdData) <- c(colNames, "act_name")
attach(extMeanStdData)
extMeanStdData_N <- cbind(extMeanStdData[, 1:2], act_name, extMeanStdData[,3:(dim(extMeanStdData)[2]-1)])
detach(extMeanStdData)

extMeanStdData_N$act_name <- activity_labels$act_name[match(extMeanStdData_N$act_name, activity_labels$act_no)]

## 4. Appropriately labels the data set with descriptive variable names.
library(magrittr)
colnames(extMeanStdData_N) <- colnames(extMeanStdData_N)%>%
	gsub("-mean","Mean",.)%>%
	gsub("-std","Standard",.)%>%
	gsub("^t","time",.)%>%
	gsub("^f","frequency",.)

## 5. For step4, creates a second independent tidy data set with the average
# 	of each variable for each activity and each subject

#average for each act_name and sub_no

meanDatabyAct <- aggregate(extMeanStdData_N[,4:dim(extMeanStdData_N)[2]],
	by = list(act_no = extMeanStdData_N$act_no,
	act_name = extMeanStdData_N$act_name,
	sub_no = extMeanStdData_N$sub_no), mean)

meanDatabyAct <- meanDatabyAct[order(meanDatabyAct$act_no), ]

meanDatabySub <- meanDatabyAct[order(meanDatabyAct$sub_no), ]

write.table(meanDatabyAct, "meanDatabyActivitySubject.txt", row.name=FALSE)
