
# Download, create path & unzip files
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/datasets.zip")
unzip("./data/datasets.zip",exdir = "./data")
path<-file.path("./data","UCI HAR Dataset")
files<-list.files(path,recursive = TRUE)
files

#Read txt and assign to objects
dtActivityTest<-read.table(file.path(path,"test","y_test.txt"),header = FALSE)
dtActivityTrain<-read.table(file.path(path,"train","y_train.txt"),header = FALSE)
dtSubjectTest<-read.table(file.path(path,"test","subject_test.txt"),header = FALSE)
dtSubjectTrain<-read.table(file.path(path,"train","subject_train.txt"),header = FALSE)
dtMeasureTest<-read.table(file.path(path,"test","X_test.txt"),header = FALSE)
dtMeasureTrain<-read.table(file.path(path,"train","X_train.txt"),header = FALSE)

dtMeasureName<-read.table(file.path(path,"features.txt"),header = FALSE)
dtActlabel<-read.table(file.path(path,"activity_labels.txt"),header = FALSE)

# Check properties of objects to ascertain dimensions
str(dtActivityTest)
str(dtActivityTrain)
str(dtSubjectTest)
str(dtSubjectTrain)
str(dtMeasureTest)
str(dtMeasureTrain)

# 1st step: merge 'training' and 'test'  sets to create a unique dataset.Label variables.Create data frame.
dataActivity<-rbind(dtActivityTrain,dtActivityTest)
dataSubject<-rbind(dtSubjectTrain,dtSubjectTest)
dataMeasure<-rbind(dtMeasureTrain,dtMeasureTest)

names(dataActivity)<-c("activity")
names(dataSubject)<-c("subject")
names(dataMeasure)<-dtMeasureName$V2
temp<-cbind(dataSubject,dataActivity)
myData<-cbind(dataMeasure,temp)
str(myData)

#2nd step: Extracts only the measurements on the mean and standard deviation for each measurement

rep_temp<-grep("mean\\(\\)|std\\(\\)", dtMeasureName$V2)
subMeasureName<-as.character(dtMeasureName$V2[rep_temp])
subMeasureName<-c("subject","activity",subMeasureName)
names(myData)
index<-names(myData) %in% subMeasureName
myDataF<-myData[,index]
str(myDataF)

#3rd step: Uses descriptive activity names to name the activities in the data set
myDataF$activity<-factor(myDataF$activity,labels = dtActlabel$V2)
str(myDataF$activity)
head(myDataF$activity,30)

#4rth step: Appropriately labels the data set with descriptive variable names
names(myDataF)<-gsub("^t", "time", names(myDataF))
names(myDataF)<-gsub("^f", "frequency", names(myDataF))
names(myDataF)<-gsub("Acc", "Accelerometer", names(myDataF))
names(myDataF)<-gsub("Gyro", "Gyroscope", names(myDataF))
names(myDataF)<-gsub("Mag", "Magnitude", names(myDataF))
names(myDataF)<-gsub("BodyBody", "Body", names(myDataF))
str(myDataF)
names(myDataF)

#Final step: From the data set in step 4, creates a second, independent tidy data set with
#the average of each variable for each activity and each subject.

myDataAgg<-aggregate(. ~subject + activity, data = myDataF,FUN = mean)
myDataAgg<-myDataAgg[order(myDataAgg$subject,myDataAgg$activity),]

# create space-delimited text file
write.table(x = myDataAgg,file = "./data/tidydata.txt",sep = " ",row.names = FALSE)

