# Download the data files

zip <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",zip)

# Read the data from the files

X_train <- read.table(unz(zip, "UCI HAR Dataset/train/X_train.txt"))
Y_train <- read.table(unz(zip, "UCI HAR Dataset/train/y_train.txt"))
subject_train <- read.table(unz(zip, "UCI HAR Dataset/train/subject_train.txt"))

body_acc_x_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"))
body_acc_y_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"))
body_acc_z_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"))

body_gyro_x_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"))
body_gyro_y_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"))
body_gyro_z_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"))

total_acc_x_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"))
total_acc_y_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"))
total_acc_z_train <- read.table(unz(zip, "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"))

X_test <- read.table(unz(zip, "UCI HAR Dataset/test/X_test.txt"))
Y_test <- read.table(unz(zip, "UCI HAR Dataset/test/y_test.txt"))
subject_test <- read.table(unz(zip, "UCI HAR Dataset/test/subject_test.txt"))

body_acc_x_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"))
body_acc_y_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"))
body_acc_z_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"))

body_gyro_x_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"))
body_gyro_y_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"))
body_gyro_z_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"))

total_acc_x_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"))
total_acc_y_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"))
total_acc_z_test <- read.table(unz(zip, "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"))

activity_labels <- read.table(unz(zip, "UCI HAR Dataset/activity_labels.txt"))
features <- read.table(unz(zip, "UCI HAR Dataset/features.txt"))

# Remove the downloaded file when it is no longer needed

unlink(zip)
remove(zip)

# Merge the training and testing datasets

X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
subject <- rbind(subject_train, subject_test)

body_acc_x <- rbind(body_acc_x_train, body_acc_x_test)
body_acc_y <- rbind(body_acc_y_train, body_acc_y_test)
body_acc_z <- rbind(body_acc_z_train, body_acc_z_test)

body_gyro_x <- rbind(body_gyro_x_train, body_gyro_x_test)
body_gyro_y <- rbind(body_gyro_y_train, body_gyro_y_test)
body_gyro_z <- rbind(body_gyro_z_train, body_gyro_z_test)

total_acc_x <- rbind(total_acc_x_train, total_acc_x_test)
total_acc_y <- rbind(total_acc_y_train, total_acc_y_test)
total_acc_z <- rbind(total_acc_z_train, total_acc_z_test)

# Clean memory of duplicate datasets

remove(body_acc_x_train, body_gyro_x_train, total_acc_x_train)
remove(body_acc_y_train, body_gyro_y_train, total_acc_y_train)
remove(body_acc_z_train, body_gyro_z_train, total_acc_z_train)
remove(body_acc_x_test, body_gyro_x_test, total_acc_x_test)
remove(body_acc_y_test, body_gyro_y_test, total_acc_y_test)
remove(body_acc_z_test, body_gyro_z_test, total_acc_z_test)
remove(X_train, X_test, Y_train, Y_test, subject_train, subject_test)

# Convert to data frame
data <- as.data.frame(X)
names(data)<-features[[2]]
remove(X, features)

# Find number of records
len <- length(data[,1])

# Add inertial data into the same data frame with rest of the data
data$body_acc_x<-lapply(1:len, function(i) as.vector(sapply(body_acc_x, '[[', i)))
data$body_acc_y<-lapply(1:len, function(i) as.vector(sapply(body_acc_y, '[[', i)))
data$body_acc_z<-lapply(1:len, function(i) as.vector(sapply(body_acc_z, '[[', i)))

data$body_gyro_x<-lapply(1:len, function(i) as.vector(sapply(body_gyro_x, '[[', i)))
data$body_gyro_y<-lapply(1:len, function(i) as.vector(sapply(body_gyro_y, '[[', i)))
data$body_gyro_z<-lapply(1:len, function(i) as.vector(sapply(body_gyro_z, '[[', i)))

data$total_acc_x<-lapply(1:len, function(i) as.vector(sapply(total_acc_x, '[[', i)))
data$total_acc_y<-lapply(1:len, function(i) as.vector(sapply(total_acc_y, '[[', i)))
data$total_acc_z<-lapply(1:len, function(i) as.vector(sapply(total_acc_z, '[[', i)))

remove(body_acc_x, body_gyro_x, total_acc_x)
remove(body_acc_y, body_gyro_y, total_acc_y)
remove(body_acc_z, body_gyro_z, total_acc_z)
remove(len)

# Add subject identifiers to the dataset

data$subject<-unlist(subject)
remove(subject)

# Add descriptive activity names to the data set

data$activity<-factor(sapply(Y, function(i) activity_labels[[2]][i]))
remove(Y, activity_labels)

# Extract only the measurements on the mean and standard deviation for each measurement.

extracted<-data[,grep("mean|std|subject|activity",names(data))]

# Make names human readable

names(extracted)<-gsub("^t([A-Za-zO]+)-","\\1TimeDomain-",names(extracted))
names(extracted)<-gsub("^f([A-Za-zO]+)-","\\1FrequencyDomain-",names(extracted))
names(extracted)<-gsub("BodyAccJerk","BodyJerk",names(extracted))
names(extracted)<-gsub("BodyAcc","BodyAcceleration",names(extracted))
names(extracted)<-gsub("GravityAcc","GravitationalAcceleration",names(extracted))
names(extracted)<-gsub("BodyGyroJerk","BodyRotationJerk",names(extracted))
names(extracted)<-gsub("BodyGyro","BodyRotation",names(extracted))
names(extracted)<-gsub("Mag","Magnitude",names(extracted))
names(extracted)<-gsub("-mean\\(\\)","Mean",names(extracted))
names(extracted)<-gsub("-std\\(\\)","StandardDeviation",names(extracted))
names(extracted)<-gsub("-meanFreq\\(\\)","MeanFrequency",names(extracted))
names(extracted)<-gsub("-X","OnXAxis",names(extracted))
names(extracted)<-gsub("-Y","OnYAxis",names(extracted))
names(extracted)<-gsub("-Z","OnZAxis",names(extracted))

# Save tidy data

write.table(extracted, "tidydata.txt", row.names = FALSE)

# Calculate the average values of each variable for each activity and each subject

meandata<-aggregate(extracted[,1:79], list(extracted$subject, extracted$activity), mean)
names(meandata)[1] <- "Subject"
names(meandata)[2] <- "Activity"

# Save the averaged data

write.table(meandata, "meandata.txt", row.names = FALSE)

