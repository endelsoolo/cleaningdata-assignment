# cleaningdata-assignment

Getting and Cleaning Data - Homework assignment

## Methodology

The script works as follows:
- First downloads the data files from the server
- Reads in each data file from the downloaded zip file
- Deletes the downloaded file when it is no longer needed
- Merges the training and testing datasets
- Joins all separate tables (even the inertial data vectors) into a single huge data frame
- Adds subject identifiers to the dataset
- Replaces activity numbers with labels
- Extracts only the measurements containing either "mean" or "std" in their names.
- Replaces acronymes with full words in variable names to make them human readable
- Saves the completed tidy dataset
- Calculates the average values of each variable for each activity and each subject combination
- Saves the averaged data in another file

