
# Load dependeng libraries

library(dplyr)
library(reshape2)

# Get de data if not exists.

if(!file.exists("./data")) {
  file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dir.create("./data")
  download.file(file.url, destfile="data.zip", method="curl")  
  unzip(zipfile = "./data.zip", exdir = "./data")
  file.remove("./data.zip")
}

# Read in data and metadata

train.x  <-read.table("./data/UCI HAR Dataset/train/X_train.txt")
test.x   <-read.table("./data/UCI HAR Dataset/test/X_test.txt")

train.y  <-read.table("./data/UCI HAR Dataset/train/y_train.txt")
test.y   <-read.table("./data/UCI HAR Dataset/test/y_test.txt")

train.subj <-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
test.subj  <-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

features   <- read.table("./data/UCI HAR Dataset/features.txt")
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Merges the training and the test sets to create one data set (#1)

merged.x    <- rbind(train.x, test.x)
merged.y    <- rbind(train.y, test.y)
merged.subj <- rbind(train.subj, test.subj)

# Remove orignal datasets

rm(train.x, test.x, train.y, test.y, train.subj, test.subj)

# Appropriately labels the data set with descriptive variable names. (#4)
# Also delete features frame once used to rename variables.

names(merged.x)    <- as.character(features[, 2])
names(merged.y)    <- "activity.id"
names(merged.subj) <- "suject.id"
names(activities)  <-  c("activity.id", "activity.name")

rm(features)

#  Extracts only the measurements on the mean and standard deviation for each measurement (#2)







