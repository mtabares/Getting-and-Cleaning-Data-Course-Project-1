library(reshape2)
#==============================================================================-
#Step 0 : 
#Check that the required files exists. Obtain them if necessary.
#Declare relative paths and char vectors with the names of the files to be
#loaded.
#Get the vectors of column names
#Load the description of the activities(Y_test, Y_train).
#==============================================================================-

##Check if the working directory contains the zip file. If not, Download it.

if(!file.exists("UCI HAR Dataset.zip")) {
        urlFile <-
                "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(urlFile,
                      destfile = "UCI HAR Dataset.zip")
        
}

##Check if the zip file has been uncompressed. If not, uncompress it.

if (!file.exists("UCI HAR Dataset")) {
        unzip("UCI HAR Dataset.zip", exdir = getwd())
}
#Declare relative paths
pathRoot<-"UCI HAR Dataset/"
pathTest<-"UCI HAR Dataset/test/"
pathTrain<-"UCI HAR Dataset/train/"
pathTestInsig<-"UCI HAR Dataset/test/Inertial Signals/"
pathTrainInsig<-"UCI HAR Dataset/train/Inertial Signals/"

##Declare vectors of file names. 

testFiles<-c("subject_test", "Y_test","X_test" )
trainFiles<-c("subject_train", "Y_train" , "X_train")
inSigTestFiles<-c("body_acc_x_test", 
                  "body_acc_y_test",
                  "body_acc_z_test", 
                  "body_gyro_x_test", 
                  "body_gyro_y_test", 
                  "body_gyro_z_test",
                  "total_acc_x_test",
                  "total_acc_y_test",
                  "total_acc_z_test")
inSigTrainFiles<-c("body_acc_x_train", 
                  "body_acc_y_train",
                  "body_acc_z_train", 
                  "body_gyro_x_train", 
                  "body_gyro_y_train", 
                  "body_gyro_z_train",
                  "total_acc_x_train",
                  "total_acc_y_train",
                  "total_acc_z_train")

##Get the vectors of column names.
###Get the column names of the features variables.

features<-read.table(paste(pathRoot, "features",".txt",sep = ""),
                            header = FALSE)
features<-as.character(features$V2)
        

###Get the column names of inertial signals variables.

inertialSignalNames <- as.data.frame(sapply(inSigTestFiles,
                                       function(x)
                                       {
                                               paste(gsub("_test","",x) ,
                                                     "_r",
                                                     as.character(1:128),
                                                     sep = "")
                                       }))

##Load the description of the activities(Y_test, Y_train).

activity_labels<-read.table(paste(pathRoot, "activity_labels",".txt",sep = ""),
                            header = FALSE)
activity_labels$V2<-tolower(activity_labels$V2)

#==============================================================================-
#Step 1 and 3: 
#Merge the training and the test sets to create one data set. 
#Uses descriptive activity names to name the activities in the data set.
#
#Since there are a lot of files to be loaded, I decided to load them using loops.
#For further information about the loops and the reason for using the eval and
#call functions, please refer to the README.md file.
#
#This code creates one data set for the features data and another for the
#inertial signals data. The reason for this is explained in the Codebook and
#the README.md files.
#==============================================================================-

##Load all the files  that are in the test directory.
##The data set is initialized inside the loop. It must be deleted before 
##the loop in order that it process correctly the data.

if(exists("testData")){rm(testData)}
for(fileName in testFiles) {
        
        #Assign the each loaded textfile to a dataset with its same name.
        
        eval(call("<-",as.name(fileName),read.table(paste(pathTest,
                                                          fileName,
                                                          ".txt",
                                                          sep = ""),
                                                    header = FALSE)))
        if (fileName == "Y_test") {
                
                ###Add the descriptive labels to Y_test before combining it with
                ###the test features dataset
                
                Y_test$index<-as.numeric(rownames(Y_test))
                tempData<-merge( Y_test, activity_labels)
                
                ##The order of Y_test must be restored. 
                
                tempData<-tempData[order(tempData$index),]
                
                ##Substitute the row numbers of the temporal dataset with the
                ##original row numbers (the ones of Y_test)
                
                rownames(tempData)<-tempData$index
                testData <- cbind(testData, tempData)
                rm(tempData)
        } else{
                if (exists("testData")) {
                        
                        ###If exists, add the loaded variables to it.
                        
                        testData <- cbind(testData, eval(as.name(fileName)))
                } else{
                        
                        ###If not, declare it.
                        
                        testData <- eval(as.name(fileName))
                }
        }
        
        
}

##Load all the files  that are in the train directory.
##The data set is initialized inside the loop. It must be deleted before 
##the loop in order that it process correctly the data.

if(exists("trainData")){rm(trainData)}
for(fileName in trainFiles) {
        
        #Assign the each loaded textfile to a dataset with its same name.
        
        eval(call("<-",as.name(fileName),read.table(paste(pathTrain,
                                                          fileName,
                                                          ".txt",
                                                          sep = ""),
                                                    header = FALSE)))
        if (fileName == "Y_train") {
                
                ###Add the descriptive labels to Y_train before combining it
                ###with the train features dataset
                
                Y_train$index<-as.numeric(rownames(Y_train))
                tempData<-merge( Y_train, activity_labels)
                
                ##The order of Y_train must be restored. 
                
                tempData<-tempData[order(tempData$index),]
                
                ##Substitute the row numbers of the temporal dataset with the
                ##original row numbers (the ones of Y_train)
                
                rownames(tempData)<-tempData$index
                trainData <- cbind(trainData, tempData)
                rm(tempData)
        } else{
                if(exists("trainData")) {
                        
                        ###If exists, add the loaded variables to it.
                        
                        trainData <- cbind(trainData, eval(as.name(fileName)))
                }else{
                        
                        ###If not, declare it.
                        
                        trainData <-eval(as.name(fileName))
                }
        }
        
}

##Delete the index column used for restore the initial order of Y_test after
##adding the activity labels.

testData<-testData[,-3]
trainData<-trainData[,-3]

##Create a single data set using the test and train features 

featuresData<-rbind(testData, trainData)

##Create the "Key" variable that identifies uniquely each record.

featuresData<-cbind(as.numeric(rownames(featuresData)), featuresData)

##Add temporal names. These will be modified to make them more readable later.

names(featuresData)<-c("Key","Subject","Activity", "ActivityLabel", features)

##Initialize the data sets to store the inertial signal data with the
##"Subject","Activity", "ActivityLabel" variables. 

inSigTestData<-testData[,c(1,2,3)]
inSigTrainData<-trainData[,c(1,2,3)]
names(inSigTestData)<-c("Subject","Activity", "ActivityLabel")
names(inSigTrainData)<-c("Subject","Activity", "ActivityLabel")

##Remove  the data sets that are not useful anymore.

rm(X_test, Y_test, X_train, Y_train,testData, trainData)


##Load all the files  that are in the test inertial signals directory.

for(fileName in inSigTestFiles) {
        
        #Assign the each loaded textfile to a dataset with its same name.
        
        eval(call("<-", as.name(fileName), read.table(paste(pathTestInsig,
                                                            fileName,
                                                            ".txt",
                                                            sep = ""),
                                                      header = FALSE)))
        
        ##Add the column names of the dataset using a temporal variable.
        
        tempVar<-eval(as.name(fileName))
        names(tempVar)<-inertialSignalNames[,fileName]
        eval(call("<-",as.name(fileName), tempVar))
        
        ##Add the variables to the test inertial signals dataset
        
        inSigTestData<-cbind(inSigTestData, eval(as.name(fileName)))
        
        ##Remove the data sets that are not useful anymore.
        
        rm(list=c("tempVar", fileName))
}

##Load all the files  that are in the train directory.

for(fileName in inSigTrainFiles) {
        
        #Assign the each loaded textfile to a dataset with its same name.
        
        eval(call("<-",as.name(fileName),read.table(paste(pathTrainInsig,
                                                          fileName,
                                                          ".txt",
                                                          sep = ""),
                                                    header = FALSE)))
        
        ##Add the column names of the dataset using a temporal variable and a
        ##modified name (the column names of inertialSignalNames are
        ##body_acc_x_test, and so on, so looking up the column
        ##"body_acc_x_train" will result in a error).
        
        tempVar<-eval(as.name(fileName))
        fileName2<-gsub("_train","_test", fileName)
        names(tempVar)<-inertialSignalNames[,fileName2]
        eval(call("<-",as.name(fileName), tempVar))
        
        ##Add the variables to the train inertial signals dataset
        
        inSigTrainData<-cbind(inSigTrainData, eval(as.name(fileName)))
        
        ##Remove the data sets that are not useful anymore.
        
        rm(list=c("tempVar", fileName, "fileName2"))
}

##Create a single data set using the test and train inertial signal data. 

inertialSignalData<-rbind(inSigTestData, inSigTrainData)

##Create the "Key" variable that identifies uniquely each record.

inertialSignalData<-cbind(as.numeric(rownames(inertialSignalData)), 
                          inertialSignalData)
names(inertialSignalData)[1]<-"Key"

##inertialSignalData is too wide. Reshape it to long, using the "Key" to
##uniquely identify each record, and creating a new variable("reading") that
##identifies which reading of the 2.56 seconds window.

inertialSignalData<-reshape(inertialSignalData, 
                   varying = 5:1156, 
                   idvar="Key", 
                   sep="_r", 
                   direction= "long", 
                   timevar = "reading")

##Reorder inertial signal according to "Key".

inertialSignalData<-inertialSignalData[order( inertialSignalData$Key),]

##Remove  the data sets that are not useful anymore.

rm(inSigTestData, 
   inSigTrainData, 
   inertialSignalNames, 
   subject_test, 
   subject_train)

#==============================================================================-
#Step 2: Extracts only the measurements on the mean and standard deviation for
#each measurement. Only mean() and std() measures will be selected. Please refer
#to the Codebook for further information.
#==============================================================================-

meanStdData<-featuresData[,c(1:4,grep("mean\\(|std\\(", names(featuresData)))]

#==============================================================================-
#Step 3: Done simultaneously with Step 1.
#==============================================================================-
#==============================================================================-
#Step 4: Appropriately labels the data set with descriptive variable names.
#==============================================================================-

names(meanStdData)<-gsub("[[:punct:]]","", names(meanStdData))
names(meanStdData)<-gsub("mean","Mean", names(meanStdData))
names(meanStdData)<-gsub("std","Std", names(meanStdData))
names(meanStdData)<-gsub("^t","", names(meanStdData))
names(meanStdData)<-gsub("^f","Fourier", names(meanStdData))
names(meanStdData)<-gsub("Acc","Accelerometer", names(meanStdData))
names(meanStdData)<-gsub("Gyro","Gyroscope", names(meanStdData))
names(meanStdData)<-gsub("Mag","Magnitude", names(meanStdData))
names(meanStdData)<-gsub("BodyBody","Body", names(meanStdData))

#==============================================================================-
#Step 5: creates a second, independent tidy data set with the average of each
#variable for each activity and each subject.
#==============================================================================-

meltData<-melt(meanStdData, id=c("Key", "Subject", "Activity", "ActivityLabel"))
finalData<-dcast(meltData,  Subject+ActivityLabel ~variable, mean)
write.table(finalData,file = "TidyData.txt",col.names = TRUE, row.names = FALSE)
