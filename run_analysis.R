## load libraries
library(data.table)
library (reshape2)
# downlod and unzip file
if (!file.exists("./data")) {dir.create("./data")}
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        destfile <- "CI-HAR-Dataset.zip"
        download.file(fileUrl, destfile = paste("data", destfile, sep="/"), method="curl")
        unzip(paste("data", destfile, sep="/"), exdir="data")
        data_dir <- setdiff(dir("data"), destfile)
        dateDownloaded <- date()
        dateDownloaded
## import labels
labels <- read.table(paste("data", data_dir, "activity_labels.txt", sep="/"), 
                     col.names=c("labelcode","label"))
## import features
features <- read.table(paste("data", data_dir, "features.txt", sep="/"))[,2]
# Make logical vector with mean & std set to TRUE.
goodfeatures <- grepl("mean|std", features)
# Load and process X_test & y_test data.
training_subject <- read.table(paste("data", data_dir, "train", "subject_train.txt", sep="/"),
                               col.names = "subject")
X_train <- read.table(paste("data", data_dir, "train", "X_train.txt", sep="/"),
                      col.names = features, check.names=FALSE)
training_data <- X_train[,goodfeatures]
training_labels <- read.table(paste("data", data_dir, "train", "y_train.txt", sep="/"),
                              col.names = "labelcode")
training = cbind (training_labels, training_subject, training_data)
subject_test <- read.table(paste("data", data_dir, "test", "subject_test.txt", sep="/"),
                           col.names = "subject")
X_test <- read.table(paste("data", data_dir, "test", "X_test.txt", sep="/"),
                     col.names = features, check.names=FALSE)
test_data <- X_test[,goodfeatures]
test_labels <- read.table(paste("data", data_dir, "test", "y_test.txt", sep="/"),
                          col.names = "labelcode")
test <- cbind (test_labels, subject_test, test_data)
## merge datasets
mergedata <- rbind (training, test)
mergedata <- merge(labels, mergedata, by.x="labelcode", by.y="labelcode")[,-1]
## melt dataset
moltendata <- melt (mergedata, id = c("label", "subject"))
## Get means 
tidydata <- dcast (moltendata, label + subject ~ variable, mean)
## Write tidy dataset to file
write.table(tidydata, file = "./tidy_data.txt")
