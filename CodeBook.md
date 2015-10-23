# CodeBook

# Source 

When executed, UCI dataset is extracted directly into `./data/`. 
See the [README.md](README.md) for details.

# Output

The resulting `./tidy.data.txt` dataset includes mean and standard deviation variables for the following original variables (X, Y, Z directions included):

tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag. 

# Transformations

The script, `run_analysis.R`, does the following,

* Load dataset files 
* Merges the three test and train files into a single data frame
* Set textual columns heading from provided file 
* Keep only only mean and std variables
* Computes means of these variables, grouped by subject/activity.
* Saves to `./tidy.data.txt`

For more details, consult [README.md](README.md) and [run_analysis.R](run_analysis.R).