
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

all.x    <- rbind(train.x, test.x)
all.y    <- rbind(train.y, test.y)
all.subj <- rbind(train.subj, test.subj)

# Remove orignal datasets

rm(train.x, test.x, train.y, test.y, train.subj, test.subj)

# Appropriately labels the data set with descriptive variable names. (#4)
# Also delete features frame once used to rename variables.

names(all.x)      <- as.character(features[, 2])
names(all.y)      <- "activity.id"
names(all.subj)   <- "subject.id"
names(activities) <-  c("activity.id", "activity.name")

rm(features)

#  Extracts only the measurements on the mean and standard deviation for each measurement (#2)

all.x <- all.x[, c(grep("-mean|-std",colnames(all.x)))]

# Create a merged, final data frame.
# Uses descriptive activity names to name the activities in the data set (#3)
# Then cleanup.

merged <- cbind(all.subj, all.y, all.x)
merged <- merge(x=merged, y=activities, by = "activity.id")
merged <- subset(merged, select = - c(activity.id) ) # This removes activity.id column

rm (all.x)
rm (all.y)
rm (all.subj)
rm (activities)

# Creates a second, independent tidy data set with the average of each variable for each 
# activity and each subject. (#5)

melted   <- melt(merged, id.var = c("subject.id", "activity.name"))
averaged <- dcast(melted , subject.id + activity.name ~ variable, mean)

rm (melted)

# Write out!

write.csv(averaged, file = "tidy.data.txt")
