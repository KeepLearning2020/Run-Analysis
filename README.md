# Run-Analysis
This repository is for Coursera, Getting and Cleaning Data, final project Run Analysis

## Introduction to the Project

The purpose of this project is to demonstrate our ability to collect and clean a data set. The goal is to prepare tidy data that can be used for later analysis. There are three files in this repo. The dataset and its full description can be found at The UCI Machine Learning Repository. One can aslo download the data package via this website.

## Files in the repository

The R script run_analysis.R is created for data analysis and clearning for the provided data collected from the accelerometers from the Samsung Galaxy S smartphone

The README.md gives the brief introduction about the implementation in run_analysis.R.

The CookBook.md describes the variables, data, and related transformations.

## Details in run_analysis.R

As the request, the R script run_analysis.R realizes followings:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive variable names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Details implemented in run_analysis.R:

*Preparation*
- Download the raw data from provided weblink, through download.file.
- Unzip the download file, through unzip. 
- Read data from downloaded package and store as new variables, including features, activity_labels, X_trian, Y_train, subject_train, X_test, Y_test, subject_test.
- Bind trainning and test data in two tables with all input separately. 

*Handling data as request*
- Merge training and test data as one dataset named fullData, through rbind.
- Extracts measurements on mean and standard deviation for each measurements from fllData, through grep.
- New column act_name is added in fullData to describe the name of related activity. The activity name is fetched from activity_labels, through match.
- Update some column names to make them better readable, through gsub.
- New tidy data set named meanDatabyAct is created to give the average of each variable for each activity and each subject. Another data set as meanDatabySub is created by ordering the search result on subject first. The tidy data meanDatabyAct is stored in output file "meanDatabyActivitySubject.txt".
