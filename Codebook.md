# Codebook
Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The purpose of this project is to the ability of the student to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The raw data comes from the Human Activity Recognition Using Smartphones Data Set([http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and it is available at:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The student is asked to create one R script called run_analysis.R that does the following:

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


Decisions:
Load and merge data from Inertial Signal files. Reshape it to long
Key variable identifing record. Assumption of a common index not included.
Extract inly mean( and std( measures
Name the variables capitalizing the first word of each 



## Description of the variables in the tiny_data.txt file General description of the file including:

   Dimensions of the dataset
    Summary of the data
    Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

'data.frame':	180 obs. of  68 variables:
<table border=0 cellpadding=0 cellspacing=0 width=1339 style='border-collapse:
 collapse;table-layout:fixed;width:1005pt'>
 <col width=329 style='mso-width-source:userset;mso-width-alt:12032;width:247pt'>
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
Some information on the variable including:

   Class of the variable
    Unique values/levels of the variable
    Unit of measurement (if no unit of measurement list this as well)
    In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels).
