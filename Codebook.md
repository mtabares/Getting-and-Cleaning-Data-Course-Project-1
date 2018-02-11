# Codebook of Getting and Cleaning Data Course Project

The purpose of this project is to the ability of the student to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The raw data comes from the Human Activity Recognition Using Smartphones Data Set([http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and it is available at:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The student is asked for create one R script called run_analysis.R that does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Study design

### Steps of the Project

   1. Obtain the raw data files

   2. Obtain variable name vectors and Activity labels data frame.
   
   3. Load and obtain the Features data set and Inertial Signal data set. Add Activity labels.
      - Load and obtain Features data set, adding Activity labels.
      - Load and obtain Inertial Signal data set data set, adding Activity labels.
   4. Subset the mean and standard deviation of each measurement.
   5. Set descriptive variables names.
   6. Obtain the Final Dataset.


For detailed information about the steps, please refer to the [Readme.md](https://github.com/danieljmv01/Getting-and-Cleaning-Data-Course-Project/blob/master/Readme.md) file.


### Decisions:
Several decisions has been made that determine the output of the script and how it obtained
#### Inertial signal files:
  The requirement 1 is not clear about the files to be loaded. Since the requirement 2 ask for extract only the mean and standard desviation variables, the inertial signal files will not be used at all, so it is reasonable to think that they are not required by the requirement 2. Nevertheless, I decided to load them an keep their data in a data frame that is available at the end of the code execution (inertialSignalData), but it is not exported. 
  Since every inertial file has 128 variables, one per the 128 readings of each 2.56 second window, and there are 9 files, adding the identifiers ("Key","Subject","Activity", "ActivityLabel"), the data frame has 1156 variables in wide format. In order to make it more user friendly, it is reshaped to long format. So the result is a data set with 14 variables, the 4 initial identifiers, an additional indetifier for the reading number of each window, and 9 variables that match the 9 files of Inertial Signal directory. 
  It is important to note that, even in the long format, the "Key" variable still identifies uniquely each window, so it would be posible to merge this that with the features data set, if someone ever wanted. Nevertheless, the result would be a very large table.
#### Load and Merging of the data sets:
The merge of the data set has been done assuming that the files are order according to a common index that uniquely identifies each record but that was ommited. I worked with this assumption because there is no uniquely identifier in each file, so it was reasonable to suppose that the files are ordered in the same way. This was implicitly declared in the Readme file of the raw data set. 
If the data sets are ordered in the same way ( so the first line of every file is the first record, and so on), if we just combine the columns maintaining the original order, the merge is correct. This is the reason of using cbind(). It was the simplest way to obtain the desired result.
About test and train files, since they were originally the same file appending one to another is enough to obtain the required data set. That is why rbind() were used.

Since thera was a lot of files to be loaded, for-loops were used to load them. This has implications about how the assigning of the loaded data set was done ( the use of eval() and call() functions). Also, in the same loop, the data sets in the same directory are merged in a single data set for that directory. 

#### Labeling of Activity variable:
The requirement 3 is required after the merge of the data sets and the extraction of the mean and standard desviation variables. Nevertheless, due to how the requirement 1 was done in the script (the use of for-loops), the the requirement 3 was done simultaneously with the requirement 1. Adding the Activity labels inside the for-loops was easier than doing it later.

#### Exctraction of the mean and standard desviation variables:
The requirement 2 ask for extracts only the measurements on the mean and standard deviation for each measurement. There are several features whose names that contains "means" or "std" strings. But according to features_info.txt, the features whose names that contains "mean()" and "std()" are those that contain the mean value and the standard desvition. Thus, I considered that these should be the extracted ones and other features (as the features whose names that contains "meanFreq()") must be discarded.
#### Naming of the variables:

The Naming of the variables was done according to the following points:

 -  There must not be any punctuation character in the variable names.
 -  Every word inside a variable name must have its first letter capitalized.
 -  The abbreviations must be susbtituted by its corresponding whole word.


## Codebook of TidyData.txt

  The TidyData.txt is a data set with 180 observations and 68 variables. Those variables are described in following table.

<table border=0 cellpadding=0 cellspacing=0 width=1339 style='border-collapse:
 collapse;table-layout:fixed;width:1005pt'>
 <col width=200 style='mso-width-source:userset;mso-width-alt:12032;width:247pt'>
 <col width=80 style='width:60pt'>
 <col width=97 style='mso-width-source:userset;mso-width-alt:3547;width:73pt'>
 <col width=138 style='mso-width-source:userset;mso-width-alt:5046;width:104pt'>
 <col width=695 style='mso-width-source:userset;mso-width-alt:25417;width:521pt'>
 <tr class=xl6410786 height=20 style='height:15.0pt'>
  <td height=20 class=xl6310786 width=329 style='height:15.0pt;width:247pt;
  font-size:11.0pt;color:white;font-weight:700;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:.5pt solid #4BACC6;
  border-right:none;border-bottom:none;border-left:.5pt solid #4BACC6;
  background:#4BACC6;mso-pattern:#4BACC6 none'>Variable</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:white;
  font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:.5pt solid #4BACC6;border-right:none;
  border-bottom:none;border-left:none;background:#4BACC6;mso-pattern:#4BACC6 none'>Class</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:white;
  font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:.5pt solid #4BACC6;border-right:none;
  border-bottom:none;border-left:none;background:#4BACC6;mso-pattern:#4BACC6 none'>Type</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:white;
  font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:.5pt solid #4BACC6;border-right:none;
  border-bottom:none;border-left:none;background:#4BACC6;mso-pattern:#4BACC6 none'>Units/levels</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:white;
  font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:.5pt solid #4BACC6;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none;background:#4BACC6;mso-pattern:#4BACC6 none'>Description</td>
 </tr>
 <tr class=xl6410786 height=20 style='height:15.0pt'>
  <td height=20 class=xl6310786 width=329 style='height:15.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>Subject</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Integer</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Identifier</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'></td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Identifier of the subject who performed
  the activity for each window sample. Its range is 1 to 30.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>ActivityLabel</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Character</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Identifier</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'></td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Description of the activity that the
  subject performed for each window sample. It has 6 Activity labels: (walking,
  walking_upstairs, walking_downstairs, sitting, standing, laying)</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body acceleration signals per 2.56 seconds window from the
  smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body acceleration signals per 2.56 seconds window from the
  smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body acceleration signals per 2.56 seconds window from the
  smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body acceleration signals per 2.56 seconds
  window from the smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body acceleration signals per 2.56 seconds
  window from the smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body acceleration signals per 2.56 seconds
  window from the smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 gravity acceleration signals per 2.56 seconds window from the
  smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 gravity acceleration signals per 2.56 seconds window from the
  smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 gravity acceleration signals per 2.56 seconds window from the
  smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 gravity acceleration signals per 2.56 seconds
  window from the smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 gravity acceleration signals per 2.56 seconds
  window from the smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 gravity acceleration signals per 2.56 seconds
  window from the smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body Jerk<span style='mso-spacerun:yes'>  </span>acceleration
  signals per 2.56 seconds window from the smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body Jerk<span style='mso-spacerun:yes'>  </span>acceleration
  signals per 2.56 seconds window from the smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body Jerk<span style='mso-spacerun:yes'>  </span>acceleration
  signals per 2.56 seconds window from the smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body Jerk<span style='mso-spacerun:yes'> 
  </span>acceleration signals per 2.56 seconds window from the smartphone
  accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body Jerk<span style='mso-spacerun:yes'> 
  </span>acceleration signals per 2.56 seconds window from the smartphone
  accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body Jerk<span style='mso-spacerun:yes'> 
  </span>acceleration signals per 2.56 seconds window from the smartphone
  accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body angular velocity signals per 2.56 seconds window from
  the smartphone gyroscope X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body angular velocity signals per 2.56 seconds window from
  the smartphone gyroscope Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body angular velocity signals per 2.56 seconds window from
  the smartphone gyroscope Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body angular velocity signals per 2.56 seconds
  window from the smartphone gyroscope X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body angular velocity signals per 2.56 seconds
  window from the smartphone gyroscope Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body angular velocity signals per 2.56 seconds
  window from the smartphone gyroscope Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body Jerk<span style='mso-spacerun:yes'>  </span>angular
  velocity signals per 2.56 seconds window from the smartphone gyroscope X
  axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body Jerk<span style='mso-spacerun:yes'>  </span>angular
  velocity signals per 2.56 seconds window from the smartphone gyroscope Y
  axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the 128 body Jerk<span style='mso-spacerun:yes'>  </span>angular
  velocity signals per 2.56 seconds window from the smartphone gyroscope Z
  axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body Jerk<span style='mso-spacerun:yes'> 
  </span>angular velocity signals per 2.56 seconds window from the smartphone
  gyroscope X axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body Jerk<span style='mso-spacerun:yes'> 
  </span>angular velocity signals per 2.56 seconds window from the smartphone
  gyroscope Y axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the 128 body Jerk<span style='mso-spacerun:yes'> 
  </span>angular velocity signals per 2.56 seconds window from the smartphone
  gyroscope Z axis.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the 128
  body acceleration<span style='mso-spacerun:yes'> 
  </span>three-dimensional<span style='mso-spacerun:yes'>  </span>signals per
  2.56 seconds window from the smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the 128 body acceleration<span style='mso-spacerun:yes'> 
  </span>three-dimensional<span style='mso-spacerun:yes'>  </span>signals per
  2.56 seconds window from the smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the 128
  gravity acceleration<span style='mso-spacerun:yes'> 
  </span>three-dimensional<span style='mso-spacerun:yes'>  </span>signals per
  2.56 seconds window from the smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>GravityAccelerometerMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the 128 gravity acceleration<span style='mso-spacerun:yes'> 
  </span>three-dimensional<span style='mso-spacerun:yes'>  </span>signals per
  2.56 seconds window from the smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the 128
  body Jerk<span style='mso-spacerun:yes'>  </span>acceleration<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyAccelerometerJerkMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the 128 body Jerk<span style='mso-spacerun:yes'> 
  </span>acceleration<span style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the 128
  body angular velocity<span style='mso-spacerun:yes'> 
  </span>three-dimensional<span style='mso-spacerun:yes'>  </span>signals per
  2.56 seconds window from the smartphone gyroscope.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the 128 body angular velocity<span style='mso-spacerun:yes'> 
  </span>three-dimensional<span style='mso-spacerun:yes'>  </span>signals per
  2.56 seconds window from the smartphone gyroscope.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the 128
  body Jerk<span style='mso-spacerun:yes'>  </span>angular velocity<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone gyroscope.</td>
 </tr>
 <tr class=xl6410786 height=40 style='height:30.0pt'>
  <td height=40 class=xl6310786 width=329 style='height:30.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>BodyGyroscopeJerkMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Time domain signals<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the 128 body Jerk<span style='mso-spacerun:yes'>  </span>angular
  velocity<span style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone gyroscope.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity acceleration
  signals per 2.56 seconds window from the smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity acceleration
  signals per 2.56 seconds window from the smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity acceleration
  signals per 2.56 seconds window from the smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity acceleration signals per 2.56 seconds window from the smartphone
  accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity acceleration signals per 2.56 seconds window from the smartphone
  accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity acceleration signals per 2.56 seconds window from the smartphone
  accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity Jerk<span
  style='mso-spacerun:yes'>  </span>acceleration signals per 2.56 seconds
  window from the smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity Jerk<span
  style='mso-spacerun:yes'>  </span>acceleration signals per 2.56 seconds
  window from the smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity Jerk<span
  style='mso-spacerun:yes'>  </span>acceleration signals per 2.56 seconds
  window from the smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity Jerk<span style='mso-spacerun:yes'>  </span>acceleration signals per
  2.56 seconds window from the smartphone accelerometer X axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity Jerk<span style='mso-spacerun:yes'>  </span>acceleration signals per
  2.56 seconds window from the smartphone accelerometer Y axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity Jerk<span style='mso-spacerun:yes'>  </span>acceleration signals per
  2.56 seconds window from the smartphone accelerometer Z axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeMeanX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity angular
  velocity signals per 2.56 seconds window from the smartphone gyroscope X
  axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeMeanY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity angular
  velocity signals per 2.56 seconds window from the smartphone gyroscope Y
  axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeMeanZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Fast Fourier Transformation (FFT) of the 128 gravity angular
  velocity signals per 2.56 seconds window from the smartphone gyroscope Z
  axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeStdX</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity angular velocity signals per 2.56 seconds window from the smartphone
  gyroscope X axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeStdY</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity angular velocity signals per 2.56 seconds window from the smartphone
  gyroscope Y axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeStdZ</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Fast Fourier Transformation (FFT) of the 128
  gravity angular velocity signals per 2.56 seconds window from the smartphone
  gyroscope Z axis.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the Fast
  Fourier Transformation (FFT) of the 128 gravity acceleration<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the Fast Fourier Transformation (FFT) of the 128 gravity
  acceleration<span style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the Fast
  Fourier Transformation (FFT) of the 128 gravity Jerk<span
  style='mso-spacerun:yes'>  </span>acceleration<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyAccelerometerJerkMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Standard gravity units</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the Fast Fourier Transformation (FFT) of the 128 gravity Jerk<span
  style='mso-spacerun:yes'>  </span>acceleration<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone accelerometer.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the Fast
  Fourier Transformation (FFT) of the 128 gravity angular velocity<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone gyroscope.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  standard desviation of the Euclidean norm<span style='mso-spacerun:yes'> 
  </span>of the Fast Fourier Transformation (FFT) of the 128 gravity angular
  velocity<span style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone gyroscope.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:none;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeJerkMagnitudeMean</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:none;border-left:none'>Average by Subject and Activity of the
  mean of the Euclidean norm<span style='mso-spacerun:yes'>  </span>of the Fast
  Fourier Transformation (FFT) of the 128 gravity Jerk<span
  style='mso-spacerun:yes'>  </span>angular velocity<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone gyroscope.</td>
 </tr>
 <tr class=xl6410786 height=60 style='height:45.0pt'>
  <td height=60 class=xl6310786 width=329 style='height:45.0pt;width:247pt;
  font-size:11.0pt;color:black;font-weight:400;text-decoration:none;text-underline-style:
  none;text-line-through:none;font-family:Calibri;border-top:none;border-right:
  none;border-bottom:.5pt solid #4BACC6;border-left:.5pt solid #4BACC6'>FrequencyBodyGyroscopeJerkMagnitudeStd</td>
  <td class=xl6310786 width=80 style='width:60pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:none;border-bottom:
  .5pt solid #4BACC6;border-left:none'>Numeric</td>
  <td class=xl6310786 width=97 style='width:73pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:none;border-bottom:
  .5pt solid #4BACC6;border-left:none'>Frequency domain signals</td>
  <td class=xl6310786 width=138 style='width:104pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:none;border-bottom:
  .5pt solid #4BACC6;border-left:none'>Radians/second</td>
  <td class=xl6310786 width=695 style='width:521pt;font-size:11.0pt;color:black;
  font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
  none;font-family:Calibri;border-top:none;border-right:.5pt solid #4BACC6;
  border-bottom:.5pt solid #4BACC6;border-left:none'>Average by Subject and
  Activity of the standard desviation of the Euclidean norm<span
  style='mso-spacerun:yes'>  </span>of the Fast Fourier Transformation (FFT) of
  the 128 gravity Jerk<span style='mso-spacerun:yes'>  </span>angular velocity<span
  style='mso-spacerun:yes'>  </span>three-dimensional<span
  style='mso-spacerun:yes'>  </span>signals per 2.56 seconds window from the
  smartphone gyroscope.</td>
