#Getting and Cleaning Data Course Project

        
#read in features data
features<-read.table("features.txt", header=FALSE)        
        
#read in training data
xtrain<-read.csv("./train/X_train.txt", sep = "")
ytrain<-read.csv("./train/y_train.txt", sep = "")
subtrain<- read.csv("./train/subject_train.txt", sep= "")


#assign labels to training data
colnames(xtrain)<-features$V2

#read in activity labels
act.labels<-read.table("activity_labels.txt", header=FALSE)
#assign descriptive activity label
for (i in unique(ytrain$X5) ) {
  ytrain$X5<-sub(act.labels[i,"V1"],act.labels[i,"V2"],ytrain$X5)
}

#bind training data together
train<-cbind(subtrain$X1,ytrain$X5,xtrain)
colnames(train)[1]<- "subjectid"
colnames(train)[2]<- "activity"


#read in test data
xtest<-read.csv("./test/X_test.txt", sep = "")
ytest<-read.csv("./test/y_test.txt", sep = "")
subtest<- read.csv("./test/subject_test.txt", sep= "")

#assign labels to test data
colnames(xtest)<-features$V2

#assign descriptive activity labels
for (i in unique(ytest$X5) ) {
  ytest$X5<-sub(act.labels[i,"V1"],act.labels[i,"V2"],ytest$X5)
}

#bind together test data        
test<-cbind(subtest$X2,ytest$X5,xtest)
colnames(test)[1]<- "subjectid"
colnames(test)[2] <- "activity"

#bind test and training data
total <- rbind (test,train)

#find columns for mean and std
meancol<-grep("-mean()", colnames(total), fixed = TRUE)
stdcol<-grep("-std()", colnames(total),fixed=TRUE)
totalmean<- total[,meancol]
totalstd<-total[,stdcol]

#refine total data set to include just subjectid, activity, mean and standard dev data
total<- cbind(total$subjectid,total$activity,totalmean,totalstd)
colnames(total)[1]<- "subject.id"
colnames(total)[2] <- "activity"

#refine variable names
#make lowercase
names(total)<-tolower(names(total))

#remove redundant word
names(total)<-sub("bodybody","body",names(total))

#make the beginning t & f descriptve
names(total)<-sub("^t","time.",names(total))
names(total)<-sub("^f","freq.",names(total))


#remove the parentheses
names(total)<-sub("\\(","",names(total))
names(total)<-sub("\\)","",names(total))

#add in periods for readability
names(total)<-sub("acc",".acceleration",names(total))
names(total)<-sub("gyro",".gyro",names(total))        
names(total)<-gsub("-",".",names(total))
names(total)<-sub("jerk",".jerk", names(total))
names(total)<-sub("mag",".magnitude",names(total))


#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)
melt.total <- melt(total, id=c('subject.id','activity'))
cast.total <- dcast(melt.total, subject.id + activity ~ variable, fun.aggregate=mean)
new<-lapply(names(cast.total)[3:ncol(cast.total)],paste,".average",sep="")
names(cast.total)[3:ncol(cast.total)]<-new
#saves tidy data file
write.table(cast.total,"TidyData.txt")
        

