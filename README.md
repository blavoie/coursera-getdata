# Course Project - Getting and Cleaning Data

## Introduction

This project contains one R script named `run_analysis.R`. 

On the first run, it automatically downloads the required zip archive containing required data. After that, it loads the data and performs many operations until we have a tidy dataset that is more human consumable.

As asked, the main steps performed are:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

_In order to simplify the script, these steps aren't in this exact order. However, steps numbers are well indentified inside code._

For a detailled rundown, just read the explicit script comments.

## Data Information

Data definitions are in [CodeBook.md](CodeBook.md) file.

## Installing dependencies

```{r}
install.packate("dplyr")
install.package("reshape2")
```