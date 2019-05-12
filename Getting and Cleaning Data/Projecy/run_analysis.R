# Getting and Cleaning Data Course Project


#load libraries
library(tidyr)
library(dplyr)

# Read datasets
train<-read.csv("train/X_train.txt",sep="",header=FALSE)
test<-read.csv("test/X_test.txt",sep="",header=FALSE)
subject_train<-read.csv("train/subject_train.txt",sep="",header=FALSE)[,1]
subject_test<-read.csv("test/subject_test.txt",sep="",header=FALSE)[,1]
y_train<-read.csv("train/y_train.txt",sep="",header=FALSE)[,1]
y_test<-read.csv("test/y_test.txt",sep="",header=FALSE)[,1]
features<-read.csv("features.txt",sep="")[,2]
activity_names<-read.csv("activity_labels.txt",sep="",header=FALSE)

# Merges the training and the test sets to create one data set.
all<-rbind(train,test)

# Extracts only the measurements on the mean and standard deviation for each measurement.
d<-grep("std|mean",features)
all_ex<-select(all,d)

# Appropriately labels the data set with descriptive variable names.
names(all_ex)<-features[d]

# Uses descriptive activity names to name the activities in the data set
label<-c(y_train,y_test)
subject<-c(subject_train,subject_test)
all_ex<-mutate(all_ex,label=label,subject=subject)
all_ex<-merge(all_ex,activity_names,by.x="label",by.y="V1")
all_ex<-rename(all_ex,activity=V2)
# Deletes "label" column now that we have descriptive activity names
all_ex$label<-NULL

# Puts student, activity columns at the beginning, sorts by student then activity
all_ex<-select(all_ex,c(subject,activity),everything())
all_ex<-all_ex[order(all_ex$subject,all_ex$activity),]

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
by_student_activity<-group_by(all_ex,subject,activity)
new_all<-summarise_at(by_student_activity,vars(-group_cols()), funs(mean(., na.rm=TRUE)))

#output
new_all
