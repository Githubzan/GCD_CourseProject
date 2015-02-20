Code Book for Course Project

Overview

Source of the original data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R performs iteratively the following process to get, clean up and transform the data in order to create the stipulated  dataset.

Preliminary steps

 - Download and unzip data
 - Read text files and assign to objects: y_test ; y_train ; subject_test ; subject_train ; x_test ; x_train 
 
 Data cleaning steps
 
 1st step: 
  - Merge 'training' and 'test'  sets to create a unique dataset.
  - Label variables with descriptive names.Create the  primary data frame by merging features (measures) sets with the above mentioned dataset.
 
 2nd step: 
  - Extraction of only the mean and standard deviation measurements (using regular expression functions).
  - Use naming from activity labels text file.

 3rd step: 
  - From the above labeled data, creation of a second, tidy data set with the average of each variable for each activity and each subject
  - Construction of final space-delimited text file with the tiny dataset. 


Tables & Variables

dtMeasureTest- table contents of test/X_test.txt
dtMeasureTrain - table contents of train/X_train.txt
dtSubjectTest - table contents of test/subject_test.txt
dtSubjectTrain- table contents of test/subject_train.txt
dtActivityTest - table contents of test/y_test.txt
dtActivityTrain - table contents of train/y_train.txt
dtMeasureName- table contents of features.txt
dtActlabel - table contents of activity_labels.txt. Humanly readable.

myData -  data after the first merge
myDataF - labeled data for only the mean and sd measurements
myData - final aggregated data for output 

 
Output


tidyData.txt is a 180x68 data frame.

The first column consists of subject IDs (data type= integer > range 1-30).
The second column consists of activity names (data type = factor variable> WALKING ; WALKING_UPSTAIRS ; WALKING_DOWNSTAIRS; SITTING; STANDING ; LAYING)

The averages for each of the 66 attributes can be found in columns 3-68 (see below, data type = numeric).

 timeBodyAccelerometer-mean()-X                 timeBodyAccelerometer-mean()-Y                
 timeBodyAccelerometer-mean()-Z                 timeBodyAccelerometer-std()-X                 
 timeBodyAccelerometer-std()-Y                  timeBodyAccelerometer-std()-Z                 
 timeGravityAccelerometer-mean()-X              timeGravityAccelerometer-mean()-Y             
 timeGravityAccelerometer-mean()-Z              timeGravityAccelerometer-std()-X              
 timeGravityAccelerometer-std()-Y               timeGravityAccelerometer-std()-Z              
 timeBodyAccelerometerJerk-mean()-X             timeBodyAccelerometerJerk-mean()-Y            
 timeBodyAccelerometerJerk-mean()-Z             timeBodyAccelerometerJerk-std()-X             
 timeBodyAccelerometerJerk-std()-Y              timeBodyAccelerometerJerk-std()-Z             
 timeBodyGyroscope-mean()-X                     timeBodyGyroscope-mean()-Y                    
 timeBodyGyroscope-mean()-Z                     timeBodyGyroscope-std()-X                     
 timeBodyGyroscope-std()-Y                      timeBodyGyroscope-std()-Z                     
 timeBodyGyroscopeJerk-mean()-X                 timeBodyGyroscopeJerk-mean()-Y                
 timeBodyGyroscopeJerk-mean()-Z                 timeBodyGyroscopeJerk-std()-X                 
 timeBodyGyroscopeJerk-std()-Y                  timeBodyGyroscopeJerk-std()-Z                 
 timeBodyAccelerometerMagnitude-mean()          timeBodyAccelerometerMagnitude-std()          
 timeGravityAccelerometerMagnitude-mean()       timeGravityAccelerometerMagnitude-std()       
 timeBodyAccelerometerJerkMagnitude-mean()      timeBodyAccelerometerJerkMagnitude-std()      
 timeBodyGyroscopeMagnitude-mean()              timeBodyGyroscopeMagnitude-std()              
 timeBodyGyroscopeJerkMagnitude-mean()          timeBodyGyroscopeJerkMagnitude-std()          
 frequencyBodyAccelerometer-mean()-X            frequencyBodyAccelerometer-mean()-Y           
 frequencyBodyAccelerometer-mean()-Z            frequencyBodyAccelerometer-std()-X            
 frequencyBodyAccelerometer-std()-Y             frequencyBodyAccelerometer-std()-Z            
 frequencyBodyAccelerometerJerk-mean()-X        frequencyBodyAccelerometerJerk-mean()-Y       
 frequencyBodyAccelerometerJerk-mean()-Z        frequencyBodyAccelerometerJerk-std()-X        
 frequencyBodyAccelerometerJerk-std()-Y         frequencyBodyAccelerometerJerk-std()-Z        
 frequencyBodyGyroscope-mean()-X                frequencyBodyGyroscope-mean()-Y               
 frequencyBodyGyroscope-mean()-Z                frequencyBodyGyroscope-std()-X                
 frequencyBodyGyroscope-std()-Y                 frequencyBodyGyroscope-std()-Z                
 frequencyBodyAccelerometerMagnitude-mean()     frequencyBodyAccelerometerMagnitude-std()     
 frequencyBodyAccelerometerJerkMagnitude-mean() frequencyBodyAccelerometerJerkMagnitude-std() 
 frequencyBodyGyroscopeMagnitude-mean()         frequencyBodyGyroscopeMagnitude-std()         
 frequencyBodyGyroscopeJerkMagnitude-mean()     frequencyBodyGyroscopeJerkMagnitude-std()

