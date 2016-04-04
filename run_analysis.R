##  Coursera - Getting and Cleaning Data Final Project - Steve Whetstone

##  This script merges data and produces a tidy data set for further analysis.

##  This script requires the reshape2 package

        ##  Open required libraries
        
        library(reshape2)
        
        ##  First, read all required .txt files and label the datasets
        
        ##  Read all activity names and label the columns 
        
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))
        
        ##  Read the column names
        
        features <- read.table("UCI HAR Dataset/features.txt")
        featurenames <-  features[,2]
        
        ##  Read the test data and label the columns
        
        testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
        colnames(testdata) <- featurenames
        
        ##  Read the training data and label the dataframe's columns
        
        traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
        colnames(traindata) <- featurenames
        
        ##  Read the ids of the test subjects and label the the dataframe's columns
        
        test_subject_id <- read.table("UCI HAR Dataset/test/subject_test.txt")
        colnames(test_subject_id) <- "subject_id"
        
        ##  Read the activity id's of the test data and label the the dataframe's columns
        
        test_activity_id <- read.table("UCI HAR Dataset/test/y_test.txt")
        colnames(test_activity_id) <- "activity_id"
        
        ##  Read the ids of the test subjects and label the the dataframe's columns
        
        train_subject_id <- read.table("UCI HAR Dataset/train/subject_train.txt")
        colnames(train_subject_id) <- "subject_id"
        
        ##  Read the activity id's of the training data and label the dataframe's columns

        train_activity_id <- read.table("UCI HAR Dataset/train/y_train.txt")
        colnames(train_activity_id) <- "activity_id"
        
        ##  Combine the test subject id's, the test activity id's and the test data
        
        test_data <- cbind(test_subject_id , test_activity_id , testdata)
        
        ##  Combine the test subject id's, the test activity id's and the test data
        
        train_data <- cbind(train_subject_id , train_activity_id , traindata)
        
        ##  Step 1 - Combine the test data and the train data into one dataframe
        
        all_data <- rbind(train_data,test_data)
        
        ##  Step 2 - Extract only the measurements on the mean and standard 
        ##  deviation for each measurement.  Possible values in the features 
        ##  tables include - mean, Mean, std
        ##  used ignore.case=TRUE to capture both mean & Mean
        
        mean_col_index <- grep("mean",names(all_data),ignore.case=TRUE)
        mean_col_names <- names(all_data)[mean_col_index]
        std_col_index <- grep("std",names(all_data),ignore.case=TRUE)
        std_col_names <- names(all_data)[std_col_index]
        meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]
        
        ##  Step 3 - Use description activity names.  Also merged the activities
        ##  dataset with the mean/std values dataset to get one dataset.
        
        descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
        data_prepped <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
        
        ##  Step 4 - Descriptive variable names 
        
        tidy_data <- dcast(data_prepped, activity_name + subject_id ~ variable,mean)
        
        ##  Step 5 - Create second, independent tidy data set for each activity 
        ##  and each subject
        
        write.table(tidy_data,"./tidy_data.txt", row.name = FALSE)
