# Getting and Cleaning Data Course Project

* [Problem Summary](#summary)
* [Repository Contents](#contents)
* [Key Concepts ](#concepts)
* [The Process](#process)

<h1 id=summary>Problem Summary </h1>
The purpose of this project is to the ability of the student to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The student is asked to create one R script called run_analysis.R that does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
The raw data comes from the Human Activity Recognition Using Smartphones Data Set([http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and it is available at:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This data is the results of some experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The raw data includes 
- 'activity_labels.txt': Links the class labels with their activity name.
- subject_train.txt|subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- Y_train.txt|Y_test.txt:  Each row identifies the activity that the subject performed for each window sample. Its range is from 1 to 6.
- Inertial Signals data:
  - total_acc_x_train.txt|total_acc_x_test.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the total_acc_y_train.txt|total_acc_y_test.txt and total_acc_z_train.txt|total_acc_z_test.txt files for the Y and Z axis. 

  - body_acc_x_train.txt|body_acc_x_test.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. The same description applies for the body_acc_y_train.txt|body_acc_y_test.txt and body_acc_z_train.txt|body_acc_z_test.txt files for the Y and Z axis. 

  - body_gyro_x_train.txt|body_gyro_x_test.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. The same description applies for the body_gyro_y_train.txt|body_gyro_y_test and body_gyro_z_train.txt|body_gyro_z_test files for the Y and Z axis. 

- X_train.txt|X_test.txt: Using the Inertial Signals data, Jerk and frequency domain signals are calculated, and from them and from the Inertial Signals, a set of features was calculated. X_train.txt|X_test.txt files contain that set of features. Among that set of features, there are the mean and the standard desviation of each signal.
-features.text: This files contains the names of the features of the X_train.txt|X_test.txt files.


<h1 id=contents>Repository Contents</h1>


<table>
<tr><th>File Name</th><th>Description</th></tr>
<tr><td valign=top>README.md</td><td>Documentation explaining the project and how to use files contained in the repository.</td></tr>
<tr><td valign=top>run_analysis.R</td><td>R script to read the Human Activity Recognition Using Smartphones Data Set and produce an ordered data set from it(TidyData.txt).</td></tr>
<tr><td valign=top>Codebook.md</td><td>Documentation about the study design and about the variables of TidyData.txt.</td></tr>
</table>

<h1 id=concepts>Key Concepts</h1>
Most of the R script is really simple. Nevertheless, there are two points that can generate confusion: the loading the text files through loops using eval() and call() functions and how the data sets are merge. 

Why is it used eval() and call() functions? Why is it used an expression as the following?

<code>eval(call("<-", as.name(fileName), read.table(paste(pathTestInsig,fileName,".txt",sep = ""),header = FALSE)))</code>
This expression is used because the following expression won't work:
<code>fileName<-read.table(paste(pathTestInsig,fileName,".txt",sep = ""),header = FALSE)</code>
  This is because fileName's class is character, and in order that the expression above worked, its class should be symbol. The first expression was used instead, obtaining the output that was desired for the second.
  About the merging of the data set, in the Readme.txt that accompanied the raw data files it was implicitly declared that the all the files was ordered according to a common index, not included in the data. So, the use of cbind() to merge the files is correct, since the records are already ordered in the same way.

<h1 id=process>The Process</h1>
The objective is to build a tidy data set with the average of each variable for each activity and each subject from the Human Activity Recognition Using Smartphones Data Set. Despite the output required, 

<h2>Obtain the raw data files</h2>
First, the script checks if the required files are in the working directory. If not, it downloads it to the working directory. Then, it checks if the zip file has been uncompressed in the working directory and uncompress it if not.
<h2>Declare relative paths and file names vectors</h2>
Since the files are distibuted in diferent subdirectories, to avoid typos, all the paths to that subdirectories are stored in string variables. That variables will be used when reading then text files.
Besides, since we decided to read the text files trough loops, we define the character vectors with the names of the files taht will be used in the for loops

<h2>Obtain variable name vectors and Activity labels data frame</h2>
features.txt is loaded, but only its second column is kept. This is the vector with the names of the variables of X_train.txt|X_test.txt. The names for the Inertial signals variables are the concatenation of each variable text file name and a number that identifies the reading. Then activity_labels.txt is loaded as activity_labels data frame.
<h2>Load and obtain the Features data set and Inertial Signal Data set. Add Activity labels</h2>

<h3>Load and obtain Features data set, adding Activity labels</h3>
For every element of the character vector with the test files names, it will be created a data.frame or a vector with the contents of that file. If the file being loaded is Subject_test.txt, then that vector initializes a data frame called testData. 
If the file is Y_test.txt, then first it is added to it a new column with the row numbers that is called "index". Then, Y_test is merged with the activity_labels data frame. This modifies the order that initally had Y_test, and it is required to restore it before we can merged Y_test with the testData data frame. "Index" variable is used to order Y_test and to substitute its row numbers. Then Y_test columns are combined with the ones testData data frame using cbind(). If the file is X_test.txt, then its columns are directly combined with the ones testData data frame using cbind().
The explanation is equivalent for the for loop for train files.
After this two loops, first it is discarded the index that was created in the loop for Y_test or Y_train in testData and trainData, and then a new data frame (featuresData) is produced by appending the rows of trainData to testData. Then, "Key" column is added to that data frame using its row numbers. This variable identifies uniquely each record.


<h2>Subset the mean and standard deviation of each measurement</h2>
From the featuresData data frame, the code extracts a data frame called meanStdData which only contains the "Key", "Subject", "Activity", "ActivityLabel" variables and those variables whose name contains "mean(" or "std(". 
<h2>Set descriptive variables names</h2>
In this section, any punctuation character is removed from the variable names of meanStdData, as well as the abbreviation are substitutedby the complete word. Each word in each variable name has its first letter capitalized.
<h2>Obtain the Final Dataset</h2>
Finally, we use the melt() function over meanStdData so that "Key", "Subject", "Activity", "ActivityLabel" remain as identifiers. This allows us to use dcast() to obtain the average of each variable by "Subject" and "ActivityLabel". This data set (finalData) is exported as "TidyData.txt". 

<h2>Additional notes</h2>
Despite finalData is the only data frame that it is exported, there are another data frames that the R script generates. inertialSignalData is important, since it allows to calculate additional features not included in X_train.txt|X_test.txt. featuresData contains all the features of that files. And finally, meanStdData has the data before melting.
