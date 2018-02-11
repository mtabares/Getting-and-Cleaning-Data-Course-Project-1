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
  
The raw data comes from the Human Activity Recognition Using Smartphones Data Set(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and it is available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This data is the results of some experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The raw data includes 
- 'activity_labels.txt': Links the class labels with their activity name.

- subject_train.txt|subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
  

- Y_train.txt|Y_test.txt:  Each row identifies the activity that the subject performed for each window sample. Its range is from 1 to 6.
- total_acc_x_train.txt|total_acc_x_test.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- body_acc_x_train.txt|body_acc_x_test.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- body_gyro_x_train.txt|body_gyro_x_test.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

- X_train.txt|X_test.txt: 

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 





<h1 id=contents>Repository Contents</h1>


<table>
<tr><th>File Name</th><th>Description</th></tr>
<tr><td valign=top>README.md</td><td>Documentation explaining the project and how to use files contained in the repository.</td></tr>
<tr><td valign=top>run_analysis.R</td><td>R script to read</td></tr>
<tr><td valign=top>Codebook.md</td><td>Documentation</td></tr>
</table>

<h1 id=concepts>Key Concepts</h1>
<h2>Loading the text files through loops</h2>
The 
<code>eval(call("<-", as.name(fileName), read.table(paste(pathTestInsig,fileName,".txt",sep = ""),header = FALSE)))</code>

Techniques for reading data from a variety of sources are covered during weeks one and two, including XML, JSON, Excel files, a

  1. Use of <code>eval(call("<-", as.name(fileName), read.table(paste(pathTestInsig,
                                                            fileName,
                                                            ".txt",
                                                            sep = ""),
                                                      header = FALSE)))</code> to split the data into household and person level records,
  

<h1 id=process>The Process</h1>
The objective is to build a tidy data set with the average of each variable for each activity and each subject from the Human Activity Recognition Using Smartphones Data Set. Despite the output required, 



<h2>Obtain the raw data files</h2>
<h2>Declare relative paths and file names vectors</h2>
<h2>Obtain variable name vectors and Activity labels data frame</h2>
<h2>Load and obtain the Features Data set and Inertial Signal Data set. Add Activity labels</h2>
<h2>Subset the mean and standard deviation of each measurement</h2>
<h2>Set descriptive variables names</h2>
<h2>Obtain the Final Dataset</h2>



<h2>Conclusion</h2>
By analyzing the contents of the data and code book spreadsheet, it turns out that there is a very elegant R solution for processing this data. Substituting the high performance <code>readr::read_fwf()</code> for the base <code>read.fwf()</code> it also becomes a high performance solution.  
